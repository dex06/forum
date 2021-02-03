//
//  CollectionViewController.swift
//  forum
//
//  Created by Derek Samson on 03/02/2021.
//

import UIKit

private let reuseIdentifier2 = "Cell2"
//var aPost: Post

class DetailViewController: UICollectionViewController {
    
   
    
    var selectedPost : Post?
    var comments = [Comment]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let sp : Post = selectedPost else { return }
        
        self.getComments(postId:sp.id)
        //posts.append(Post(id: 1, title: "test", body: "test", userId: 1))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier2)

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
                self.comments = try! JSONDecoder().decode([Comment].self, from :data)
                
                print("Got \(self.comments.count) comments")
               
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                }
                task.resume()
    }
    
    
    // Fonction appelée quand on clic sur un élément de la liste
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Stocker dans la variable d'instance, le post choisi

        //selectedPost = posts[indexPath.row]
        
        // Déclencher la transition vers l'écran suivant (Identifier donné dans le Storyboard)
        
        //performSegue(withIdentifier: "IDENTIFIER", sender: self)
    }

    // Fonction appelée quand on change d'écran (avant la transition)


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return comments.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath) as! DetailCollectionViewCell
    
        
        
        cell.myLabel.text = comments[indexPath.row].name
        
        cell.backgroundColor = .green
        return cell
        
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
