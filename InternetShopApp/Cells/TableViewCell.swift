//
//  TableViewCell.swift
//  InternetShopApp
//
//  Created by Miras Alimov on 02.02.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cartButton: UIButton!
    
    var delegate: ViewControllerDelegate?
    var index: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addToCart(_ sender: Any) {
        delegate?.addToCart(index!)
    }
    
}
