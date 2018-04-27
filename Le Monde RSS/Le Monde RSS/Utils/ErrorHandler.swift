//
//  ErrorHandler.swift
//  Le Monde RSS
//
//  Created by dpalagi on 27/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import Foundation
import TTGSnackbar

struct ErrorHandler {

    static func handleApiError(_ error: APIError) {
        print("API Error Occured : \(error)")
        let snackbar = TTGSnackbar(message: "Une erreur est survenue", duration: .middle)
        snackbar.show()
    }

}
