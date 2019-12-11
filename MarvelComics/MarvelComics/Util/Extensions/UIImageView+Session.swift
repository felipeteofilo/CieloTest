//
//  UIImageView+Session.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import UIKit

extension UIImageView
{
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit)
    {
        //set the mode of image
        contentMode = mode
        
        //start the request for the image
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            //verify if all things are right with the response
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else
            {
                //if something was wrong don't set nothing
                return
            }
            
            DispatchQueue.main.async() {
                //case the image is right set the image
                self.image = image
            }
            
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit)
    {
        //init the url from the link
        guard let url = URL(string: link) else
        {
            //case something wrong with the link
            return
        }
        
        //start the download of image from the url
        downloaded(from: url, contentMode: mode)
    }
}
