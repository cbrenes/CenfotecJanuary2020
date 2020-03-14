//
//  CategoriesViewController.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/14/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let categoriesTableViewCellIdentifier = "CategoriesTableViewCell"
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        createCategories()
    }
    
    //1- Registrar la celda custom
    func registerCustomCell() {
        let nib = UINib(nibName: categoriesTableViewCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: categoriesTableViewCellIdentifier)
    }
    
    func createCategories() {
        categories.append(Category(name: "Economía", imageName: "economy", news: [News]()))
        categories.append(Category(name: "Sucesos", imageName: "incident", news: [News]()))
        categories.append(Category(name: "Tecnología", imageName: "tecnology", news: [News]()))
        categories.append(Category(name: "Deportes", imageName: "sport", news: [News]()))
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: categoriesTableViewCellIdentifier)  as? CategoriesTableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "NO EXISTE"
            return cell
        }
        cell.setupCell(category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "NewsViewController") as? NewsViewController {
            viewController.category = categories[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
