//
//  FoodWaterViewController.swift
//  AutoBreed
//
//  Created by Qingyun He on 05/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import UIKit

var foodWaterPercentage : Int!

class FoodWaterViewController: UIViewController {

    @IBAction func buttonClicked(_ sender: Any) {
        changePercentage(number:60)
    }
    @IBOutlet weak var foodGuageView: GaugeView!
    @IBOutlet weak var waterGuageView: GaugeView!
    weak var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            //your repeating function
            //get sensor data http
            if (foodWaterPercentage != nil){
                //update the UI of food/water page
                self?.changePercentage(number:Int(Double(foodWaterPercentage)/10.24))
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    // if appropriate, make sure to stop your timer in `deinit`
    
    deinit {
        stopTimer()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodGuageView.thickness = 5
        foodGuageView.labelFont = UIFont.systemFont(ofSize: 40, weight: UIFontWeightThin)
        foodGuageView.labelColor = UIColor.lightGray
        foodGuageView.gaugeBackgroundColor = UIColor.lightGray
        foodGuageView.animationDuration = 1.4
        foodGuageView.gaugeColor = UIColor.init(red: 255, green: 128, blue: 0, alpha: 1)
        
        waterGuageView.thickness = 5
        waterGuageView.labelFont = UIFont.systemFont(ofSize: 40, weight: UIFontWeightThin)
        waterGuageView.labelColor = UIColor.lightGray
        waterGuageView.gaugeBackgroundColor = UIColor.lightGray
        waterGuageView.animationDuration = 1.4
        waterGuageView.gaugeColor = UIColor.init(red: 0, green: 255, blue: 255, alpha: 1)
        startTimer()
        // Do any additional setup after loading the view.
    }
    
    func changePercentage(number:Int){
        foodGuageView.percentage = Float(number)
        foodGuageView.labelText = "\(number)%"
        
        
        waterGuageView.percentage = Float(number)
        waterGuageView.labelText = "\(number)%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
