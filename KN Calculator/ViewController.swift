//
//  ViewController.swift
//  KN Calculator
//
//  Created by Jolan on 13/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets---------------------------------------------
    @IBOutlet weak var kgLabelInput: UITextField!
    @IBOutlet weak var staticForce: UILabel!
    
    @IBOutlet weak var gearKnLabelInput: UITextField!
    
    @IBOutlet weak var hAboveQuickLabelInput: UITextField!
    
    @IBOutlet weak var hSlackLabelInput: UITextField!
    @IBOutlet weak var hHeightFromGroundLabelInput: UITextField!
    
    @IBOutlet weak var hMoveBelayLabelInput: UITextField!
    
    @IBOutlet weak var hRopeStretchLabelInput: UITextField!
    @IBOutlet weak var ropeStretchInM: UILabel!
    
    @IBOutlet weak var distanceSlowingDown: UILabel!
    
    @IBOutlet weak var fallingDistance: UILabel!
    
    @IBOutlet weak var forceOnFall: UILabel!
    @IBOutlet weak var forceOnFallKN: UILabel!
    
    @IBOutlet weak var fallFactorResult: UILabel!
    
    @IBOutlet weak var tensionPulleyResult: UILabel!
    
    //Constants and Variables to be set manually
        //Static Force
        let aAccel = 9.80665
        var mWeight: Int = 0
        var gearKn: Int = 0
        var hAboveQuick: Int = 0
        var hSlack: Int = 0
        var hHeightFromGround: Int = 0
        var hMoveBelay: Int = 0
        var hRopeStretch: Int = 0
        
    //Actions
        //Input climber weight
    @IBAction func kgInputChangerValue(_ sender: UISlider) {
        self.mWeight = Int(sender.value)
        self.kgLabelInput.text = "\(self.mWeight) Kg";
        self.updateResult();
    }
    
    @IBAction func kgInputManual(_ sender: UITextField) {
        self.mWeight = Int(sender.text!) ?? 0
        self.updateResult();
    }
    
    //Input Gear Kn
    @IBAction func gearInputChangerValue(_ sender: UISlider) {
        self.gearKn = Int(sender.value)
        self.gearKnLabelInput.text = "\(self.gearKn) Kn";
        self.updateResult();
    }

    @IBAction func gearInputManual(_ sender: UITextField) {
        self.gearKn = Int(sender.text!) ?? 0
        self.updateResult();
    }
    
        //Input meters above last quickdraw
    @IBAction func hAboveQuickChangerValue(_ sender: UISlider) {
        self.hAboveQuick = Int(sender.value)
        self.hAboveQuickLabelInput.text = "\(self.hAboveQuick) m";
        self.updateResult();
    }
    

    @IBAction func hAboveQuickInputManual(_ sender: UITextField) {
        self.hAboveQuick = Int(sender.text!) ?? 0
        self.updateResult();
    }
    
        //Input of estimated slack
    @IBAction func slackChangerValue(_ sender: UISlider) {
        self.hSlack = Int(sender.value)
        self.hSlackLabelInput.text = "\(self.hSlack) m";
        self.updateResult();
    }
        
    @IBAction func hSlackInputManual(_ sender: UITextField) {
        self.hSlack = Int(sender.text!) ?? 0
        self.updateResult();
    }
    
        //Input of lenght of rope from ground
    @IBAction func hHeightFromGroundChangerValue(_ sender: UISlider) {
        self.hHeightFromGround = Int(sender.value)
        self.hHeightFromGroundLabelInput.text = "\(self.hHeightFromGround) m";
        self.updateResult();
    }
    
    @IBAction func hHeightFromGroundInputManual(_ sender: UITextField) {
        self.hHeightFromGround = Int(sender.text!) ?? 0
        self.updateResult();
    }
    
        //Input of belayer movement in m
    @IBAction func hMoveBelayChangerValue(_ sender: UISlider) {
        self.hMoveBelay = Int(sender.value)
        self.hMoveBelayLabelInput.text = "\(self.hMoveBelay) m";
        self.updateResult();
    }
    
    @IBAction func hMoveBelayInputManual(_ sender: UITextField) {
        self.hMoveBelay = Int(sender.text!) ?? 0
        self.updateResult();
    }
    
        //Input of rope approximate stretch in %
    @IBAction func hRopeStretchChangeValue(_ sender: UISlider) {
        self.hRopeStretch = Int(sender.value)
        self.hRopeStretchLabelInput.text = "\(self.hRopeStretch) %";
        self.updateResult();
    }
    
    @IBAction func hRopeStretchInputManual(_ sender: UITextField) {
        self.hRopeStretch = Int(sender.text!) ?? 0
        self.updateResult();
    }
    
    //Formulas---------------------------------------------
    func updateResult() {
        //Calculate Static Force
        let fForce = Float(self.mWeight)*Float(self.aAccel)
        let fForceRounded = round(fForce*10)/10.0
        staticForce.text = "\(fForceRounded)"
        
        //Calculate Gear KN
        
        //Calculate rope stretch distance
        let dRopeStretchDistance =         Float(self.hRopeStretch)*(Float(self.hHeightFromGround)+Float(self.hAboveQuick)+Float(self.hSlack))/100
        let dRopeStretchDistanceRounded = round(dRopeStretchDistance*10)/10.0
        ropeStretchInM.text = "\(dRopeStretchDistanceRounded)"
        
        //Calculate distance of slowing down
        let dDistanceSlow = Float(self.hMoveBelay)+Float(dRopeStretchDistance)
        let dDistanceSlowRounded = round(dDistanceSlow*10)/10.0
        distanceSlowingDown.text = "\(dDistanceSlowRounded)"
        
        //Calculate falling distance
        let hHeightFall = (Float(self.hAboveQuick)*2)+(Float(self.hRopeStretch)*(Float(self.hAboveQuick)*2)/100)+Float(self.hSlack)
        let hHeightFallRounded = round(hHeightFall*10)/10.0
        fallingDistance.text = "\(hHeightFallRounded)"
        
        //Calculate a force on fall : F=m*a*(h/d) (1N=1kg*1ms^2*(h/d))
        let fForceOnFall = Float(fForce)*(Float(hHeightFall)/Float(dDistanceSlow))
        let fForceOnFallRounded = round(fForceOnFall*10)/10.0
        forceOnFall.text = "\(fForceOnFallRounded)"
        
        //Calculate a force on fall in Kn : F=m*a*(h/d)/1000 (1N=1kg*1ms^2*(h/d))/1000
        let fForceOnFallKN = Float(fForce)*(Float(hHeightFall)/Float(dDistanceSlow))/1000
        let fForceOnFallKNRounded = round(fForceOnFallKN*10)/10.0
        forceOnFallKN.text = "\(fForceOnFallKNRounded)"
        // Calculate fall factor
        let fallFactor = hHeightFall/Float(self.hHeightFromGround)
        let fallFactorRounded = round(fallFactor*10)/10.0
        fallFactorResult.text = "\(fallFactorRounded)"
        
        //Calculate force on gear
        let tensionPulley = fForceOnFallKN*1.60
        let tensionPulleyRounded = round(tensionPulley*10)/10.0
        tensionPulleyResult.text = "\(tensionPulleyRounded)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kgLabelInput.delegate = self
        gearKnLabelInput.delegate = self
        hAboveQuickLabelInput.delegate = self
        hSlackLabelInput.delegate = self
        hHeightFromGroundLabelInput.delegate = self
        hMoveBelayLabelInput.delegate = self
        hRopeStretchLabelInput.delegate = self
        //Do additional setup after loading the view
    }
    
    //Close Keyboard by taping outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        kgLabelInput.resignFirstResponder()
        gearKnLabelInput.resignFirstResponder()
        hAboveQuickLabelInput.resignFirstResponder()
        hSlackLabelInput.resignFirstResponder()
        hHeightFromGroundLabelInput.resignFirstResponder()
        hMoveBelayLabelInput.resignFirstResponder()
        hRopeStretchLabelInput.resignFirstResponder()
    }
}

extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
