//
//  LogoutViewController.swift
//  SMUBer
//
//  Created by Du Jinxun on 2019/4/13.
//  Copyright © 2019年 smuber. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {

    @IBOutlet var logoutV: UIView!
    @IBAction func calcelB(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutV.center = view.center
        logoutV.layer.cornerRadius = 10


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
