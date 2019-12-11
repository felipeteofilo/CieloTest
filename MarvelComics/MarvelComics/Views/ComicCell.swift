//
//  ComicCell.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import UIKit

class ComicCell: UITableViewCell
{
    var comicViewModel: ComicViewModel!
    {
        didSet
        {
            lblTitle.text = comicViewModel.comicName
            lblDescription.text = comicViewModel.comicDescription
            imgThumbnail.loadImage(fromURL: comicViewModel.comicThumbnailUrl)
        }
    }

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var imgThumbnail: UIImageView!
}
