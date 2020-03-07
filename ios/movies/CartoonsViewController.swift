//
//  CartoonsViewController.swift
//  movies
//
//  Created by Denis Maximenko on 2/17/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import UIKit

class CartoonsViewController: UITableViewController {
    
    let serializer = JsonSerializer<Cartoon>()
    var cartoons = Array<Cartoon>()
    var filteredCartoons = Array<Cartoon>()
    override func viewDidLoad() {
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .full
        
        super.viewDidLoad()
        do{
            cartoons = try serializer.loadData()
        }
        catch{
            var cartoons = [Cartoon]()
            cartoons.append(Cartoon(name: "How To Train Your Dragon: The Hidden World", author: "Not Disney", durationSeconds: 7200, rating: 4.2, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Alita: Battle Angel", author: "Disney", durationSeconds: 7200, rating: 3.1, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Lego Movie 2: The Second Part", author: "Disney", durationSeconds: 7200, rating: 5.0, genre: "Science", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Wonder Park", author: "Disney", durationSeconds: 7200, rating: 4.2, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Pokémon Detective Pikachu", author: "Disney", durationSeconds: 7200, rating: 4.2, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Shaun The Sheep Movie 2: Farmageddon", author: "Disney", durationSeconds: 7200, rating: 4.2, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "The Secret Life Of Pets 2", author: "Disney", durationSeconds: 7200, rating: 4.2, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Toy Story 4", author: "Disney", durationSeconds: 7200, rating: 4.2, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "How To Train Your Dragon: The Hidden World", author: "Disney", durationSeconds: 7200, rating: 4.2, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "How To Train Your Dragon: The Hidden World", author: "Disney", durationSeconds: 7200, rating: 4.2, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Wonder park", author: "Disney", durationSeconds: 7200, rating: 4.2, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Playmobil: The Movie", author: "Disney", durationSeconds: 7200, rating: 3.8, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Angry Birds 2", author: "Disney", durationSeconds: 3780, rating: 5.0, genre: "Adventure", link: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "Spies in Disguise", author: "Disney", durationSeconds: 6000, rating: 4.2, genre: "Adventure", link: "", thumbnailLink:  "https://cdn3.vectorstock.com/i/thumb-large/92/12/sample-stamp-vector-16699212.jpg"))
            
            cartoons.append(Cartoon(name: "The Addams Family", author: "Disney", durationSeconds: 7000, rating: 4.2, genre: "Adventure", link: "", thumbnailLink:  ""))
            
            serializer.saveFile(array: cartoons);
            self.cartoons = cartoons
            self.forceFilter()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredCartoons.count
    }

    let formatter = DateComponentsFormatter()

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartoonViewCell", for: indexPath) as? CartoonViewCell else{
            fatalError("Incorrect type for viewcell was provided.")
        }
               
        let cartoon = self.filteredCartoons[indexPath.row];
        
        cell.authorLabel.text = cartoon.author
        
        let hours: Int = cartoon.durationSeconds / 60 / 60;
        let minutes = (cartoon.durationSeconds - hours * 60 * 60) / 60
        
        cell.durationLabel.text = "\(hours) : \(minutes)"

        cell.nameLabel.text = cartoon.name
        cell.ratingLabel.text = String(format: "%.2f", cartoon.rating)
        
        if let url = URL( string:cartoon.thumbnailLink)
        {
             if let data = try? Data( contentsOf:url)
             {
               guard cell.imageView != nil else {
                 return cell
               }
                cell.photoImageView?.contentMode = .scaleAspectFit
                cell.photoImageView?.image = UIImage( data:data)
            }
        }
    

        return cell
    }
    
    var selectedCartoon: Cartoon!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cartoon = self.filteredCartoons[indexPath.row];
        
        selectedCartoon = cartoon
        
        performSegue(withIdentifier: "tableview-cartoonview", sender: self)
    }
    
    public var secondsFilter: Int = 0
    public var authorFilter: String = ""
    
    public func onFilterApplied(hours: String, minutes: String, author: String) {
        var hoursNumeric = 0
        var minutesNumeric = 0
        
        if hours != ""{
            hoursNumeric = Int(hours) ?? 0
        }
        
        if minutes != ""{
            minutesNumeric = Int(minutes) ?? 0
        }
        
        secondsFilter = hoursNumeric * 60 * 60 + minutesNumeric * 60
        
        authorFilter = author
        
        self.forceFilter()
    }
    
    func forceFilter(){
        self.filteredCartoons = Array(cartoons)
        
        if secondsFilter != 0{
            self.filteredCartoons = self.filteredCartoons.filter({ $0.durationSeconds <= secondsFilter  })
        }
        
        if authorFilter != ""{
            self.filteredCartoons = self.filteredCartoons.filter({ $0.author == authorFilter  })
        }
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // get a reference to the second view controller
        let destinationViewController = segue.destination as! CartoonInfoViewController

        // set a variable in the second view controller with the data to pass
        destinationViewController.cartoon = selectedCartoon
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
