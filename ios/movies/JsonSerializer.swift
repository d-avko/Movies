//
//  JsonSerializer.swift
//  movies
//
//  Created by Denis Maximenko on 2/17/20.
//  Copyright © 2020 Denis Maximenko. All rights reserved.
//

import Foundation

class JsonSerializer<T> where T:Encodable, T: Decodable{
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let filePath = "/Cartoons/movies.json"
    let fileFolder = "Cartoons"
    
    public func saveFile(array: Array<T>){
        if let encodedData = try? encoder.encode(array){
            do{
                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                let documentsDirectory = paths[0]
                let docURL = URL(string: documentsDirectory)!
                var dataPath = docURL.appendingPathComponent("Cartoons")
                
                if !FileManager.default.fileExists(atPath: dataPath.absoluteString) {
                    do {
                        try FileManager.default.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
                        
                        dataPath.appendPathComponent("movies.json")

                        FileManager.default.createFile(atPath: dataPath.absoluteString, contents: encodedData, attributes: nil)
                    } catch {
                        print(error.localizedDescription);
                    }
                }else{
                    dataPath = dataPath.appendingPathComponent("movies.json")
                }
                
                try encodedData.write(to: URL(fileURLWithPath: dataPath.absoluteString))
            }
            catch{
                print("Some data failed to save. \(error.localizedDescription)")
            }
        }
    }
    
    public func loadData() throws -> Array<T>{
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
        
        let decodedData = try decoder.decode(Array<T>.self, from: data)
        
        return decodedData
    }
}
