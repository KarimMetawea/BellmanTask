//
//  CircularMenuVC.swift
//  customTabBar
//
//  Created by karim metawea on 1/27/20.
//  Copyright © 2020 karim metawea. All rights reserved.
//

import UIKit
import CircleMenu

class CircularMenuVC: UIViewController,CircleMenuDelegate {

    @IBOutlet weak var circleButton: CircleMenu!
    var items = ["Hotspots","Attractions","Events","big_purple_location_pin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleButton.delegate = self
        circleButton.subButtonsRadius = 35
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        circleButton.setNeedsLayout()
        circleButton.sendActions(for: .touchUpInside)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {

              button.setImage(UIImage(named: items[atIndex]), for: .normal)
        button.contentMode = .scaleAspectFill
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    func menuCollapsed(_ circleMenu: CircleMenu) {
        self.dismiss(animated: false, completion: nil)

    }
    
    
    
    

}
