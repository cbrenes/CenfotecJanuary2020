//
//  ViewController.swift
//  RestApiExample
//
//  Created by Cesar Brenes on 4/18/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimating()
        getAllmMemes()
    }
    
    
    func getAllmMemes() {
        APIManager.getAllMemes { (error, memes) in
            self.stopAnimating()
            if let memes = memes {
                self.trabajeConLosMemes(memes: memes)
            }
        }
        
    }
    
    func trabajeConLosMemes(memes: [Meme]) {
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "") else {
            return UITableViewCell()
        }
        return cell
    }
}



