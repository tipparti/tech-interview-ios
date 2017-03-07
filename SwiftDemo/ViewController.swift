//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Mathew Trussell on 9/18/15.
//  Copyright © 2015 First Performance Global. All rights reserved.
//
//  Updated to Swift 3 9/26/16

import UIKit
import Foundation

/**
 * PURPOSE:
 * This demo app displays a simple UI consisting of two UIButtons and one UILabel.
 *  
 * The first button begins a countdown from 100 to 0, inclusive, that is displayed
 * by the UILabel above it.
 *
 * The second button changes the background color of the UIView, cycling between Red, Green, Blue
 *
 * OBJECTIVE:
 * Once the countdown has begun, the user should be able to continuously cycle through background
 * colors without interrupting the countdown.
 *
 * INSTRUCTIONS:
 * 1) Do not make changes to the storyboard
 * 2) Add your name to the LaunchScreen where indicated
 * 3) Append your name to the project bundle identifier (com.firstperformance.SwiftDemo.YOURNAME)
 * 4) Read all the comments and follow the instructions below
 *
 */
class ViewController: UIViewController {
    
    var count:Int = 100
    
    
    @IBOutlet weak var countdown: UILabel!

    /**
     * Responds to the countdown button being clicked
     *
     * INSTRUCTIONS:
     * 1) The button should be disabled when clicked
     * 2) The button must be enabled again once the countdown is complete
     * 3) The countdown logic should be inside the provided performCountdown method
     * 4) DO NOT EDIT THE METHOD SIGNATURE
     */
    @IBOutlet var Button: UIButton!
    
    
    @IBAction func countdownBtnClicked(sender: UIButton) {
        // Disable the button
        Button.isUserInteractionEnabled = false
        if count < 0 {
            count = 100
        }
        performCountdown(completion: {
        })
        // Enable the button

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    /*
     * Counts down from 100 to 0 and updates the UILabel _countdown as the count changes
     *
     * INSTRUCTIONS:
     * 1) Use Grand Central Dispatch to start the countdown in a background thread
     * 2) The text in the label must be updated in the UI as the countdown progresses
     * 3) The countdown must be driven by a FOR loop that counts UP from 0 to 100
     * 4) The countdown should only decrement every 0.5 seconds
     * 5) DO NOT EDIT THE METHOD SIGNATURE
     */
    func performCountdown(completion: () -> Void) {
        
        let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .userInitiated)
        
        anotherQueue.async {
            for index in 0..<101{
                print(index)
                print("Count: \(self.count)")
                DispatchQueue.main.async{
                    print("Updated UILabel: \(self.count)")
                    self.countdown.text = String(self.count)
                }
                Thread.sleep(forTimeInterval: 0.5)
                self.count -= 1
                print("Decrement Count: \(self.count)")
            }
            self.Button.isUserInteractionEnabled = true
            print("Count Updated")
           
        }
        
            // For 0 to 100 {
            // Pause the thread with this: NSThread.sleepForTimeInterval(0.5)
            //}
//        completion()
    }
    
    
    // DO NOT EDIT
    // Color Change button clicked
    var colorIndex = 0
    let colors: [UIColor] = [.red, .blue, .green]
    
    @IBAction func colorChangeBtnClicked(sender: UIButton) {
        
        self.view.backgroundColor = colorIndex < colors.count ? colors[colorIndex] : .white

        colorIndex = (colorIndex + 1) % 3
    }
}

