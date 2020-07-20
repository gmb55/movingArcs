//
//  ViewController.swift
//  movingArcs
//
//  Created by Michał Bagrowski on 20/07/2020.
//  Copyright © 2020 gmbDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)

          let width = CGFloat(200.0)

          let demoView = MovingArcs()
          demoView.frame = CGRect(x: self.view.frame.size.width / 2 - width / 2,
              y: self.view.frame.size.height / 2 - width / 2,
              width: width,
              height: width)

         self.view.addSubview(demoView)
      }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

