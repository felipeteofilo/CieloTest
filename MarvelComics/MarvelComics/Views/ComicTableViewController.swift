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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //fetch all comics
        serviceComics.fetchComics { comics, error in
            
            //case happened some error
            guard error != nil else
            {
                //shows the error
                self.showErrorMessage(error: error!)
                return
            }
            
            //map the viewModels
            self.comicViewModels = comics?.map({return ComicViewModel(comic: $0)}) ?? []
            
            //reload the data from tableview
            self.tableView.reloadData()
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
    
    func showErrorMessage(error: Error)
    {
        let alertError = UIAlertController.init(title: "Warning", message: error.localizedDescription, preferredStyle: .alert)
        
        let actionOk = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        
        //set the action on the alert
        alertError.addAction(actionOk)
        
        //show the alert
        show(alertError, sender: self)
    }
}

