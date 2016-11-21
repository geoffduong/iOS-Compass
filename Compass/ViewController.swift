//
//  ViewController.swift
//  Compass
//
//  Created by Geoffrey Duong on 11/17/16.
//  Copyright © 2016 Geoffrey Duong. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let speechSynthesizer = AVSpeechSynthesizer()
    var locationManager:CLLocationManager!
    var degrees:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager  = CLLocationManager()
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
        
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        compassImage.isUserInteractionEnabled = true
        compassImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var compassImage: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var rotateBtn: UIButton!
    
    //TEST: rotate image
    @IBAction func rotateImage(_ sender: UIButton) {
        degrees += CGFloat(M_PI)/2.0
        UIView.animate(withDuration: 2.0, animations: {
            self.compassImage.transform = CGAffineTransform(rotationAngle: self.degrees)
        })
    }
    
    
    
    
    
    
    
    //Speak if immage is tapped
    func imageTapped(img: AnyObject)
    {
        speak("WWWWW")
    }
    
    //Text to speech
    func speak(_ sender: String) {
        let speechUtterance = AVSpeechUtterance(string: sender)
        speechSynthesizer.speak(speechUtterance)
    }
    
    //Gets heading of device using location
    private func locationManager(manager: CLLocationManager!, didUpdateHeading heading: CLHeading!) {
        // This will print out the direction the device is heading
        headingLabel.text = heading.magneticHeading.description
    }
}


