//
//  HomeViewController.swift
//  AutoBreed
//
//  Created by Qingyun He on 23/09/2017.
//  Copyright © 2017 max. All rights reserved.
//

import UIKit
//import AAChartView.swift

extension Date {
    
    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
        
        let currentCalendar = Calendar.current
        
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        
        return end - start
    }
}



extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

class HomeViewController: UIViewController, UIPickerViewDelegate {
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var currentTempreture: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var weekLabel: UIButton!
    @IBOutlet weak var indicatorText: UILabel!

    @IBAction func searchButtonClicked(_ sender: Any) {
        if(self.startDateButton.titleLabel!.text == "Please select start time" || self.endDateButton.titleLabel!.text == "Please select end time"){
            showToast(message: "Please select start time and end time")
        }else if(self.startDateButton.titleLabel!.text == self.endDateButton.titleLabel!.text){
            showToast(message: "Please select different time")
        }
        else{
            getSearchResult(startDate: startDatePicker.date, endDate: endDatePicker.date)
        }
    }
    @IBAction func endDateButtonClicked(_ sender: Any) {
        endDateView.isHidden = false
    }
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var startDateView: UIView!
    @IBAction func startDateButtonClicked(_ sender: Any) {
        startDateView.isHidden = false
    }
    @IBOutlet weak var graphLabel: UILabel!
    @IBOutlet weak var endDateView: UIView!
    @IBOutlet weak var endDateButton: UIButton!
    @IBOutlet weak var startDateButton: UIButton!
    @IBOutlet weak var recommendedTempretureText: UILabel!
    @IBAction func weekButtonClicked(_ sender: Any) {
        weekUIView.isHidden = false
    }
    @IBOutlet weak var weekUIView: UIView!
    var diff:Int = 0
    var currentTemp:Int = -273
    var recommendedTemperature:Int = 21
    var aaChartView = AAChartView()
    var chartModel = AAChartModel.init()
    weak var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] _ in
            //your repeating function
            //get sensor data http
            self?.getSensorData()
            self?.setTemperatureColorAndText(recommendedTemperature:(self?.recommendedTemperature)!,currentTemperature:(self?.currentTemp)!)
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
        startTimer()
        weekUIView.isHidden = true
        startDateView.isHidden = true
        endDateView.isHidden = true

        descriptionView.isHidden = true
        //getSensorData()
        
        
        //set all the date picker
        datePicker.layer.cornerRadius = 20
        datePicker.layer.masksToBounds = true
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.backgroundColor = UIColor.gray
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        startDatePicker.layer.cornerRadius = 20
        startDatePicker.layer.masksToBounds = true
        startDatePicker.datePickerMode = UIDatePickerMode.dateAndTime
        startDatePicker.backgroundColor = UIColor.gray
        startDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        endDatePicker.layer.cornerRadius = 20
        endDatePicker.layer.masksToBounds = true
        endDatePicker.datePickerMode = UIDatePickerMode.dateAndTime
        endDatePicker.backgroundColor = UIColor.gray
        endDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        
        
        //Chart View
        
        aaChartView.frame = CGRect(x:graphView.frame.origin.x,y:graphView.frame.origin.y,width:self.graphView.frame.size.width,height:self.graphView.frame.size.height)
        aaChartView.contentHeight = self.graphView.frame.size.height
        self.view.addSubview(aaChartView)
        
        chartModel = AAChartModel.init()
            .chartTypeSet(AAChartType.Column)
            .titleSet("Hencoop temperature record")
            .invertedSet(false)
            .yAxisTitleSet("Celsius")
            .legendEnabledSet(true)
        
        
        aaChartView.aa_drawChartWithChartModel(chartModel)//图表视图对象调用图表模型对象,绘制最终图形
        

        getSensorData()
        
        //place the date picker on the top
        view.bringSubview(toFront: weekUIView)
        view.bringSubview(toFront: startDateView)
        view.bringSubview(toFront: endDateView)
        
        view.bringSubview(toFront: graphLabel)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        //when raised day button clicked
        if touch?.view != weekUIView {
            let currentDate = Date()
            diff = currentDate.interval(ofComponent: .day, fromDate: datePicker.date)
            if(diff<0){
                weekLabel.setTitle("Please select a past date", for: .normal)
                descriptionView.isHidden = true
            }else if(diff==0){
                weekLabel.setTitle("Choose the start day", for: .normal)
                descriptionView.isHidden = true
            }
            else{
                //valide date, show description
                weekLabel.setTitle("\(diff)\(daySuffix(number: diff)) Day", for: .normal)
                descriptionView.isHidden = false
                setRecommendedTemperature(diffDays: diff)
                self.setTemperatureColorAndText(recommendedTemperature:self.recommendedTemperature,currentTemperature:self.currentTemp)
            }
            //hide the datepikcer
            weekUIView.isHidden = true
        }
        
        //when start time buttton clicked
        if touch?.view != startDateView{
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MMM/yyyy HH:mm"
            startDateButton.setTitle(formatter.string(from: startDatePicker.date), for: .normal)
            startDateView.isHidden = true
        }
        //when end time button clicked
        if touch?.view != endDateView{
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MMM/yyyy HH:mm"
            endDateButton.setTitle(formatter.string(from: endDatePicker.date), for: .normal)
            endDateView.isHidden = true
        }
    }
    
    func daySuffix(number: Int) -> String {
        if(String(number).characters.count>=2){
            let stringNumber = String(String(number).characters.suffix(2))
            if( stringNumber == "11" || stringNumber == "12" || stringNumber == "13"){
                return "th"
            }else{
                let numberString = String(number).characters.last!
                switch numberString {
                case "1".characters.last! : return "st"
                case "2".characters.last! : return "nd"
                case "3".characters.last! : return "rd"
                default: return "th"
                }
            }
        }else{
                let numberString = String(number).characters.last!
                switch numberString {
                case "1".characters.last! : return "st"
                case "2".characters.last! : return "nd"
                case "3".characters.last! : return "rd"
                default: return "th"
                }
            }
    }
    
    
    func setTemperatureColorAndText(recommendedTemperature:Int,currentTemperature:Int){
        diff = currentTemperature - recommendedTemperature
        if (diff>3){
            //diff > 3 red
            currentTempreture.textColor = UIColor.red
            indicatorText.text = "too high"
            indicatorText.textColor = UIColor.red
        }else if(diff <= 3 && diff >= 1){
            //1<= diff <= 2 yellow
            currentTempreture.textColor = UIColor.orange
            indicatorText.text = "bit high"
            indicatorText.textColor = UIColor.orange
        }else if(diff < 1 && diff > -1){
            //-1<diff<1 green
            currentTempreture.textColor = UIColor.green
            indicatorText.text = "normal"
            indicatorText.textColor = UIColor.green
        }else if(diff <= -1 && diff >= -3) {
            //-3<=diff<=-1 CadetBlue1
            currentTempreture.textColor = UIColor.init(red: CGFloat(152/255.0), green: CGFloat(245/255.0), blue: CGFloat(255/255.0), alpha: 1.0)
            indicatorText.text = "bit low"
            indicatorText.textColor = UIColor.init(red: CGFloat(152/255.0), green: CGFloat(245/255.0), blue: CGFloat(255/255.0), alpha: 1.0)
        }else{
            //diff<-3 MediumBlue
            currentTempreture.textColor = UIColor.init(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(205/255.0), alpha: 1.0)
            indicatorText.text = "too low"
            indicatorText.textColor = UIColor.init(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(205/255.0), alpha: 1.0)
        }
    }
    
    func setRecommendedTemperature(diffDays: Int){
        let diffWeeks:Int = Int(diffDays/7)
        if (diffWeeks==0){
            recommendedTempretureText.text = "30℃ ~ 32℃"
            recommendedTemperature = 31
        } else if(diffWeeks==1){
            recommendedTempretureText.text = "28℃ ~ 30℃"
            recommendedTemperature = 29
        } else if(diffWeeks==2){
            recommendedTempretureText.text = "25℃ ~ 28℃"
            recommendedTemperature = 27
        } else if(diffWeeks==3){
            recommendedTempretureText.text = "22℃ ~ 25℃"
            recommendedTemperature = 24
        } else if(diffWeeks==4){
            recommendedTempretureText.text = "21℃ ~ 23℃"
            recommendedTemperature = 22
        } else{
            recommendedTempretureText.text = "21℃"
            recommendedTemperature = 21
        }
    }
    
    
    
    func getSensorData(){
        let urlString = URL(string: "http://172.20.10.8:8081")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "fail to connect")
                } else {
                    if let usableData = data {
                        //JSONSerialization
                        let json = try? JSONSerialization.jsonObject(with: usableData, options: [])
                        let list = json as? [String:Any]
                        let data = list?["Data"] as! NSArray
                      //let date = list?["Date"] as! String
                        red = data[0] as! Double
                        green = data[1] as! Double
                        blue = data[2] as! Double
                        foodWaterPercentage = data[4] as! Int
                        currentMoisture = data[5] as! Int
                        print("foodWaterPercentage: \(foodWaterPercentage)")
                        print("currentMoisture: \(currentMoisture)")
                        DispatchQueue.main.async{
                            self.currentTemp = data[3] as! Int
                            self.currentTempreture.text = String(self.currentTemp)+"℃"
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func getSearchResult(startDate:Date,endDate:Date){
        var tempList = [Int]()
        let startSearchString = local2serverDate(date:startDate)
        let endSearchString = local2serverDate(date:endDate)
        let searchString = startSearchString+"/"+endSearchString
        let urlString = URL(string: "http://172.20.10.8:8081"+"/"+searchString)
        print(urlString!)
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "fail to connect")
                } else {
                    if let usableData = data {
                        //JSONSerialization
                        let json = try? JSONSerialization.jsonObject(with: usableData, options: [])
                        let list = json as? [String:Any]
                        let layer = list?["list"] as? [[String:Any]]
                        for eachlayer in layer!{
                            let temperatureList = eachlayer["Data"] as? NSArray
                            
                            if let temp = temperatureList?[3] as? Int{
                                tempList.append(temp)
                            }
                        }
                        DispatchQueue.main.async{
                            print("result list:"+"\(tempList)")
                            self.graphLabel.isHidden = true
                            
                            let formatter = DateFormatter()
                            formatter.dateFormat = "dd MMM yyyy HH:mm"
                            formatter.timeZone = NSTimeZone.system
                            let date1 = formatter.string(from: self.startDatePicker.date)
                            let date2 = formatter.string(from: self.endDatePicker.date)
                            
                            self.chartModel.subtitleSet(date1 + " to "+date2)
                            self.chartModel.seriesSet([
                                [
                                    "name": "Temperature",
                                    "data": tempList
                                ]])
                            self.aaChartView.aa_refreshChartWithChartModel(self.chartModel)//更新 AAChartModel 数据之后,刷新图表
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
    func server2localDate(x:String)->Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = NSTimeZone.system
        let date = formatter.date(from: x)!
        return date
    }
    
    func local2serverDate(date:Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = NSTimeZone.system
        let date = formatter.string(from: date)
        return date+".000Z"
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
