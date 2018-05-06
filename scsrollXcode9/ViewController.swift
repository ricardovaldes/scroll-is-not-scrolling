//
//  ViewController.swift
//  scsrollXcode9
//
//  Created by RICARDO VALDES on 4/05/18.
//  Copyright © 2018 RICARDO VALDES. All rights reserved.
//nuevo mmmmmm

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myScroll: UIScrollView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    var views = [String: UIImageView]()
    
    var carImages = [UIImage]()
    
    var myConstr = [NSLayoutConstraint]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        carImages = [UIImage(named: "fasto1"), UIImage(named: "fasto2"), UIImage(named: "fasto3"), UIImage(named: "fasto4")] as! [UIImage]
        
        var previous: UIImageView? = nil
        
        for index in 0..<carImages.count{
            let imageView = UIImageView()
            imageView.image = carImages[index]
            imageView.translatesAutoresizingMaskIntoConstraints = false
            myScroll.addSubview(imageView)
            
            views = ["imageView": imageView]
            
            myConstr.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:  "V:|[imageView(==myScroll)]", metrics: nil, views: ["imageView":imageView, "myScroll": myScroll]))
            
            if previous == nil{
                myConstr.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:  "H:|-[imageView(200)]", metrics: nil, views: views))
            }
            else{
                myConstr.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:  "H:[previous]-[imageView(200)]", metrics: nil, views: ["previous": previous!, "imageView": imageView]))
            }
            previous = imageView
            if index == carImages.count-1{
                myConstr.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "[previous]-|", metrics: nil, views: ["previous": imageView]))
            }
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1)
        }
        
        myScroll.addConstraints(myConstr)

    }

}

