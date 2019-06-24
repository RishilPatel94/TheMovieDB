//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Rish on 6/23/19.
//  Copyright © 2019 Rishil. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var arrDetails = [String : Any]()
    var arrGenre = [Int]()
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var imgPoster : UIImageView!
    @IBOutlet weak var lblGenre : UILabel!
    @IBOutlet weak var colGenre : UICollectionView!
    @IBOutlet weak var lblOverView : UITextView!
    @IBOutlet weak var lblReleaseDate : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDetails()
        // Do any additional setup after loading the view.
    }
    private func setDetails(){
        self.title = "Movie Details"
        lblName.text = arrDetails["name"] as? String
        if let url = URL(string:  (arrDetails["image"] as? String)!){
            imgPoster.kf.setImage(with: url, placeholder: UIImage(named: "placeHolderImage"))
        }
        colGenre.dataSource = self
        lblOverView.text = "OverView : \(arrDetails["overview"] as? String ?? "")"
        lblReleaseDate.text = "Release Date: \(arrDetails["releasedate"] as? String ?? "")"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrGenre.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! GenreCell
       cell.lblGenre.text = "\(arrGenre[indexPath.item])"
       return cell
        
    }
    
    
}
