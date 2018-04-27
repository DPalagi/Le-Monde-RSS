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
        let snackbar = TTGSnackbar(message: NSLocalizedString("generalError", comment: ""), duration: .middle)
        snackbar.show()
    }

    static func displayErrorMessage(_ errorMessage: String) {
        print("Error Occured : \(errorMessage)")
        let snackbar = TTGSnackbar(message: errorMessage, duration: .middle)
        snackbar.show()
    }

}
