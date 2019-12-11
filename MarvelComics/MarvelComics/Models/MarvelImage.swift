//
//  MarvelImage.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import Foundation

struct MarvelImage: Decodable
{
    var path: String?
    var marvelExtension: String?
    
    enum CodingKeys: String, CodingKey
    {
        case path
        case marvelExtension = "extension"
    }
}
