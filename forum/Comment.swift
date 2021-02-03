//
//  Comment.swift
//  projet-forum
//
//  Created by user186622 on 2/3/21.
//

import Foundation

struct Comment : Codable {

    let name : String
    let postId : Int
    let id : Int
    let body : String
    let email : String

    init(name: String,postId: Int,id: Int,body: String,email: String) {

      self.name = name
      self.postId = postId
      self.id = id
      self.body = body
      self.email = email

    }

}
