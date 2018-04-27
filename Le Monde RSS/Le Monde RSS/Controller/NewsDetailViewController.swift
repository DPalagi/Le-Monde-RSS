//
//  NewsDetailViewController.swift
//  Le Monde RSS
//
//  Created by dpalagi on 27/04/2018.
//  Copyright © 2018 dpalagi. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsDetailViewController: UIViewController {

    // MARK: - properties
    var data: NewsItem?
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!

    // MARK: - events
    override func viewDidLoad() {
        super.viewDidLoad()
        // Display news content
        newsTitle.text = data?.title
        newsDescription.text = data?.newsDescription
        newsDescription.sizeToFit()
        let placeHolderImage = UIImage(named: "le_monde_logo")!
        if let imageUrl = data?.image?.imageUrl {
            newsImage?.af_setImage(withURL: URL(string: imageUrl)!, placeholderImage: placeHolderImage)
        } else {
            newsImage?.image = placeHolderImage
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func openNewsWeb(_ sender: Any) {
        if let url = data?.linkUrl {
            UIApplication.shared.open(URL(string: url)!, options: [:]) { (success) in
                print("Open link: \(url) with success: \(success)")
            }
            return
        }

        ErrorHandler.displayErrorMessage(NSLocalizedString("openSafariError", comment: ""))
    }
}
