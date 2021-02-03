//
//  ViewController.swift
//  forum
//
//  Created by Derek Samson on 03/02/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    private func getComments(postId:Int){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments") else {return}
                let task = URLSession.shared.dataTask(with: url) {
                    (data,resp,err) in if let err = err {
                        print("An error occured: ", err)
                        return
                    }
                
                guard let data = data else {return}
                let comments = try! JSONDecoder().decode([Comment].self, from :data)
                
                print(comments)
                
                }
                task.resume()
    }
    private func getPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
                let task = URLSession.shared.dataTask(with: url) {
                    (data,resp,err) in if let err = err {
                        print("An error occured: ", err)
                        return
                    }
                
                guard let data = data else {return}
                let posts = try! JSONDecoder().decode([Post].self, from :data)
                
                print(posts)
                
                }
                task.resume()
    }


}

