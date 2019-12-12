//
//  MarvelComicsTests.swift
//  MarvelComicsTests
//
//  Created by Felipe Teofilo on 09/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import XCTest
@testable import MarvelComics

class MarvelComicsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModel()
    {
        let marvelImage = MarvelImage.init(path: "www.teste.com.br/imagem", marvelExtension: "jpg")
        
        //creator summarys
        let creator1 = CreatorSummary.init(resourceURI: "", name: "Robert", role: "")
        let creator2 = CreatorSummary.init(resourceURI: "", name: "Jerry", role: "")
        
        let creatorList = CreatorList.init(available: 2, returned: 2, collectionURI: "", items: [creator1, creator2])
        
        //characters summarys
        let character1 = CharacterSummary.init(resourceURI: "", name: "Storm", role: "")
        let character2 = CharacterSummary.init(resourceURI: "", name: "Hulk", role: "")
        
        let characterList = CharacterList.init(available: 2, returned: 2, collectionURI: "", items: [character1, character2])
        
        //create the comic
        let comic = Comic.init(id: 0, digitalId: 0, title: "Test", issueNumber: 0, variantDescription: "", description: "Test description", modified: Date.init(), isbn: "5", upc: "", diamondCode: "", ean: "", issn: "", format: "", pageCount: 0, textObjects: nil, resourceURI: "", urls: nil, series: nil, variants: nil, collections: nil, collectedIssues: nil, dates: nil, prices: nil, thumbnail:marvelImage, images: nil, creators: creatorList, characters: characterList, stories: nil, events: nil)
        
        //init the view model
        let comicViewModel = ComicViewModel(comic: comic)
        
        //start the comparation
        XCTAssertEqual(comic.title, comicViewModel.comicName)
        XCTAssertEqual(comic.description, comicViewModel.comicDescription)
        XCTAssertEqual(comic.ean, comicViewModel.comicEAN)
        XCTAssertEqual(comic.issn, comicViewModel.comicISSN)
        XCTAssertEqual(comic.format, comicViewModel.comicFormat)
        
        var comicModifiedAux: String
        
        //case the modified date isn`t nil
        if let dateAux = comic.modified
        {
            //set the modified value
            let dateFormatter = DateFormatter.init()
            dateFormatter.dateFormat = "dd/MM/YYYY"
            
            //set the mofied text
            comicModifiedAux = dateFormatter.string(from: dateAux)
        }
        else
        {
            comicModifiedAux = ""
        }
        
        XCTAssertEqual(comicModifiedAux, comicViewModel.comicModified)
        
        var comicPageCountAux: String
        
        //verify the number of pages
        if((comic.pageCount ?? 0) > 0)
        {
            comicPageCountAux = "\(comic.pageCount!) pages"
        }
        else
        {
            comicPageCountAux = ""
        }
        
        XCTAssertEqual(comicPageCountAux, comicViewModel.comicPageCount)
        
        //init the creators
        var comicCreatorsAux = ""
        
        //look for all creator of this comic
        if(comic.creators?.items != nil)
        {
            //get all creators from the list
            for creator in comic.creators!.items!
            {
                //set the creator and jump the line
                comicCreatorsAux.append(creator.name ?? "")
                
                //case isn the last one
                if(comic.creators!.items!.last?.name != creator.name)
                {
                    //add the line jump
                    comicCreatorsAux.append("\n")
                }
            }
        }
        
        XCTAssertEqual(comicCreatorsAux, comicViewModel.comicCreators)
        
        //init the characters
        var comicCharactersAux = ""
        
        //look for all characters of this comic
        if(comic.characters?.items != nil)
        {
            //get all characters from the list
            for character in comic.characters!.items!
            {
                //set the character and jump the line
                comicCharactersAux.append(character.name ?? "")
                
                //case isn the last one
                if(comic.characters!.items!.last?.name != character.name)
                {
                    //add the line jump
                    comicCharactersAux.append("\n")
                }
            }
        }
        
        XCTAssertEqual(comicCharactersAux, comicViewModel.comicCharacters)
        
        //init the url of image
        var comicThumbnailUrlAux = comic.thumbnail?.path ?? ""
        comicThumbnailUrlAux.append(".")
        comicThumbnailUrlAux.append(comic.thumbnail?.marvelExtension ?? "")
        
        XCTAssertEqual(comicThumbnailUrlAux, comicViewModel.comicThumbnailUrl)
    }
    
    func testService()
    {
        let expectation = XCTestExpectation(description: "Models Created")
        
        let serviceComics = ServiceComic()
        var comicViewModels = [ComicViewModel]()
        
        //fetch all comics
        serviceComics.fetchComics { comics, error in
            
            //case happened some error
            if( error != nil)
            {
                //shows the error
                XCTFail("Service error")
            }
            else
            {
                //map the viewModels
                comicViewModels = comics?.map({return ComicViewModel(comic: $0)}) ?? []
                
                if(comicViewModels.count > 0)
                {
                    expectation.fulfill()
                }
            }
        }
        
        wait(for: [expectation], timeout: 30.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
