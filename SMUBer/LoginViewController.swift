//
//  LoginViewController.swift
//  SMUBer
//
//  Created by Du Jinxun on 2019/3/31.
//  Copyright © 2019年 smuber. All rights reserved.
//

import UIKit

var isCorrected = false
var savedUsername = ""
class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var invalid = false
    
    @IBAction func loginButton(_ sender: UIButton) {
        let userN: String = username.text!
        let passW: String = password.text!
        
        let account = ["userName":userN, "pWord":passW]
        
        guard let url = URL(string: "http://ec2-18-217-216-166.us-east-2.compute.amazonaws.com:8080/login") else {return}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: account, options: []) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
//                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if (!(json!["error"]! as! Bool)) {
                        isCorrected = true
                        
                    }
                    else {
                        isCorrected = false
                        self.invalid = true
                    }
                }
                catch {
                    print(error)
                    
                }
            }
        }.resume()
        
        if(isCorrected) {
            savedUsername = self.username.text!
            self.dissmiss()
        }
        
        if(invalid) {
            let secondViewController = storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
            self.present(secondViewController, animated: true, completion: nil)
        }
        
        
        
    }
    
    func dissmiss() {
        performSegue(withIdentifier: "segue2", sender: self)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dissmiss()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.username.delegate = self
        self.password.delegate = self
        
        username.layer.cornerRadius = 5
        

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username.resignFirstResponder()
        password.resignFirstResponder()
        return(true)
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
