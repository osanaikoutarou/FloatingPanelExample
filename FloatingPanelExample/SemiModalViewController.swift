//
//  SemiModalViewController.swift
//  FloatingPanelExample
//
//  Created by 長内幸太郎 on 2020/09/09.
//  Copyright © 2020 長内幸太郎. All rights reserved.
//

import UIKit

class SemiModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SemiModalViewController", #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SemiModalViewController", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SemiModalViewController", #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SemiModalViewController", #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SemiModalViewController", #function)
    }
    
    
}


