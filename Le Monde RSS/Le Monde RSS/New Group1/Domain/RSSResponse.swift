//
//  RSS.swift
//  Le Monde RSS
//
//  Created by Jeremy Benabu on 25/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import Foundation
import XMLMapper

class RSSResponse: XMLMappable {

    // MARK: - variables

    var nodeName: String! = "rss"

    var channel: Channel?

    // MARK: - initialisation

    required init(map: XMLMap) {

    }

    func mapping(map: XMLMap) {
        channel <- map["channel"]
    }
}
