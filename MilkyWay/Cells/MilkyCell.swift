//
//  MilkyCell.swift
//  MilkyWay
//
//  Created by Mohamed Magdy on 11/25/21.
//

import Foundation
import RxSwift

class MilkyCell:UITableViewCell{
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var disposeBag = DisposeBag()


    override func prepareForReuse() {
            super.prepareForReuse()

            disposeBag = DisposeBag()
        }
}
