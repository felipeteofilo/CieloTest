//
//  TextObject.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import Foundation

struct TextObject: Decodable
{
    var type: String?
    var language: String?
    var text: String?
}
