//
//  ComicDetailsViewController.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import UIKit

class ComicDetailsViewController: UIViewController
{
    @IBOutlet var lblComicName: UILabel!
    @IBOutlet var textViewComicDescription: UITextView!
    @IBOutlet var lblLastModified: UILabel!
    @IBOutlet var lblFormat: UILabel!
    @IBOutlet var lblNumberOfPages: UILabel!
    @IBOutlet var lblEAN: UILabel!
    @IBOutlet var lblISSN: UILabel!
    @IBOutlet var lblCreator: UILabel!
    @IBOutlet var lblCharacter: UILabel!
    @IBOutlet var imgThumbnail: UIImageView!
    
    var comicViewModel: ComicViewModel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //set all the information of the screen
        lblComicName.text = comicViewModel.comicName
        textViewComicDescription.attributedText = comicViewModel.comicDescription.htmlToAttributedString
        lblLastModified.text = comicViewModel.comicModified
        lblFormat.text = comicViewModel.comicFormat
        lblNumberOfPages.text = comicViewModel.comicPageCount
        lblEAN.text = comicViewModel.comicEAN
        lblISSN.text = comicViewModel.comicISSN
        lblCreator.text = comicViewModel.comicCreators
        lblCharacter.text = comicViewModel.comicCharacters
        imgThumbnail.loadImage(fromURL: comicViewModel.comicThumbnailUrl)
    }
}
