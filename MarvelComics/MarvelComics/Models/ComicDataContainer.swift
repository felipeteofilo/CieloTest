//
//  ComicDataContainer.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import Foundation

struct ComicDataContainer: Decodable
{
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [Comic]?
}


