//
//  DetailsViewController.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/25/21.
//

import UIKit

class DetailsViewController: UIViewController,Storyboarded {
    var detailsViewModel : DetailsViewModel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }

    func updateUi(){
        let item = detailsViewModel.item!
        titleLabel.text = item.data?[0].title
        dateLabel.text = item.data?[0].date_created
        centerLabel.text = item.data?[0].center
        descTextView.text = (item.data?[0].description)! + " https://images-assets.nasa.gov/image/ARC-2002-ACD02-0056-06/ARC-2002-ACD02-0056-06~thumb.jpg"
        let urlString = (item.links?[0].href ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        img.imageFromUrl(urlString!, disposeBag: self.detailsViewModel.disposeBag)
    }

}

