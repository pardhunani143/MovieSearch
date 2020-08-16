//
//  ViewController.swift
//  MovieSearcher
//
//  Created by Usha on 15/08/2020.
//  Copyright © 2020 developers. All rights reserved.
//

import UIKit
import DataManager
import StaticLib

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table : UITableView!
    @IBOutlet var field : UITextField!
    
    var datamanager = DataManager()
    var movies = [MovieList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }
    
    // search field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }

    func searchMovies() {
        
        field.resignFirstResponder()
        guard let text =  field.text, !text.isEmpty else {
            return
        }
        
        let query = text.replacingOccurrences(of: " ", with: "%20")
              
        movies.removeAll()
               
        datamanager.fetchMovies( query: query){
            movieList, err in self.movies.append(contentsOf:movieList!)
            
            // Refresh  table
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
               
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
           cell.configure(with: movies[indexPath.row])
           return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 120
       }
}


