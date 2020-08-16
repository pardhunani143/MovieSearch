//
//  Movie.swift
//  DataManager
//
//  Created by Usha on 15/08/2020.
//  Copyright © 2020 developers. All rights reserved.
//

import Foundation

public class MovieResult : Codable{
    public let page: Int
    public let totalResults: Int?
    public let totalPages: Int?
    public let results: [Movie]

    public enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

public class Movie: Codable {
    public let posterPath: String?
    public let title: String?
    public let voteAverage: Double?
    public let releaseDate: Date?
    
    public  enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
        case releaseDate="release_date"
      }
}
