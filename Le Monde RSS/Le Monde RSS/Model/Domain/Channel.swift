//
//  Channel.swift
//  Le Monde RSS
//
//  Created by dpalagi on 25/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import Foundation
import XMLMapper

class Channel: XMLMappable {

    // MARK: - variables
    var nodeName: String! = "channel"

    var items = [NewsItem]()

    var title: String?

    // MARK: - initialisation

    required init(map: XMLMap) {

    }

    func mapping(map: XMLMap) {
        items <- map["item"]
        title <- map["title"]
    }
}
