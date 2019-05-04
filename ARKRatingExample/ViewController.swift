//
//  ViewController.swift
//  ARKRatingExample
//
//  Created by Aswin Raj Kharel on 5/3/19.
//  Copyright © 2019 Aswin Raj Kharel. All rights reserved.
//

import UIKit
import ARKRating

class ViewController: UIViewController {

    let ratingControl: ARKRatingControl = {
        let ratingControl = ARKRatingControl()
        ratingControl.translatesAutoresizingMaskIntoConstraints = false
        ratingControl.maxRating = 5
        ratingControl.currentRating = 1.5
        ratingControl.addTarget(self, action: #selector(ratingControlValueChanged), for: .valueChanged)
        ratingControl.isUserInteractionEnabled = false
        return ratingControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.ratingControl)
        self.ratingControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.ratingControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.ratingControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.ratingControl.widthAnchor.constraint(equalToConstant: 240).isActive = true
    }


    @objc func ratingControlValueChanged(){
        print(self.ratingControl.currentRating)
    }
}

