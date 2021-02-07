//
//  CollectionViewCell.swift
//  InternetShopApp
//
//  Created by Miras Alimov on 02.02.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var delegate: ViewControllerDelegate?
    var index: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addToCart(_ sender: Any) {
        delegate?.addToCart(index!)
    }
}
