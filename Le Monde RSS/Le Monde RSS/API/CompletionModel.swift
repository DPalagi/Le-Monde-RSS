//
//  CompletionModel.swift
//  Le Monde RSS
//
//  Created by dpalagi on 25/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import Foundation

enum CompletionModel<T> {
    case success(object: T)
    case error(e: APIError)
}
