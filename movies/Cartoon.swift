//
//  Cartoon.swift
//  movies
//
//  Created by Denis Maximenko on 2/13/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import Foundation

class Cartoon : NSObject, Encodable, Decodable{
    
    init(name: String, author: String, durationSeconds: Int, rating: Double, genre: String, link: String) {
        self.name = name;
        self.durationSeconds = durationSeconds;
        self.rating = rating;
        self.genre = genre;
        self.author = author;
        self.link = link;
    }
    
    public var name : String;
    public var author : String;
    public var durationSeconds: Int;
    public var rating: Double;
    public var genre: String;
    public var link: String;
}
