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
    var comicThumbnailUrl: String
    
    //Dependency Injection
    init(comic: Comic)
    {
        comicName = comic.title ?? ""
        comicDescription = comic.description ?? ""
        
        //init the url of image
        comicThumbnailUrl = comic.thumbnail?.path ?? ""
        comicThumbnailUrl.append(".")
        comicThumbnailUrl.append(comic.thumbnail?.marvelExtension ?? "")
    }
}
