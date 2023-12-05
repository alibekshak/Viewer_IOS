//
//  ViewController.swift
//  Viewer
//
//  Created by Apple on 01.12.2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var image = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                image.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return image.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath)
        cell.textLabel?.text = image[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail" ) as? DetailViewController{
            vc.selectedImage = image[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

