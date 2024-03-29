//
//  ComicTableViewController.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 09/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import UIKit

class ComicTableViewController: UITableViewController
{
    let serviceComics = ServiceComic()
    
    var comicViewModels = [ComicViewModel]()
    
    var comicViewModelSelected: ComicViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //set the action of refresh
        refreshControl?.addTarget(self, action: #selector(downloadComics), for:.valueChanged)
        
        //start the download of comics
        downloadComics()
    }
    
    //MARK: - Communication
    @objc func downloadComics()
    {
        //init the refresh
        refreshControl?.beginRefreshing()
        
        //fetch all comics
        serviceComics.fetchComics { [unowned self] comics, error in
            
            //stop refresh
            self.refreshControl?.endRefreshing()
            
            //case happened some error
            if( error != nil)
            {
                //shows the error
                self.showErrorMessage(error: error!)
            }
            else
            {
                //map the viewModels
                self.comicViewModels = comics?.map({return ComicViewModel(comic: $0)}) ?? []
                
                //reload the data from tableview
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - TableView DataSource and Delegate
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //return the number of comics
        return comicViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //init the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "comicCell", for: indexPath) as! ComicCell
        
        //get the view model
        let comicViewModelAux = comicViewModels[indexPath.row]
        
        //set the view model on cell
        cell.comicViewModel = comicViewModelAux
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //remove the selection
        tableView.deselectRow(at: indexPath, animated: true)
        
        //save the selected model
        comicViewModelSelected = comicViewModels[indexPath.row]
        
        //go to the view of details
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //case was the segue to show details
        if(segue.identifier == "showDetails")
        {
            //case the view to go is kid of ComicDetails
            if let viewDetails = segue.destination as? ComicDetailsViewController
            {
                //pass the comic selected
                viewDetails.comicViewModel = comicViewModelSelected
            }
        }
    }
    
    //MARK: - Mesages
    func showErrorMessage(error: Error)
    {
        let alertError = UIAlertController.init(title: "An error occured", message: "Oops, something went wrong! Please try again later...", preferredStyle: .alert)
        
        let actionOk = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        
        //set the action on the alert
        alertError.addAction(actionOk)
        
        //show the alert
        present(alertError, animated: true, completion: nil)
    }
}

