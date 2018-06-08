//
//  PoundViewController.swift
//  BMITest
//
//  Created by Papon Supamongkonchai on 4/6/2561 BE.
//  Copyright © 2561 Papon Supamongkonchai. All rights reserved.
//

import UIKit
import AVFoundation

class PoundViewController: UIViewController {

    @IBOutlet weak var txtResultBMI: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var txtAlert: UILabel!
    @IBOutlet weak var txtP: UITextField!
    @IBOutlet weak var txtInch: UITextField!
    @IBOutlet weak var txtRI: UITextField!
    var audioPlayer :AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtAlert.isHidden = true
        txtResultBMI.isHidden = true
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
        
        if txtP.text != "" && txtInch.text != ""{
            let ss1:String = txtP.text!
            let ss2:String = txtInch.text!
            let ss3:String =  txtRI.text!
            var numberW = Double(ss1)
            
            var numberH = Double(ss2)
            
            var numberRI = Double(ss3)
            
            calBMI(w: numberW!, h: numberH!,r:numberRI!)
            
        }else{
            
            txtAlert.isHidden = false
        }
    }
    
    func calBMI(w:Double,h:Double,r:Double) -> UIImage {
        let w = w * 0.45359237
        let h = h * 12 + r
        let r = r * 0.0254
        var total:Double  = w/pow(r, 2)
        if total > 25{
            resultImage.image = UIImage(named: "fat")
            txtResultBMI.text = "You Fat now"
            txtResultBMI.isHidden = false
            return resultImage.image!
        }else if total > 18.5 {
            resultImage.image = UIImage(named: "normal")
            txtResultBMI.text = "You Body perfect now"
            txtResultBMI.isHidden = false
            return resultImage.image!
        }else{
            resultImage.image = UIImage(named: "underw")
            txtResultBMI.text = "You Body low weight now"
            txtResultBMI.isHidden = false
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
