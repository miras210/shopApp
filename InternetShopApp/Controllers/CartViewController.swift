//
//  CartViewController.swift
//  InternetShopApp
//
//  Created by Miras Alimov on 07.02.2021.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: ViewControllerDelegate?
    var cart: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        cart = delegate!.getCart()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func buy(_ sender: Any) {
        let alert = UIAlertController(title: "Thanks", message: "Please come back!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                    self.cart = []
                    self.delegate?.eraseCart()
                    self.tableView.reloadData()
                }))
                self.present(alert, animated: true, completion: nil)
    }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.myImg.image = UIImage(named: cart[indexPath.row].image!)
        cell.titleLabel.text = cart[indexPath.row].title
        cell.descriptionLabel.text = cart[indexPath.row].description
        cell.priceLabel.text = String(cart[indexPath.row].price!)
        cell.cartButton.isHidden = true
        return cell
    }
    
    
}
