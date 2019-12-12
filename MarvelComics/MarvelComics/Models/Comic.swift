//
//  Comic.swift
//  MarvelComics
//
//  Created by Felipe Teofilo on 10/12/19.
//  Copyright © 2019 Felipe Teofilo. All rights reserved.
//

import Foundation

struct Comic: Decodable
{
    var id: Int?
    var digitalId: Int?
    var title: String?
    var issueNumber: Double?
    var variantDescription: String?
    var description: String?
    var modified: Date?
    var isbn: String?
    var upc: String?
    var diamondCode: String?
    var ean: String?
    var issn: String?
    var format: String?
    var pageCount: Int?
    var textObjects: [TextObject]?
    var resourceURI: String?
    var urls: [MarvelUrl]?
    var series: SeriesSummary?
    var variants: [ComicSummary]?
    var collections: [ComicSummary]?
    var collectedIssues: [ComicSummary]?
    var dates: [ComicDate]?
    var prices: [ComicPrice]?
    var thumbnail: MarvelImage?
    var images: [MarvelImage]?
    var creators: CreatorList?
    var characters: CharacterList?
    var stories: StoryList?
    var events: EventList?
}


