//
//  ComicViewModel.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import UIKit

struct ComicViewModel
{
    var comicName: String
    var comicDescription: String
    var comicModified: String
    var comicEAN: String
    var comicISSN: String
    var comicFormat: String
    var comicPageCount: String
    var comicCreators: String
    var comicCharacters: String
    var comicThumbnailUrl: String
    
    //Dependency Injection
    init(comic: Comic)
    {
        comicName = comic.title ?? ""
        comicDescription = comic.description ?? ""
        comicEAN = comic.ean ?? ""
        comicISSN = comic.issn ?? ""
        comicFormat = comic.format ?? ""
        
        //verify the number of pages
        if((comic.pageCount ?? 0) > 0)
        {
            comicPageCount = "\(comic.pageCount!) pages"
        }
        else
        {
            comicPageCount = ""
        }
        
        //case the modified date isn`t nil
        if let dateAux = comic.modified
        {
            //set the modified value
            let dateFormatter = DateFormatter.init()
            dateFormatter.dateFormat = "dd/MM/YYYY"
            
            //set the mofied text
            comicModified = dateFormatter.string(from: dateAux)
        }
        else
        {
            comicModified = ""
        }
        
        //init the creators
        comicCreators = ""
        
        //look for all creator of this comic
        if(comic.creators?.items != nil)
        {
            //get all creators from the list
            for creator in comic.creators!.items!
            {
                //set the creator and jump the line
                comicCreators.append(creator.name ?? "")
                
                //case isn the last one
                if(comic.creators!.items!.last?.name != creator.name)
                {
                    //add the line jump
                    comicCreators.append("\n")
                }
            }
        }
        
        //init the creators
        comicCharacters = ""
        
        //look for all characters of this comic
        if(comic.characters?.items != nil)
        {
            //get all characters from the list
            for character in comic.characters!.items!
            {
                //set the character and jump the line
                comicCharacters.append(character.name ?? "")
                
                //case isn the last one
                if(comic.characters!.items!.last?.name != character.name)
                {
                    //add the line jump
                    comicCharacters.append("\n")
                }
            }
        }
        
        //init the url of image
        comicThumbnailUrl = comic.thumbnail?.path ?? ""
        comicThumbnailUrl.append(".")
        comicThumbnailUrl.append(comic.thumbnail?.marvelExtension ?? "")
    }
}
