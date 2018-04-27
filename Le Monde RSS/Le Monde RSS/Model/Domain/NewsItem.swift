//
//  NewsItem.swift
//  Le Monde RSS
//
//  Created by dpalagi on 25/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import Foundation
import XMLMapper

class NewsItem: XMLMappable {

    // MARK: - properties
    var nodeName: String! = "item"

    var linkUrl: String?

    var title: String?

    var newsDescription: String?

    var image: NewsImage?

    // MARK: - initialisation
    required init(map: XMLMap) {

    }

    // MARK: - mapping
    func mapping(map: XMLMap) {
        title <- map["title"]
        newsDescription <- map["description"]
        linkUrl <- map["link"]
        image <- map["enclosure"]
    }
}

class NewsImage: XMLMappable {

    // MARK: - properties
    var nodeName: String! = "enclosure"

    var imageUrl: String?

    // MARK: - initialization
    required init(map: XMLMap) {

    }

    // MARK: - mapping
    func mapping(map: XMLMap) {
        imageUrl <- map.attributes["url"]
    }
}
