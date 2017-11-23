//
//  ViewController.swift
//  SimpleTable
//
//  Created by Student on 2017-11-22.
//  Copyright © 2017 Centennial. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let movies = ["Batman vs Superman", "Blade Runner 2049", "Thor: Ragnorok", "Justice League", "Wonderwoman", "Dark Tower", "Star Wars: The Last Jedi"]

    let simpleTableIdentifier = "SimpleTableIndentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if(cell == nil){
            cell = UITableViewCell(
                style: UITableViewCellStyle.subtitle,
                reuseIdentifier: simpleTableIdentifier
            )
        }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightImage
        
        if indexPath.row < 4 {
        cell?.detailTextLabel?.text = "SuperHero Movies"
            
        }else{
            cell?.detailTextLabel?.text = "Sci-Fi"
        }
        
        cell?.textLabel?.text = movies[indexPath.row]
        return cell!
        

    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = movies[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController(
            title: "Row Selected",
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Yes I Did!",
            style: .default,
            handler: nil
        )
        
        controller.addAction(action)
        present(controller, animated:true, completion:nil)
    }
    
}   

