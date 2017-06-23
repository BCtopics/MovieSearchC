//
//  MovieListTableViewController.swift
//  MovieSearchC
//
//  Created by Bradley GIlmore on 6/23/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: - UISearchBarDelegate Functions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { NSLog("Invalid searchterm"); return }
        
        BPGMovieController.fetchMovie(forSearchTerm: searchTerm) { (movies) in
            
            self.movies = movies
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? BPGMovieTableViewCell else { NSLog("Incorrect Cell"); return UITableViewCell() }
        
        let movie = self.movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.ratingLabel.text = "Rating: \(movie.rating)"
        cell.summaryLabel.text = movie.summary
        
        return cell
    }
    
    //MARK: - Properties
    
    var movies = [BPGMovie](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}
