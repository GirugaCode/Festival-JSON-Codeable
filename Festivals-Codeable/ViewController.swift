//
//  ViewController.swift
//  Festivals-Codeable
//
//  Created by Ryan Nguyen on 2/7/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup stuff
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "yourCell")
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(myTableView)
        tableViewContraints()
        
        path(forResource: "Festivals", ofType: ".json")
        // Do any additional setup after loading the view, typically from a nib.
        
//        let path = Bundle.main.path(forResource: "Festival", ofType: ".json")
//        if let path = path {
//            let url = URL(fileURLWithPath: path)
//            print(url)
//
//            let contents = try? Data(contentsOf: url, options: .alwaysMapped)
//            if let data = contents, {
//                //         let jsonResult = try JSONSerialization.jsonObject(with: data) as? Data
//                let filmsFromJSON = try? JSONDecoder().decode([FilmEntryCodable].self, from: data) {
//                    films = filmsFromJSON
//                }
//            }
//        }
    }
    
    func path(forResource name: String?, ofType extension: String?) {
        let path = Bundle.main.path(forResource: "Festivals", ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            let contents = try? Data(contentsOf: url, options: .alwaysMapped)
            print(url)
            print(contents)
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Festival].self, from: contents!)
                print(decoded)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    
    
    
    func tableViewContraints() {
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        myTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\([indexPath.row])"
        return cell
    }
}


