//
//  ViewController.swift
//  StretchySnacks
//
//  Created by thomas minshull on 2016-08-04.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: Outlets
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var customNavBarHeight: NSLayoutConstraint!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties 
    var stackView:UIStackView!
    var dataSourceArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let snacksLabel = UILabel()
        snacksLabel.text = "SNACKS"
        
        snacksLabel.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(snacksLabel)
        
        let snackYCenter = snacksLabel.centerYAnchor.constraintEqualToAnchor(navBar.centerYAnchor)
        snacksLabel.centerXAnchor.constraintEqualToAnchor(navBar.centerXAnchor).active = true
        snackYCenter.active = true
        snackYCenter.identifier = "snackYCenter"

        let cookieView = UIImageView(image: UIImage(named: "oreos"))
        let pizzaPocketView = UIImageView(image: UIImage(named: "pizza_pockets"))
        let popTartView = UIImageView(image: UIImage(named: "pop_tarts"))
        let popsicleView = UIImageView(image: UIImage(named: "popsicle"))
        let ramenView = UIImageView(image: UIImage(named: "ramen"))
        
        cookieView.translatesAutoresizingMaskIntoConstraints = false
        pizzaPocketView.translatesAutoresizingMaskIntoConstraints = false
        popTartView.translatesAutoresizingMaskIntoConstraints = false
        popsicleView.translatesAutoresizingMaskIntoConstraints = false
        ramenView.translatesAutoresizingMaskIntoConstraints = false
        
        cookieView.contentMode = .ScaleAspectFit
        pizzaPocketView.contentMode = .ScaleAspectFit
        popTartView.contentMode = .ScaleAspectFit
        popsicleView.contentMode = .ScaleAspectFit
        ramenView.contentMode = .ScaleAspectFit
        
        let cookieButton = UIButton()
        let pizzaPocketButton = UIButton()
        let popTartButton = UIButton()
        let popsicleButton = UIButton()
        let ramenButton = UIButton()
        
        cookieButton.addTarget(self, action: #selector(ViewController.cookieTapped), forControlEvents: .TouchUpInside)
        pizzaPocketButton.addTarget(self, action: #selector(ViewController.pizzaPocketTapped), forControlEvents: .TouchUpInside)
        popTartButton.addTarget(self, action: #selector(ViewController.popTartsTapped), forControlEvents: .TouchUpInside)
        popsicleButton.addTarget(self, action: #selector(ViewController.popsicleTapped), forControlEvents: .TouchUpInside)
        ramenButton.addTarget(self, action: #selector(ViewController.ramenTapped), forControlEvents: .TouchUpInside)
        
        cookieButton.translatesAutoresizingMaskIntoConstraints = false
        pizzaPocketView.translatesAutoresizingMaskIntoConstraints = false
        popTartView.translatesAutoresizingMaskIntoConstraints = false
        popsicleView.translatesAutoresizingMaskIntoConstraints = false
        ramenView.translatesAutoresizingMaskIntoConstraints = false
        
        nestImageViewInButton(cookieButton, imageView: cookieView)
        nestImageViewInButton(pizzaPocketButton, imageView: pizzaPocketView)
        nestImageViewInButton(popTartButton, imageView: popTartView)
        nestImageViewInButton(popsicleButton, imageView: popsicleView)
        nestImageViewInButton(ramenButton, imageView: ramenView)
        
        let buttonArray = [cookieButton, pizzaPocketButton, popTartButton, popsicleButton, ramenButton]
        
        stackView = UIStackView(arrangedSubviews: buttonArray)
        stackView.axis = .Horizontal
        stackView.distribution = .FillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        navBar.addSubview(stackView)
        stackView.centerYAnchor.constraintEqualToAnchor(navBar.centerYAnchor, constant: 25).active = true
        stackView.leadingAnchor.constraintEqualToAnchor(navBar.leadingAnchor).active = true
        stackView.trailingAnchor.constraintEqualToAnchor(navBar.trailingAnchor).active = true
        stackView.bottomAnchor.constraintEqualToAnchor(navBar.bottomAnchor).active = true
        stackView.widthAnchor.constraintEqualToAnchor(navBar.widthAnchor).active = true
        
        stackView.hidden = true
    }
    
    func nestImageViewInButton(button:UIButton, imageView:UIImageView) {
        button.addSubview(imageView)
        
        button.topAnchor.constraintEqualToAnchor(imageView.topAnchor, constant: 0.0).active = true
        button.bottomAnchor.constraintEqualToAnchor(imageView.bottomAnchor, constant: 0.0).active = true
        button.leftAnchor.constraintEqualToAnchor(imageView.leftAnchor, constant: 0.0).active = true
        button.rightAnchor.constraintEqualToAnchor(imageView.rightAnchor, constant: 0.0).active = true
    }

    //MARK: Actions
    
    func cookieTapped() {
        dataSourceArray.insert("oreos", atIndex: 0)
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    func pizzaPocketTapped() {
        dataSourceArray.insert("pizza Pockets", atIndex: 0)
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Middle)
    }
    
    func popTartsTapped() {
        dataSourceArray.insert("pop Tarts", atIndex: 0)
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func popsicleTapped() {
        dataSourceArray.insert("popsicle", atIndex: 0)
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
    }
    
    func ramenTapped() {
        dataSourceArray.insert("ramen", atIndex: 0)
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
    }
    
    @IBAction func plusIconTapped(sender: AnyObject) {
        var rotation:Double? = nil
        
        if self.customNavBarHeight.constant == 64 {
            self.customNavBarHeight.constant = 200
            rotation = 40.0
            stackView.hidden = false
        } else {
            self.customNavBarHeight.constant = 64
            rotation = 0.0
            stackView.hidden = true
        }
        
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options:[] , animations: {
            
            if let rotation = rotation {
                self.plusButton.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
            }
            
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    //MARK: UITableViewDataSource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = dataSourceArray[indexPath.row]
        return cell
    }
    
    
}

