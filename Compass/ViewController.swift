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
    
    //Global variables
    let speechSynthesizer = AVSpeechSynthesizer()
    var locationManager:CLLocationManager!
    var degrees: CGFloat = 0.0
    var radians: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Location manager initialization
        locationManager  = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingHeading()
        
        //Create gesture recognizer and add to compassImage
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped(img:)))
        compassImage.isUserInteractionEnabled = true
        compassImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //OUTLETS-------------------------------------------------------------------------------
    @IBOutlet weak var compassImage: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    //--------------------------------------------------------------------------------------
    
    
    //Speak location depending on heading.
    func imageTapped(img: AnyObject)
    {
        switch self.degrees {
        //North
        case 340.0...360.0, 0.0..<20.0 :
            speak("You are facing north")
            
        //Northeast
        case 20.0..<70.0:
            speak("You are facing northeast")
            
        //East
        case 70.0..<110.0:
            speak("You are facing east")
            
        //Southeast
        case 110.0..<160.0:
            speak("You are facing southeast")
            
        //South
        case 160.0..<200.0:
            speak("You are facing south")
            
        //Southwest
        case 200.0..<250.0:
            speak("You are facing southwest")
            
        //West
        case 250.0..<290.0:
            speak("You are facing west")
            
        //Northwest
        case 290.0..<340.0:
            speak("You are facing northwest")
            
        //Default
        default:
            speak("Error")
        }
    }
    
    //Text to speech
    func speak(_ sender: String) {
        let speechUtterance = AVSpeechUtterance(string: sender)
        speechSynthesizer.speak(speechUtterance)
    }
    
    //Gets heading of device using location and displays to headingLabel
    func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        headingLabel.text = "Heading: " + heading.magneticHeading.description + "\u{00B0}"
        
        degrees = CGFloat(heading.magneticHeading)
        radians = CGFloat(heading.magneticHeading) * CGFloat(M_PI) / 180.0
        
        //Animate compass image
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .allowUserInteraction, animations: {
            self.compassImage.transform = CGAffineTransform(rotationAngle: -self.radians)
        })
    }
}


