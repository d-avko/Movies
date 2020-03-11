//
//  Storage.swift
//  movies
//
//  Created by Denis Maximenko on 3/11/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import Foundation
import FirebaseStorage

class FirebaseFileStorage{
    let storage = Storage.storage()
    
    public func storeFile() {
        let ref = storage.reference().child("123")

        let uploadTask = ref.putFile(from: URL(fileURLWithPath: "123"), metadata: nil) { metadata, error in
        guard let metadata = metadata else {
          // Uh-oh, an error occurred!
          return
        }
        // Metadata contains file metadata such as size, content-type.
        let size = metadata.size
        // You can also access to download URL after upload.
        ref.downloadURL { (url, error) in
          guard let downloadURL = url else {
            // Uh-oh, an error occurred!
            return
          }
        }
            
        }
        
    }
        
}
