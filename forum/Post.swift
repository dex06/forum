//
//  Post.swift
//  projet-forum
//
//  Created by user186622 on 2/3/21.
//

import Foundation


struct Post : Codable {

    let id : Int
    let title : String
    let body : String
    let userId : Int

    init(id: Int,title: String,body: String,userId: Int) {

      self.id = id
      self.title = title
      self.body = body
      self.userId = userId

    }

}
