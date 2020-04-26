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
    
    var memesList = [Meme]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
        startAnimating()
        getAllmMemes()
    }
    
    
    func getAllmMemes() {
        APIManager.getAllMemes { (error, memes) in
            self.stopAnimating()
            if let error = error {
                self.handleError(error: error)
            }
            else if let memes = memes {
                self.memesList = memes
            }
        }
    }
    
    func handleError(error: MemeAPIError) {
        var message = ""
        switch error {
        case .invalidURL, .serverError, .wrongAnswer:
            message = "Estamos experimentando problemas con el servidor, por favor intente más tarde"
        case .noInternetConnection:
            message = "Por favor revisar la conexión a internet"
        }
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func registerCustomCells() {
        tableView.register(UINib(resource: R.nib.customTableViewCell), forCellReuseIdentifier: R.nib.customTableViewCell.name)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.customTableViewCell.name) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(meme: memesList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}



