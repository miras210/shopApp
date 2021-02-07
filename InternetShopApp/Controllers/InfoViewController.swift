//
//  InfoViewController.swift
//  InternetShopApp
//
//  Created by Miras Alimov on 07.02.2021.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    var item: Item = Item(id: -1, title: "Null", description: "Null", price: -1, image: nil)
    var index = 0
    var delegate: ViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        myImage.image = UIImage(named: String(item.image!))
        itemTitle.text = item.title
        itemDescription.text = item.description
        itemPrice.text = String(item.price!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToCart(_ sender: Any) {
        delegate?.addToCart(index)
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
