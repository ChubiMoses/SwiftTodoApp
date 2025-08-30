//
//  UserModel.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import Foundation

struct User: Codable{
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
