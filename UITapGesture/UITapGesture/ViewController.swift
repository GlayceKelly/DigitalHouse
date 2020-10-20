//
//  ViewController.swift
//  UITapGesture
//
//  Created by Glayce Kelly on 20/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var tapGestureView: UIView!
    @IBOutlet weak var swipeGestureView: UIView!
    @IBOutlet weak var longPressGesture: UIView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configurando o tapGesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture(_:)))
        tapGestureView.addGestureRecognizer(tap)
        
        // configurando o swippe gesture
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeGesture(_:)))
        swipe.direction = .right
        swipeGestureView.addGestureRecognizer(swipe)
        
        // configurando o long press gesture
        let longPress: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPressGesture(_:)))
        longPress.minimumPressDuration = 3
        longPressGesture.addGestureRecognizer(longPress)
    }

    // MARK: - Helpers
    
    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        print("tap!!")
    }

    @objc func handleSwipeGesture(_ sender: UITapGestureRecognizer) {
        print("swipe gesture!!")
    }
    
    @objc func handleLongPressGesture(_ sender: UITapGestureRecognizer) {
        print("long press gesture!!")
    }
    
}

