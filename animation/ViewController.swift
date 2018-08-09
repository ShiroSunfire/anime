//
//  ViewController.swift
//  animation
//
//  Created by student on 8/9/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myView:CustomView!
    
    @IBAction func pressed(_ sender: Any) {
      myView.flip()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView = CustomView(frame: CGRect(x: view.frame.midX - 50.0, y: view.frame.midY - 50.0, width: 100.0, height: 100.0))
        view.addSubview(myView)
    }
}

