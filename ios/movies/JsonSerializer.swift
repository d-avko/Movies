//
//  JsonSerializer.swift
//  movies
//
//  Created by Denis Maximenko on 2/17/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import Foundation
import FirebaseDatabase

class JsonSerializer{
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    public let ref = Database.database().reference()
    
    public func saveFile(array: Array<Cartoon>){
        for data in array{
            let dataToStore = ["id" : data.id,
                "name" : data.name,
                "author" : data.author,
                "durationSeconds" : data.durationSeconds,
                "genre": data.genre,
                "link": data.link,
                "thumbnailLink": data.thumbnailLink,
                "rating": data.rating] as [String : Any]
            
            ref.child("movies").child(String(data.id)).setValue(dataToStore, withCompletionBlock: { err, ref in
                if let error = err {
                    print("userInfoDictionary was not saved: \(error.localizedDescription)")
                } else {
                    print("userInfoDictionary saved successfully!")
                }
            })
        }
    }
}
