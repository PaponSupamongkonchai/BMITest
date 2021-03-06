//
//  ViewController.swift
//  BMITest
//
//  Created by Papon Supamongkonchai on 4/6/2561 BE.
//  Copyright © 2561 Papon Supamongkonchai. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var labelW: UILabel!
    @IBOutlet weak var labelH: UILabel!
    @IBOutlet weak var txtW: UITextField!
    @IBOutlet weak var txtH: UITextField!
    @IBOutlet weak var txtresultBMI: UILabel!
    @IBOutlet weak var txtAlert: UILabel!
    var audioPlayer :AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtresultBMI.isHidden = true
        txtAlert.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
    @IBAction func btnCal(_ sender: UIButton) {
        
        print(sender.tag)
        let url = Bundle.main.url(forResource: "note4", withExtension: "wav")
        if sender.tag == 0 {
            playSound(ur: url!)
        }
        
        if txtW.text != "" && txtH.text != ""{
            let ss1:String = txtW.text!
            let ss2:String = txtH.text!
            var numberW = Double(ss1)
            var numberH = Double(ss2)
            
            calBMI(w: numberW!, h: numberH!)
            
        }else{
            //txtresultBMI.text = "Please input data for done"
            txtAlert.isHidden = false
        }
    }
    
    func calBMI(w:Double,h:Double) -> UIImage {
        
        var total:Double  = w/pow(h, 2)
        if total > 25{
            resultImage.image = UIImage(named: "fat")
            txtresultBMI.text = "You Fat now"
            txtresultBMI.isHidden = false
            return resultImage.image!
        }else if total > 18.5 {
            resultImage.image = UIImage(named: "normal")
            txtresultBMI.text = "You Body perfect now"
            txtresultBMI.isHidden = false
            return resultImage.image!
        }else{
            resultImage.image = UIImage(named: "underw")
            txtresultBMI.text = "You Body low weight now"
            txtresultBMI.isHidden = false
            return resultImage.image!
        }
  
    }
    func playSound(ur:URL) {
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: ur)
            guard let player = audioPlayer else { return }
            
            player.prepareToPlay()
            player.play()
        }catch let error as NSError{
            print(error)
        }
    }
}

