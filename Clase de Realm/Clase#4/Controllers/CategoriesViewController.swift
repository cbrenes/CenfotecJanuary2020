//
//  CategoriesViewController.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/14/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit
import RealmSwift

class CategoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let categoriesTableViewCellIdentifier = "CategoriesTableViewCell"
    var categories: Results<Category>?
    
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
        let realmManager = RealmManager()
        let categories = realmManager.getAllCategories()
        if let categories = categories, categories.isEmpty {
            realmManager.insertCategory(name: "Economía", imageName: "economy")
            realmManager.insertCategory(name: "Sucesos", imageName: "incident")
            realmManager.insertCategory(name: "Tecnología", imageName: "tecnology")
            realmManager.insertCategory(name: "Deportes", imageName: "sport")
            print("SE INSERTARON LAS CATEGORIAS")
            createCategories()
        } else {
            self.categories = categories
            tableView.reloadData()
        }
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: categoriesTableViewCellIdentifier)  as? CategoriesTableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "NO EXISTE"
            return cell
        }
        if let category = categories?[indexPath.row] {
            cell.setupCell(category: category)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "NewsViewController") as? NewsViewController, let category = categories?[indexPath.row] {
            viewController.category = category
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
