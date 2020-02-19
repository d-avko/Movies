//
//  RootViewController.swift
//  movies
//
//  Created by Denis Maximenko on 2/18/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var embeddedVC: CartoonsViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        embeddedVC = self.children.first(where: { $0 is CartoonsViewController}) as? CartoonsViewController
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FilterMoviesViewController{
            let destination = segue.destination as! FilterMoviesViewController
            
            destination.callBack = onFilterApplied(minutes:hours:author:)
        }
    }
    
    func onFilterApplied(minutes: String, hours: String, author: String) {
        embeddedVC?.onFilterApplied(hours: hours, minutes: minutes, author: author)
    }
       
}
