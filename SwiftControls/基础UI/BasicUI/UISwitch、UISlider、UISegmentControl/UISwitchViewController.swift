//
//  UISwitchViewController.swift
//  SwiftControls
//
//  Created by anfa on 2020/5/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class UISwitchViewController: UIViewController {
    
    @IBOutlet weak var light: UIImageView!
    
    @IBOutlet weak var voice: UIImageView!
    
    @IBOutlet weak var product: UILabel!
    
    @IBOutlet weak var flower: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "UISwitch、UISlider、UISegmentControl使用"
    }

    @IBAction func valueChanged(_ sender: Any){
        
        //UISwitch
        let switchUI = sender as? UISwitch
        
        if let switchUI = switchUI {
            if switchUI.isOn{
                self.light.image = UIImage(named: "light")
                
            }else{
                self.light.image = UIImage(named: "nomal")
            }
        }
        
        
        //UISlider
        let sliderUI = sender as? UISlider
        
        if let sliderUI = sliderUI {
            if sliderUI.value < 0.3 {
                self.voice.image = UIImage(named: "low")
            }else if sliderUI.value < 0.7 {
                self.voice.image = UIImage(named: "middle")
            }else{
                self.voice.image = UIImage(named: "high")
            }
        }
        
        
        //UIStepper
        let stepperUI = sender as? UIStepper
        
        if let stepperUI = stepperUI {
            let value = stepperUI.value
            
            if value < stepperUI.maximumValue {
                self.product.text = "您购买了\(Int(value))件商品"
            }
            
            if value == stepperUI.minimumValue {
                self.product.text = "您未购买任何商品"
            }
            
        }
        
        //UISegementControl
        let segment = sender as? UISegmentedControl
        
        if let segment = segment {
            if segment.selectedSegmentIndex == 0 {
                self.flower.image = UIImage(named: "red")
            }else if segment.selectedSegmentIndex == 1 {
                self.flower.image = UIImage(named: "purple")
            }
        }
        
    }

}
