//
//  Item.swift
//  InternetShopApp
//
//  Created by Miras Alimov on 04.02.2021.
//

import Foundation

public struct Item: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let price: Float?
    let image: String?
}
