//
//  MoistureViewController.swift
//  AutoBreed
//
//  Created by Qingyun He on 05/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import UIKit
import UserNotifications


var currentMoisture : Int!

class MoistureViewController: UIViewController {
    @IBOutlet weak var MoistureGaugeView: GaugeView!

    @IBOutlet weak var guideLabel: UILabel!
    
    weak var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            //your repeating function
            //get sensor data http
            if (currentMoisture != nil){
                //update the UI of moisture page
                self?.changePercentage(number: Int(Double(currentMoisture)/10.24))
                let stringMoisture = "\(String(Int(Double(currentMoisture)/10.24)))%"
                if (UserDefaults.standard.string(forKey: "MoistureSwitch")=="1"){
                    self?.sendNotification(moisture: stringMoisture)
                }
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
        //set badge to 0
        //UIApplication.shared.applicationIconBadgeNumber = 0
        MoistureGaugeView.thickness = 5
        MoistureGaugeView.labelFont = UIFont.systemFont(ofSize: 40, weight: UIFontWeightThin)
        MoistureGaugeView.labelColor = UIColor.lightGray
        MoistureGaugeView.gaugeBackgroundColor = UIColor.lightGray
        MoistureGaugeView.animationDuration = 1.4
        MoistureGaugeView.gaugeColor = UIColor.init(red: 0, green: 191, blue: 255, alpha: 1)
        startTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changePercentage(number:Int){
        MoistureGaugeView.percentage = Float(number)
        MoistureGaugeView.labelText = "\(number)%"
        chageGuideLabel(moisture: number)
    }
    
    func chageGuideLabel(moisture:Int){
        if (moisture>60){
            guideLabel.text = "Moiture is too high"
            guideLabel.textColor = UIColor.blue
        }else if(moisture<40){
            guideLabel.text = "Moiture is too low"
            guideLabel.textColor = UIColor.yellow
        }else{
            guideLabel.text = "Moiture is normal"
            guideLabel.textColor = UIColor.init(red: 0, green: 191, blue: 255, alpha: 1)

        }
    }
    
    
    func setNotificationCotnent(title:String,body:String,timeInterval:Double){
        // create a corresponding local notification
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.badge = 1
        print("trigger prepared")
        let trigger  = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: "moistureNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print("notification done")
    }
    
    //input current moisture and trigger notification
    func sendNotification(moisture:String){
        let max = getPercentage(maxOrMin: "Max")
        let min = getPercentage(maxOrMin: "Min")
        if(max != "-1" && min != "-1"){
            if (moisture>max){
                setNotificationCotnent(title:"Urgent Notice",body:"Moisture is too high!",timeInterval:2.0)
            }
            if (moisture<min){
                setNotificationCotnent(title:"Urgent Notice",body:"Moisture is too low!",timeInterval:2.0)
            }
        }
    }
    
    
    func getPercentage(maxOrMin:String)->String{
        if UserDefaults.standard.string(forKey: maxOrMin) != nil {
            return UserDefaults.standard.string(forKey: maxOrMin)!
        }else{
            return "-1"
        }
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
