//
//  NewsViewController.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/14/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var category: Category?
    let newsCustomTableViewCellIdentifier = "NewsTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
    }
    
    func registerCustomCells() {
        let nib = UINib(nibName: newsCustomTableViewCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: newsCustomTableViewCellIdentifier)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.news.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsCustomTableViewCellIdentifier) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
