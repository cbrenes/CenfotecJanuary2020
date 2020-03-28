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
        addNewsNavigationButton()
    }
    
    func registerCustomCells() {
        let nib = UINib(nibName: newsCustomTableViewCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: newsCustomTableViewCellIdentifier)
    }
    
    func addNewsNavigationButton() {
        let addNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewsAction(sender:)))
        navigationItem.rightBarButtonItem = addNavigationButton
    }
    
    @objc func addNewsAction(sender: UIBarButtonItem) {
        if let addNewsViewController = storyboard?.instantiateViewController(identifier: "AddNewsViewController") as? AddNewsViewController {
            addNewsViewController.delegate = self
            navigationController?.pushViewController(addNewsViewController, animated: true)
        }
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
        if let news = category?.news[indexPath.row] {
            cell.setupCell(news: news)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let news = category?.news[indexPath.row], let addNewsViewController = storyboard?.instantiateViewController(identifier: "AddNewsViewController") as? AddNewsViewController  {
            addNewsViewController.news = news
            navigationController?.pushViewController(addNewsViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            category?.news.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

extension NewsViewController: AddNewsViewControllerProtocol {
    func addNews(news: News) {
        let realmManager = RealmManager()
        if let category = category {
            realmManager.addNewsToCategory(news: news, category: category)
            navigationController?.popViewController(animated: true)
            tableView.reloadData()
        }
    }
}
