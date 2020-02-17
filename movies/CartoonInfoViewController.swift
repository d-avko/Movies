//
//  CartoonInfoViewController.swift
//  movies
//
//  Created by Denis Maximenko on 2/17/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import UIKit

class CartoonInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorLabel.text = cartoon.author;
        
        let hours: Int = cartoon.durationSeconds / 60 / 60;
        let minutes = (hours * 60 * 60 - cartoon.durationSeconds) / 60
        
        durationLabel.text = "\(hours) h \(minutes) m"
        
        nameLabel.text = cartoon.name
        
        ratingLabel.text = String(format: "%.2f", cartoon.rating)
    }
    
    
    public var cartoon : Cartoon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
