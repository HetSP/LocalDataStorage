//
//  Util.swift
//  Store_to_local_Assignment
//
//  Created by promact on 14/02/24.
//

import Foundation
import UIKit

class Util{
    static let share = Util()
    
    func getPath(dbName: String) -> String{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documentDirectory.appendingPathComponent(dbName)
        print(fileUrl.path)
        return fileUrl.path
    }
    
    func copyDatabase(dbName: String){
        let dbPath = getPath(dbName: "user.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(dbName)
            do{
                try fileManager.copyItem(atPath: file!.path, toPath: dbPath)
            }
            catch let err{
                print(err.localizedDescription)
            }
        }
        return
    }
    
}
