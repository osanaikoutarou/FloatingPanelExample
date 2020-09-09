//
//  SecondViewController.swift
//  FloatingPanelExample
//
//  Created by 長内幸太郎 on 2020/09/09.
//  Copyright © 2020 長内幸太郎. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
