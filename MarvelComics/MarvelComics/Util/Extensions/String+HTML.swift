//
//  String+HTML.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 12/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import UIKit

extension String
{
    var htmlToAttributedString: NSAttributedString?
    {
        guard let data = data(using: .utf8) else {
            return NSAttributedString()
        }
        
        do
        {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch
        {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String
    {
        return htmlToAttributedString?.string ?? ""
    }
}
