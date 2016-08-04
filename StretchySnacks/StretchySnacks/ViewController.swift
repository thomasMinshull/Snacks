//
//  ViewController.swift
//  StretchySnacks
//
//  Created by thomas minshull on 2016-08-04.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var customNavBarHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: Actions
    @IBAction func plusIconTapped(sender: AnyObject) {
        
        if self.customNavBarHeight.constant == 64 {
            self.customNavBarHeight.constant = 200
        
        } else {
            self.customNavBarHeight.constant = 64
        }
        
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options:[] , animations: {
        self.view.layoutIfNeeded()
        }, completion: nil)


    }

    

}

