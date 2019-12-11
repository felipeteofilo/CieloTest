//
//  Result.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import Foundation

enum Result<T, E: Error>
{
    case success(T)
    case failure(E)
}
