//
//  Service.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import Foundation

class Service
{
    func loadData(urlString: String, session: URLSession = URLSession(configuration: .default), completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask?
    {
        //init the URL
        if let url = URL(string: urlString)
        {
            //init the request
            let task = session.dataTask(with: url) { data, urlResponse, error in
                
                //if a error ocurred with the communication
                if let error = error
                {
                    //call completion with the error
                    completion(.failure(.network(string: "An error occured during request :" + error.localizedDescription)))
                    return
                }
                if let response = urlResponse as? HTTPURLResponse
                {
                    if (response.statusCode == 200)
                    {
                        //case the data was retrieved from communication
                        if let data = data
                        {
                            //call the completion with the data
                            completion(.success(data))
                        }
                    }
                    else
                    {
                        //call completion with the error
                        completion(.failure(.network(string: "An error occured on server response")))
                        return
                    }
                }
                else
                {
                    //call completion with the error
                    completion(.failure(.network(string: "An error occured on server respons")))
                    return
                }
            }
            
            //start the request
            task.resume()
            return task
        }
        else
        {
            //case the URL is wrong
            completion(.failure(.network(string: "Wrong url format")))
            return nil
        }
    }
}
