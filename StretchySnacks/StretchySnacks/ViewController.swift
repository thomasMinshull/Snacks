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
    @IBOutlet weak var plusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: Actions
    @IBAction func plusIconTapped(sender: AnyObject) {
        var rotation:Double? = nil
        
        if self.customNavBarHeight.constant == 64 {
            self.customNavBarHeight.constant = 200
            rotation = 40.0
        } else {
            self.customNavBarHeight.constant = 64
            rotation = 0.0
        }
        
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options:[] , animations: {
            
            if let rotation = rotation {
                self.plusButton.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
            }
            
            self.view.layoutIfNeeded()
        }, completion: nil)


    }

    

}

