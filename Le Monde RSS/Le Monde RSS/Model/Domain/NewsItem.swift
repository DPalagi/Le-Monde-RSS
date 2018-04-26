//
//  NewsItem.swift
//  Le Monde RSS
//
//  Created by Jeremy Benabu on 25/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import Foundation
import XMLMapper

class NewsItem: XMLMappable {

    // MARK: - variables
    var nodeName: String! = "item"

    var link: String?

    var title: String?

    var itemDescription: String?

    // MARK: - initialisation

    required init(map: XMLMap) {

    }

    func mapping(map: XMLMap) {
        title <- map["title"]
    }
}
