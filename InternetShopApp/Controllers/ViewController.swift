//
//  ViewController.swift
//  InternetShopApp
//
//  Created by Miras Alimov on 02.02.2021.
//

import UIKit

protocol ViewControllerDelegate {
    func addToCart(_ index: Int)
    func getCart() -> [Item]
    func eraseCart()
}

class ViewController: UIViewController {
    
    var items: [Item] = []
    var cart: [Item] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        populateData()
    }
    
    func populateData() {
        items.append(Item(id: -1, title: "ASUS ROG STRIX", description: "That's one of the best laptops ever", price: 1, image: "1.jpg"))
        items.append(Item(id: -1, title: "ASUS ROG STRIX", description: "That's one of the best laptops ever", price: 1, image: "1.jpg"))
        items.append(Item(id: -1, title: "ASUS ROG STRIX", description: "That's one of the best laptops ever", price: 1, image: "1.jpg"))
        items.append(Item(id: -1, title: "ASUS ROG STRIX", description: "That's one of the best laptops ever lorem ipsum verta asdasdasdasd", price: 1,image: "1.jpg"))
        items.append(Item(id: -1, title: "test", description: "test", price: 1,image: "1.jpg"))
        items.append(Item(id: -1, title: "test", description: "test", price: 1,image: "1.jpg"))
        items.append(Item(id: -1, title: "test", description: "test", price: 1,image: "1.jpg"))
        items.append(Item(id: -1, title: "test", description: "test", price: 1,image: "1.jpg"))
        items.append(Item(id: -1, title: "test", description: "test", price: 1,image: "1.jpg"))
        items.append(Item(id: -1, title: "test", description: "test", price: 1,image: "1.jpg"))
    }

    @IBAction func viewChanged(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            tableView.isHidden = false
            collectionView.isHidden = true
        } else {
            tableView.isHidden = true
            collectionView.isHidden = false
        }
    }
    
    @IBAction func toCart(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CartViewController") as! CartViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = items[indexPath.row].title
        cell.descriptionLabel.text = items[indexPath.row].description
        cell.priceLabel.text = "\(items[indexPath.row].price ?? 0)"
        cell.myImg.image = UIImage(named: "\(items[indexPath.row].image ?? "null")")
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "InfoViewController") as! InfoViewController
        vc.item = items[indexPath.row]
        vc.index = indexPath.row
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "InfoViewController") as! InfoViewController
        vc.item = items[indexPath.row]
        vc.index = indexPath.row
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = items[indexPath.row].title
        cell.descriptionLabel.text = items[indexPath.row].description
        cell.priceLabel.text = "\(items[indexPath.row].price ?? 0)"
        cell.myImg.image = UIImage(named: "\(items[indexPath.row].image ?? "null")")
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    

}

extension ViewController: ViewControllerDelegate {
    func eraseCart() {
        cart = []
    }
    
    func getCart() -> [Item] {
        return cart
    }
    
    func addToCart(_ index: Int) {
        cart.append(items[index])
    }
}
