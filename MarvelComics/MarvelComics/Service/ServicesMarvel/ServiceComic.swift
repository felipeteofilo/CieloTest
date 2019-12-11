//
//  ServiceComic.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import Foundation

class ServiceComic
{
    //init The URL to comunicate
    let urlComics = MARVEL_BASE_URL + "/v1/public/comics" + API_KEY
    
    //the task session
    var task : URLSessionTask?
    
    func fetchComics(completion: @escaping ([Comic]?, Error?) -> Void)
    {
        let service = Service()
        
        // cancel previous request if already in progress
        self.cancelFetchComics()
        
        //init the request
        task = service.loadData(urlString: urlComics) { result in
            
            switch result
            {
            case .success(let data) :
                
                //decode the json objet
                if let comicDataWrapper = try? JSONDecoder().decode(ComicDataWrapper.self, from:data)
                {
                    //calls the completion on the main thread
                    DispatchQueue.main.async{
                        
                        //call the completion with the comics
                        completion(comicDataWrapper.data?.results, nil)
                    }
                }
                else
                {
                    //calls the completion on the main thread
                    DispatchQueue.main.async{
                        //call the completion with the error of decoder
                        completion(nil, ErrorResult.parser(string: "Error decoding Comics"))
                    }
                }
            case .failure(let error) :
                
                //calls the completion on the main thread
                DispatchQueue.main.async{
                    
                    //if something was wrong with the request
                    completion(nil, error)
                }
            }
        }
    }
    
    func cancelFetchComics()
    {
        //case the task was running
        if let task = task
        {
            //cancel the task
            task.cancel()
        }
        
        task = nil
    }
}
