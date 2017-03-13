//
//  HomeViewController.swift
//  Quickstagram
//
//  Created by Oscar Reyes on 3/11/17.
//  Copyright © 2017 Oscar Reyes. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var postsTableView: UITableView!
    var posts: [PFObject]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.postsTableView.dataSource = self
        self.postsTableView.delegate = self
        self.postsTableView.rowHeight = UITableViewAutomaticDimension
        self.postsTableView.estimatedRowHeight = 350
        
        let query = PFQuery(className: "Post")
        
        // Fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) -> Void in
            if let posts = posts {
                self.posts = posts
                self.postsTableView.reloadData()
            } else {
                print(error?.localizedDescription ?? "Error getting images")
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        postsTableView.reloadData()

        if let index = self.postsTableView.indexPathForSelectedRow{
            self.postsTableView.deselectRow(at: index, animated: true)
        }
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (posts?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath) as! PictureCell
        let post = posts?[indexPath.row]
        
        let photo = post?["media"] as! PFFile
        photo.getDataInBackground {(data: Data?, error: Error?) in
            if error == nil {
                cell.picImageView.image = UIImage(data: data!)
            }
        }
        
        cell.captionLabel.text = post?["caption"] as? String
        
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
