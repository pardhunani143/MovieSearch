//
//  DataManager.swift
//  DataManager
//
//  Created by Usha on 15/08/2020.
//  Copyright © 2020 developers. All rights reserved.
//

import Foundation
import StaticLib


public class DataManager {
    
    public init(){
    
    }
    
    var FinalMovies = [Movie]()
    var cMovies = [MovieList]()

    public func fetchMovies(query:String,completion: @escaping(_ MovieDict: [MovieList]?, _ error: Error?) -> ()) {
        
        let URLsession = URLSession.shared
        
    
        // rest api call to serach novies
        URLsession.dataTask(with:URL(string:"https://api.themoviedb.org/3/search/movie?api_key=e431e2142d3330cb4f584dbe5672c116&language=en-US&query=\(query)&page=1&include_adult=false")!,
            completionHandler: { data, response, error in

         guard let data = data, error == nil else {
             return
         }
                
         // Convertind data
         var result: MovieResult?
         do {
            let jsonDecoder: JSONDecoder = {

                let jsonDecoder = JSONDecoder()

                let dateFormatter = DateFormatter()

                dateFormatter.dateFormat = "yyyy-mm-dd"

                jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)

                return jsonDecoder

            }()

            result = try jsonDecoder.decode(MovieResult.self, from: data)
         }
         catch {
             print("error")
         }

         guard let finalResult = result else {
             return
         }

         // Update movies array
         let newMovies = finalResult.results
         self.FinalMovies = []
         var movieLists = [MovieList]()
                
                
        for Movie in newMovies {
            let components = Calendar.current.dateComponents([.year,.month, .day], from: Movie.releaseDate!)
            if components.year! >= 2017 && components.year! <= 2018 {
                print(Movie)
                self.FinalMovies.append(Movie)
                           
            }
        }
                
        for FinalMovie in self.FinalMovies {
            var moview = MovieList()
            if let str = FinalMovie.title{
                moview.originalTitle = strdup(str)
            }
                    
            moview.voteAverage=FinalMovie.voteAverage!
            if let poster = FinalMovie.posterPath{
                moview.posterPath = strdup(poster)
            }
            movieLists.append(moview)
            
        }                
                
        // calling c static lib function to sort movies based on rating
            
        SortMovieRating(&movieLists, self.FinalMovies.count)
              
        completion(movieLists, nil)
       
        }).resume()
    }
}
