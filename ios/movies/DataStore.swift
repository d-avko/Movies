//
//  DataStore.swift
//  movies
//
//  Created by Denis Maximenko on 3/8/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import Foundation
import Firebase

class DataStore{
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
    
    public func getData(){
        
    }
    
    public func loadData(){
        
    }
}
