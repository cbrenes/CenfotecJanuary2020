//
//  ViewController1.swift
//  TabBarControllerExample
//
//  Created by Cesar Brenes on 4/4/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func nextButtonAction(_ sender: Any) {
        
        if let viewController4 = storyboard?.instantiateViewController(identifier: "ViewController4") {
            navigationController?.pushViewController(viewController4, animated: true)
        }
    }
    
}
