//
//  DataViewController.swift
//  AutoBreed
//
//  Created by Qingyun He on 23/09/2017.
//  Copyright © 2017 max. All rights reserved.
//

import UIKit

extension UIImage {
    
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
}
var red : Double!
var green : Double!
var blue : Double!

class DataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var currentPoopColor: UIImageView!
    weak var timer: Timer?
    var data = [[AnyObject]]()
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDateView: UIView!
    @IBOutlet weak var startDateView: UIView!
    @IBAction func searchButtonClicked(_ sender: Any) {
        search()
    }
    @IBAction func startDateButtonClicked(_ sender: Any) {
        startDateView.isHidden = false
        scrollView.isUserInteractionEnabled = false
    }

    @IBAction func endDateButtonClicked(_ sender: Any) {
        endDateView.isHidden = false
        scrollView.isUserInteractionEnabled = false
    }
    @IBOutlet weak var startDateButton: UIButton!
    @IBOutlet weak var endDateButton: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            //your repeating function
            //get sensor data http
            print("repeat_color")
            if (red != nil && green != nil && blue != nil){
                let color = UIColor.init(red: CGFloat(red / 255.0), green: CGFloat(green / 255.0), blue: CGFloat(blue / 255.0), alpha : 1.0)
                self?.setPoopColor(currentColor:color)
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
        let date = Date()
        print("\(date)")
        startTimer()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        startDateView.isHidden = true
        endDateView.isHidden = true
        //set all the date picker
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
        
        view.bringSubview(toFront: startDateView)
        view.bringSubview(toFront: endDateView)

        print("repeat_color")
        if (red != nil && green != nil && blue != nil){
            let color = UIColor.init(red: CGFloat(red / 255.0), green: CGFloat(green / 255.0), blue: CGFloat(blue / 255.0), alpha : 1.0)
            self.setPoopColor(currentColor:color)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        //when start time buttton clicked
        if touch?.view != startDateView {
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
        scrollView.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setPoopColor(currentColor:UIColor){
        let image = UIImage(named: "dog-poop(1)")
        currentPoopColor.image = image?.maskWithColor(color: currentColor)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell
        let str = data[indexPath.row][0] as! String
        let index = str.index(str.startIndex , offsetBy: 10)
        let date = str.substring(to: index)
        
        let start = str.index(str.startIndex, offsetBy: 11)
        let end = str.index(str.endIndex, offsetBy: -5)
        let range = start..<end
        let time = str.substring(with: range)
        
        cell.time.text = "\(date) \(time)"
        
        let color = UIColor.init(red: CGFloat(data[indexPath.row][1] as! Double / 255.0), green: CGFloat(data[indexPath.row][2] as! Double / 255.0), blue: CGFloat(data[indexPath.row][3] as! Double / 255.0), alpha : 1.0)
        let image = UIImage(named: "dog-poop(1)")
        cell.poopImageView.image = image?.maskWithColor(color: color)

        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func search(){
        if(startDateButton.titleLabel!.text == "Please select start time" || endDateButton.titleLabel!.text == "Please select end time"){
            showToast(message: "Please select start time and end time")
        }else if(self.startDateButton.titleLabel!.text == self.endDateButton.titleLabel!.text){
            showToast(message: "Please select different time")
        }else{
            getSearchResult(startDate:startDatePicker.date,endDate:endDatePicker.date)
        }
    }
    
    
    
    func getSearchResult(startDate:Date,endDate:Date){
        let startSearchString = local2serverDate(date:startDate)
        let endSearchString = local2serverDate(date:endDate)
        let searchString = startSearchString+"/"+endSearchString
        let urlString = URL(string: "http://172.20.10.8:8081"+"/"+searchString)
        print(urlString)
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
                        self.data.removeAll()
                        for eachlayer in layer!{
                            let dataList = eachlayer["Data"] as? [Double]
                            let date = eachlayer["Date"] as? String
                            let tempList = [date ?? "",dataList![0],dataList![1] ,dataList![2]] as [Any]
                            self.data.append(tempList as [AnyObject])
                        }
                        print(self.data)
                        DispatchQueue.main.async{
                            self.myTableView?.reloadData()
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
        print("server2localDate:   \(date)")
        return date
    }
    
    func local2serverDate(date:Date)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = NSTimeZone.system
        let date = formatter.string(from: date)
        return date+".000Z"
    }

}
