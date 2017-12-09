//
//  PoopInformationViewController.swift
//  AutoBreed
//
//  Created by Qingyun He on 29/09/2017.
//  Copyright © 2017 max. All rights reserved.
//

import UIKit

class PoopInformationViewController: UIViewController {

    @IBAction func click(_ sender: Any) {
        if let url = NSURL(string: "https://www.poulesenville.com/en/tout-sur-les-cacas-de-poules-verts-bruns-noirs-et-toutes-les-nuances-au-travers-2/") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
