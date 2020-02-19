//
//  CartoonInfoViewController.swift
//  movies
//
//  Created by Denis Maximenko on 2/17/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class CartoonInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorLabel.text = cartoon.author;
        
        let hours: Int = cartoon.durationSeconds / 60 / 60;
        let minutes = (cartoon.durationSeconds - hours * 60 * 60) / 60
        
        durationLabel.text = "\(hours) h \(minutes) m"
        
        nameLabel.text = cartoon.name
        
        ratingLabel.text = String(format: "%.2f", cartoon.rating)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        if let url = URL( string:cartoon.thumbnailLink)
        {
            DispatchQueue.global().async {
              if let data = try? Data( contentsOf:url)
              {
                DispatchQueue.main.async {
                    guard self.imageView != nil else {
                      return
                    }
                    
                    self.imageView!.image = UIImage( data:data)
                }
              }
           }
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        guard let url = URL(string: cartoon.link) else {
            let alert = UIAlertController(title: NSLocalizedString("Error",comment: ""), message: NSLocalizedString("Video_not_available", comment: ""), preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
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
