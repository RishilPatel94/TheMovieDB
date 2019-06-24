//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Rish on 6/23/19.
//  Copyright © 2019 Rishil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableList : UITableView!
    
    var movieList = [MovieResult]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    private func setUI(){
        self.title = "UpComing List"
        let router : APIRouter! = APIRouter.getUpcomingMovieList
        fetchMovieList(router: APIRouter.getUpcomingMovieList)
    }
    private func fetchMovieList(router:APIRouter) {
        BaseApiClient.default.fetch(request: router) { (response:Movie?) in
            if response != nil{
                if let result = response?.results , result.count > 0 {
                    self.movieList = (response?.results)!
                    self.tableList.dataSource = self
                    self.tableList.delegate = self
                    self.tableList.reloadData()
                }
            }
        }
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieListCell
        let movieDetail = movieList[indexPath.row]
        cell.lblName.text = movieDetail.originalTitle
        let urlString = "\(K.ItunesURl.imgBaseURL)\(movieDetail.posterPath ?? "")"
        if let url = URL(string:  urlString){
            cell.imgView.kf.setImage(with: url, placeholder: UIImage(named: "placeHolderImage"))
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetail = movieList[indexPath.row]
        
        let viewDetails = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let urlString = "\(K.ItunesURl.imgBaseURL)\(movieDetail.posterPath ?? "")"
        let movieData = ["name" : movieDetail.originalTitle!, "image" : urlString,  "overview" : movieDetail.overview!, "releasedate" : movieDetail.releaseDate!] as [String : Any]
        
        viewDetails.arrDetails = movieData
        viewDetails.arrGenre = movieDetail.genreIds!
        self.navigationController?.pushViewController(viewDetails, animated: true)
    }
    
}
