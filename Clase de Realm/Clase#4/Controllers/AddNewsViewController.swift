//
//  AddNewsViewController.swift
//  Clase#4
//
//  Created by Cesar Brenes on 3/14/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit


protocol AddNewsViewControllerProtocol: class {
    func addNews(news: News)
}

class AddNewsViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var news: News?
    
    weak var delegate: AddNewsViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let news = news {
            titleTextField.text = news.title
            titleTextField.isUserInteractionEnabled = false
            descriptionTextView.text = news.descriptionNews
            descriptionTextView.isEditable = false
        } else {
            addSaveNavigationButton()
        }
    }
    
    func addSaveNavigationButton() {
        let addNavigationButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addSaveAction(sender:)))
        navigationItem.rightBarButtonItem = addNavigationButton
    }
    
    @objc func addSaveAction(sender: UIBarButtonItem) {
        if let title = titleTextField.text, descriptionTextView.text.count > 0, title.count > 0 {
            let news = News(title: title, descriptionNews: descriptionTextView.text)
            delegate?.addNews(news: news)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los datos", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
    
}
