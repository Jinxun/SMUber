//
//  SignupViewController.swift
//  SMUBer
//
//  Created by Du Jinxun on 2019/3/31.
//  Copyright © 2019年 smuber. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var drivercode: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    
    @IBAction func signupB(_ sender: UIButton) {
        let userN: String = username.text!
        let firstN: String = firstname.text!
        let lastN: String = lastname.text!
        let id: String  = drivercode.text!
        let passW: String = password.text!
        
        let account = ["userName":userN,"firstName": firstN, "lastName":lastN,"id":id,"pWord":passW]
        
        guard let url = URL(string: "http://ec2-18-217-216-166.us-east-2.compute.amazonaws.com:8080/api/registration") else {return}
        
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
                    print(json)
                    self.dismiss(animated: true, completion: nil)
                }
                catch {
                    print(error)
                    
                }
            }
            }.resume()
    }
    
    
    @IBAction func cancelpageButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.username.delegate = self
        self.password.delegate = self
        self.lastname.delegate = self
        self.firstname.delegate = self
        self.drivercode.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username.resignFirstResponder()
        password.resignFirstResponder()
        firstname.resignFirstResponder()
        lastname.resignFirstResponder()
        drivercode.resignFirstResponder()
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
