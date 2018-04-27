//
//  APIManager.swift
//  Le Monde RSS
//
//  Created by Jeremy Benabu on 25/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {

    class func fetchNewsFeed(_ url: String, completion: @escaping(CompletionModel<Channel>) -> Void) {
        Alamofire.request(url)
            .response(completionHandler: { (response) in
                guard let data = response.data,
                    let utf8Data = String(data: data, encoding: .utf8),
                    let rssResponse = RSSResponse(XMLString: utf8Data),
                    let channel = rssResponse.channel else {
                    completion(.error(e: .invalidXml))
                    return
                }
                completion(.success(object: channel))
            })
        }
    }
