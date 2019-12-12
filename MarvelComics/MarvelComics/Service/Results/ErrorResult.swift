//
//  ErrorResult.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import Foundation

enum ErrorResult: Error
{
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
