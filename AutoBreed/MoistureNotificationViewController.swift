//
//  MoistureNotificationViewController.swift
//  AutoBreed
//
//  Created by Qingyun He on 05/11/2017.
//  Copyright © 2017 max. All rights reserved.
//

import UIKit
import SwiftyPickerPopover
import UserNotifications

class MoistureNotificationViewController: UIViewController {
    let s = ["10%","20%","30%","40%","50%","60%","70%","80%","90%"]

    @IBOutlet weak var maxButton: UIButton!
    @IBOutlet weak var miniButton: UIButton!
    
    @IBOutlet weak var moistureNotiSwitch: UISwitch!
    @IBAction func moistureNotiChanged(_ sender: Any) {
        if(moistureNotiSwitch.isOn){
            
            print("switch is on")
            let defaults = UserDefaults.standard
            defaults.set("1", forKey: "MoistureSwitch")
            defaults.synchronize()
        }else if(!moistureNotiSwitch.isOn){
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["moistureNotification"])
            print("switch is off")
            // if moisture is not
            timer = nil
            let defaults = UserDefaults.standard
            defaults.set("0", forKey: "MoistureSwitch")
            defaults.synchronize()
        }
    }
    
//    @IBAction func buttonClicked(_ sender: Any) {
//        // create a corresponding local notification
//        let content = UNMutableNotificationContent()
//        content.title = "Urgent Notice"
//        //content.subtitle = "Subtitle"
//        content.body = "Moisture is too low!"
//        content.badge = 1
//        
//        let trigger  = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
//        
//        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//    }
    
    weak var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
            //your repeating function
            //get sensor data http
            if (currentMoisture != nil){
                //monitor the mositure and send notification
                let stringMoisture = "\(String(Int(Double(currentMoisture)/10.24)))%"
//                if (self?.moistureNotiSwitch.isOn)!{
//                    self?.sendNotification(moisture: stringMoisture)
//                }
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
    
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var miniLabel: UILabel!
    @IBAction func maxClicked(_ sender: Any) {
        let p = StringPickerPopover(title: "Set Maximum Percentage", choices: s)
            .setSelectedRow(4)
            .setDoneButton(title:"👌", action: { (popover, selectedRow, selectedString) in
                print("done row \(selectedRow) \(selectedString)")
                self.setPercentage(number: selectedString,maxOrMin: "Max")
                self.maxLabel.text = selectedString
                self.maxLabel.textColor = UIColor.black
            })
            
            .setCancelButton(title:"🗑", action: { v in print("cancel")} )
        p.appear(originView: maxButton, baseViewController: self)
    }
    
    @IBAction func miniClicked(_ sender: Any) {
        let p = StringPickerPopover(title: "Set Minimum Percentage", choices: s)
            .setSelectedRow(4)
            .setDoneButton(title:"👌", action: { (popover, selectedRow, selectedString) in print("done row \(selectedRow) \(selectedString)")
                self.setPercentage(number: selectedString,maxOrMin: "Min")
                self.miniLabel.text = selectedString
                self.miniLabel.textColor = UIColor.black
            })
            .setCancelButton(title:"🗑", action: { v in print("cancel")} )
        p.appear(originView: miniButton, baseViewController: self)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if getPercentage(maxOrMin:"Max") != "-1"{
            maxLabel.text = "\(getPercentage(maxOrMin:"Max"))"
        }else{
            maxLabel.textColor = UIColor.white
        }
        
        if getPercentage(maxOrMin:"Min") != "-1"{
            miniLabel.text = "\(getPercentage(maxOrMin:"Min"))"
        }else{
            miniLabel.textColor = UIColor.white
        }
        
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
            
        })
        
        if UserDefaults.standard.string(forKey: "MoistureSwitch") != nil {
            if(UserDefaults.standard.string(forKey: "MoistureSwitch")=="1"){
                moistureNotiSwitch.isOn = true
                
            }else{
                moistureNotiSwitch.isOn = false
            }
        }

        startTimer()
        // Do any additional setup after loading the view.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPercentage(number:String,maxOrMin:String){
        // Userdefaults helps to store session data locally
        let defaults = UserDefaults.standard
        defaults.set(number, forKey: maxOrMin)
        
        defaults.synchronize()
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
