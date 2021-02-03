//
//  CollectionViewController.swift
//  forum
//
//  Created by Derek Samson on 03/02/2021.
//

import UIKit

private let reuseIdentifier = "Cell"
var selectedPostIndex: Int = -1

class CollectionViewController: UICollectionViewController {
var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPosts()
        //posts.append(Post(id: 1, title: "test", body: "test", userId: 1))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    private func getPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
                let task = URLSession.shared.dataTask(with: url) {
                    (data,resp,err) in if let err = err {
                        print("An error occured: ", err)
                        return
                    }
                
                guard let data = data else {return}
                self.posts = try! JSONDecoder().decode([Post].self, from :data)
                print("Got \(self.posts.count) posts")
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                
                }
                task.resume()
    }
    
    
    
    // Fonction appelée quand on clic sur un élément de la liste
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Stocker dans la variable d'instance, le post choisi
        selectedPostIndex = indexPath.row
        
        // Déclencher la transition vers l'écran suivant (Identifier donné dans le Storyboard)
        performSegue(withIdentifier: "showDetail", sender: self)
    }

    // Fonction appelée quand on change d'écran (avant la transition)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // On test si on va bien à l'écran suivant (Identifier donné dans le Storyboard)
        if (segue.identifier == "showDetail") {
            // On récupére l'écran de destination
            let destination = segue.destination as! DetailViewController
            
            destination.selectedPost = posts[selectedPostIndex]
            
            
            // On passe le postId ou l'objet lui-même Post
            
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        cell.myLabel.text = posts[indexPath.row].title
        cell.backgroundColor = .green
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
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
