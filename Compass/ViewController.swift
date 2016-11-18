//
//  ViewController.swift
//  Compass
//
//  Created by Geoffrey Duong on 11/17/16.
//  Copyright © 2016 Geoffrey Duong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        compassImage.isUserInteractionEnabled = true
        compassImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var compassImage: UIImageView!
    
    
    func imageTapped(img: AnyObject)
    {
        speak("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW")
    }
    
    func speak(_ sender: String) {
        let speechUtterance = AVSpeechUtterance(string: sender)
        
        speechSynthesizer.speak(speechUtterance)
    }
}

