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

    class func retrieveNewsFeed(_ url: String, completion: @escaping(CompletionModel<Channel>) -> Void) {
        Alamofire.request(url)
            .responseXMLObject { (response: DataResponse<RSSResponse>) in
                guard let rssResponse = response.value,
                    let channel = rssResponse.channel else {
                    completion(.error(e: .invalidXml))
                    return
                }
                completion(.success(object: channel))
        }
    }
}
