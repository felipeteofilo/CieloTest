//
//  CharacterList.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import Foundation

struct CharacterList: Decodable
{
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [CharacterSummary]?
}
