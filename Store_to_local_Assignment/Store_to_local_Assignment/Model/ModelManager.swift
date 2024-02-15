//
//  ModelManager.swift
//  Store_to_local_Assignment
//
//  Created by promact on 14/02/24.
//

import Foundation
import UIKit

var shareInstance = ModelManager()

class ModelManager{
    var database : FMDatabase? = nil
    
    static func getInstance() -> ModelManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "user.db"))
        }
        return shareInstance
    }
    
    func SaveUser(user: UserModel) -> Bool{
        shareInstance.database?.open()
        
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO users (name, age, email, address, phone, occupation) VALUES (?, ?, ?, ?, ?, ?)", withArgumentsIn: [user.name, user.age, user.email, user.address, user.phone, user.occupation])
        shareInstance.database?.close()
        return isSave!
    }
    
    func getUser() -> UserModel{
        shareInstance.database?.open()
        var users = [UserModel]()
        var resultantuser = UserModel(id: "", name: "", age: "", email: "", address: "", phone: "", occupation: "")
        do{
            let resultset : FMResultSet? = try shareInstance.database?.executeQuery("SELECT * FROM users", values: nil)
            if resultset != nil{
                while resultset!.next(){
                    let user = UserModel(id: (resultset!.string(forColumn: "id"))!, name: (resultset!.string(forColumn: "name"))!, age: (resultset!.string(forColumn: "age"))!, email: (resultset!.string(forColumn: "email"))!, address: (resultset!.string(forColumn: "address"))!, phone: (resultset!.string(forColumn: "phone"))!, occupation: (resultset!.string(forColumn: "occupation"))!)
                    users.append(user)
                }
                resultantuser = (users.last)!
            }
        }
        catch let err {
            print(err.localizedDescription)
        }
        shareInstance.database?.close()
        return resultantuser
    }
    
    func updateUser(user : UserModel) -> Bool{
        shareInstance.database?.open()
        
        let isUpdate = shareInstance.database?.executeUpdate("UPDATE users SET name=?, age=?, email=?, address=?, phone=?, occupation=? WHERE id=?", withArgumentsIn: [user.name,user.age,user.email,user.address,user.phone,user.occupation,user.id])
        shareInstance.database?.close()
        return isUpdate!
    }
}
