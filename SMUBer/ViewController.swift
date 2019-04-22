//
//  ViewController.swift
//  SMUBer
//
//  Created by Du Jinxun on 2019/3/31.
//  Copyright © 2019年 smuber. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    
    private let locationManager = CLLocationManager()
    
    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet var stationButtons: [UIButton]!
    @IBOutlet weak var showS: UIButton!
    @IBOutlet weak var hideS: UIButton!
    
    
    
//markers ----------------------
    let marker1 = GMSMarker()

    let marker2 = GMSMarker()
    let marker3 = GMSMarker()
    let marker4 = GMSMarker()
    let marker5 = GMSMarker()
    let marker7 = GMSMarker()
    let marker8 = GMSMarker()
    let marker9 = GMSMarker()
    let marker10 = GMSMarker()
    let marker11 = GMSMarker()
    let marker12 = GMSMarker()
    let marker13 = GMSMarker()
    let marker14 = GMSMarker()
    let marker15 = GMSMarker()
    let marker16 = GMSMarker()
    let marker17 = GMSMarker()
    let marker18 = GMSMarker()
    let marker19 = GMSMarker()
    let marker20 = GMSMarker()
    let marker21 = GMSMarker()
    let marker22 = GMSMarker()
    let marker23 = GMSMarker()
    let marker24 = GMSMarker()
    let marker25 = GMSMarker()
    let marker26 = GMSMarker()
    let marker27 = GMSMarker()
    let marker28 = GMSMarker()
    let marker31 = GMSMarker()
    let marker32 = GMSMarker()
    let marker33 = GMSMarker()
    let marker34 = GMSMarker()
    let marker35 = GMSMarker()
    let marker36 = GMSMarker()
    let marker37 = GMSMarker()
    let marker38 = GMSMarker()
    let marker39 = GMSMarker()
    let marker40 = GMSMarker()
    let marker41 = GMSMarker()
    let marker42 = GMSMarker()
    let marker43 = GMSMarker()
    let marker44 = GMSMarker()
    let marker45 = GMSMarker()
    let marker46 = GMSMarker()
    let marker47 = GMSMarker()
    let markerBus = GMSMarker()
    let markerBus2 = GMSMarker()
    let markerBus3 = GMSMarker()
    var locationCo = CLLocationCoordinate2D()
    var markerS = GMSMarker()
    var isSearched = false
    var locationcurrent = CLLocationCoordinate2D()
    
    var drivLA: Double = 0
    var drivLO: Double = 0
    
    var drivLA2: Double = 0
    var drivLO2: Double = 0
    
    var drivLA3: Double = 0
    var drivLO3: Double = 0
    
    var cout:Int = 0
    
    var timer1:Timer!
    var timer2:Timer!
    
    @objc func updateInfo() {
        
    }
    
    @objc func getLocation() {
        var coo:[[String: Any]] = []
        
        guard let url = URL(string: "http://ec2-18-217-216-166.us-east-2.compute.amazonaws.com:8080/api/get-loc") else {return}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: account, options: []) else {return}
//        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                //                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]

                    if((json?.count)! > 1){
                        self.cout = 0
                        for lo in json! {
                            if(Double(lo["latitude"]! as! String)! != 0 && Double(lo["longitude"]! as! String)! != 0) {
                                    self.cout += 1
                                coo.append(lo)
                            }
                        }
                        if(self.cout == 1){
                            self.drivLA = Double(coo[0]["latitude"]! as! String)!
                            self.drivLO = Double(coo[0]["longitude"]! as! String)!
                        }
                        else if (self.cout == 2) {
                            self.drivLA = Double(coo[0]["latitude"]! as! String)!
                            self.drivLO = Double(coo[0]["longitude"]! as! String)!
                            
                            self.drivLA2 = Double(coo[1]["latitude"]! as! String)!
                            self.drivLO2 = Double(coo[1]["longitude"]! as! String)!
                            
                        }
                        else if(self.cout == 3) {
                            self.drivLA = Double(coo[0]["latitude"]! as! String)!
                            self.drivLO = Double(coo[0]["longitude"]! as! String)!
                            
                            self.drivLA2 = Double(coo[1]["latitude"]! as! String)!
                            self.drivLO2 = Double(coo[1]["longitude"]! as! String)!
                            
                            self.drivLA3 = Double(coo[2]["latitude"]! as! String)!
                            self.drivLO3 = Double(coo[2]["longitude"]! as! String)!
                        }
                        print(coo)
                        
                    }


                }
                catch {
                    print(error)
                    
                }
            }
            }.resume()
        if(cout == 1){

            self.markerBus.map = nil
            self.markerBus2.map = nil
            self.markerBus3.map = nil
            self.markerBus.position = CLLocationCoordinate2D(latitude: self.drivLA-0.0002, longitude: self.drivLO)
            self.markerBus.icon = UIImage(named: "busmm")
            self.markerBus.map = self.mapView
        }
        else if (cout == 2){

            self.markerBus.map = nil
            self.markerBus.position = CLLocationCoordinate2D(latitude: self.drivLA-0.0002, longitude: self.drivLO)
            self.markerBus.icon = UIImage(named: "busmm")
            self.markerBus.map = self.mapView
            

            self.markerBus2.map = nil
            self.markerBus2.position = CLLocationCoordinate2D(latitude: self.drivLA2-0.0002, longitude: self.drivLO2)
            self.markerBus2.icon = UIImage(named: "busmm")
            self.markerBus2.map = self.mapView
        }
        else if(cout == 3){

            self.markerBus.map = nil
            self.markerBus.position = CLLocationCoordinate2D(latitude: self.drivLA-0.0002, longitude: self.drivLO)
            self.markerBus.icon = UIImage(named: "busmm")
            self.markerBus.map = self.mapView
            

            self.markerBus2.map = nil
            self.markerBus2.position = CLLocationCoordinate2D(latitude: self.drivLA2-0.0002, longitude: self.drivLO2)
            self.markerBus2.icon = UIImage(named: "busmm")
            self.markerBus2.map = self.mapView
            

            self.markerBus3.map = nil
            self.markerBus3.position = CLLocationCoordinate2D(latitude: self.drivLA3-0.0002, longitude: self.drivLO3)
            self.markerBus3.icon = UIImage(named: "busmm")
            self.markerBus3.map = self.mapView
        }
        else{
            self.markerBus.map = nil
            self.markerBus2.map = nil
            self.markerBus3.map = nil}
        
        self.cout = 0
        
        self.drivLA = 0
        self.drivLO = 0
        
        self.drivLA2 = 0
        self.drivLO2 = 0
        
        self.drivLA3 = 0
        self.drivLO3 = 0
        
        
        
    }
    
    @objc func postLocation() {
        locationcurrent = (mapView.myLocation?.coordinate)!
        locationcurrent.latitude = locationcurrent.latitude-0.00015
        let account = ["latitude":locationcurrent.latitude, "longitude":locationcurrent.longitude, "userName":savedUsername] as [String : Any]
        guard let url = URL(string: "http://ec2-18-217-216-166.us-east-2.compute.amazonaws.com:8080/api/edit-loc") else {return}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
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
                }
                catch {
                    print(error)
                    
                }
            }
            }.resume()
    }
    
    @IBOutlet var loginS: UIBarButtonItem!
    
    @IBOutlet var logoutS: UIBarButtonItem!
    
    @IBAction func loginButton(_ sender: UIBarButtonItem) {
        if(timer1 != nil){
            timer1.invalidate()
            timer1 = nil
        }
        timer2.invalidate()
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        logoutS.title=""
        loginS.title="Login"
        
        menuS.title = "Menu"
        isCorrected = false
        

        
        timer1.invalidate()
        let account = ["latitude":"0", "longitude":"0", "userName":savedUsername] as [String : Any]
        guard let url = URL(string: "http://ec2-18-217-216-166.us-east-2.compute.amazonaws.com:8080/api/edit-loc") else {return}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
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
                }
                catch {
                    print(error)
                    
                }
            }
            }.resume()
        
        
        timer1 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.getLocation), userInfo: nil, repeats: true)
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
        self.present(secondViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        timer1.invalidate()
        timer2.invalidate()
        menuShowing = false
        leadingConstraints.constant = -200
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        
    }
    
    
    
    
    @IBAction func showStations(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations:{
            self.hideS.isHidden = false
            self.showS.isHidden = true
        })
        marker1.map = mapView
        marker2.map = mapView
        marker3.map = mapView
        marker4.map = mapView
        marker5.map = mapView
        marker7.map = mapView
        marker8.map = mapView
        marker9.map = mapView
        marker10.map = mapView
        marker11.map = mapView
        marker12.map = mapView
        marker13.map = mapView
        marker14.map = mapView
        marker15.map = mapView
        marker16.map = mapView
        marker17.map = mapView
        marker18.map = mapView
        marker19.map = mapView
        marker20.map = mapView
        marker21.map = mapView
        marker22.map = mapView
        marker23.map = mapView
        marker24.map = mapView
        marker25.map = mapView
        marker26.map = mapView
        marker27.map = mapView
        marker28.map = mapView
        marker31.map = mapView
        marker32.map = mapView
        marker33.map = mapView
        marker34.map = mapView
        marker35.map = mapView
        marker36.map = mapView
        marker37.map = mapView
        marker38.map = mapView
        marker40.map = mapView
        marker41.map = mapView
        marker42.map = mapView
        marker43.map = mapView
        marker44.map = mapView
        marker45.map = mapView
        marker46.map = mapView
        marker47.map = mapView
        
        menuShowing = false
        leadingConstraints.constant = -200
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        
        
    }

    @IBAction func nearMe(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations:{
            self.hideS.isHidden = true
            self.showS.isHidden = false
        })

        var markernew = marker1
        
        var location = CLLocation(latitude: marker1.position.latitude, longitude: marker1.position.longitude)
        let mylocation = CLLocation(latitude: locationCo.latitude, longitude: locationCo.longitude)
        var distance = mylocation.distance(from: location)
        
        var locationnew = CLLocation(latitude: marker2.position.latitude, longitude: marker2.position.longitude)
        var distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker2
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker3.position.latitude, longitude: marker3.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker3
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker4.position.latitude, longitude: marker4.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker4
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker5.position.latitude, longitude: marker5.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker5
            location  = locationnew
            distance = distance2
        }
        

        
        locationnew = CLLocation(latitude: marker7.position.latitude, longitude: marker7.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker7
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker8.position.latitude, longitude: marker8.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker8
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker9.position.latitude, longitude: marker9.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker9
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker10.position.latitude, longitude: marker10.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker10
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker11.position.latitude, longitude: marker11.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker11
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker12.position.latitude, longitude: marker12.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker12
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker13.position.latitude, longitude: marker13.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker13
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker14.position.latitude, longitude: marker14.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker8
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker15.position.latitude, longitude: marker15.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker15
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker16.position.latitude, longitude: marker16.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker16
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker17.position.latitude, longitude: marker17.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker17
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker18.position.latitude, longitude: marker18.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker18
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker19.position.latitude, longitude: marker19.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker19
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker20.position.latitude, longitude: marker20.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker20
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker21.position.latitude, longitude: marker21.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker21
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker22.position.latitude, longitude: marker22.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker22
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker23.position.latitude, longitude: marker23.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker23
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker24.position.latitude, longitude: marker24.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker24
            location  = locationnew
            distance = distance2
        }
        
        
        locationnew = CLLocation(latitude: marker25.position.latitude, longitude: marker25.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker25
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker26.position.latitude, longitude: marker26.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker26
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker27.position.latitude, longitude: marker27.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker27
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker28.position.latitude, longitude: marker28.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker28
            location  = locationnew
            distance = distance2
        }
        
        
        locationnew = CLLocation(latitude: marker31.position.latitude, longitude: marker31.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker31
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker32.position.latitude, longitude: marker32.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker32
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker33.position.latitude, longitude: marker33.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker33
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker34.position.latitude, longitude: marker34.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker34
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker35.position.latitude, longitude: marker35.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker35
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker36.position.latitude, longitude: marker36.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker36
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker37.position.latitude, longitude: marker37.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker37
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker38.position.latitude, longitude: marker38.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker38
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker39.position.latitude, longitude: marker39.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker39
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker40.position.latitude, longitude: marker40.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker40
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker41.position.latitude, longitude: marker41.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker41
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker42.position.latitude, longitude: marker42.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker42
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker43.position.latitude, longitude: marker43.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker43
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker44.position.latitude, longitude: marker44.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker44
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker45.position.latitude, longitude: marker45.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker45
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker46.position.latitude, longitude: marker46.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker46
            location  = locationnew
            distance = distance2
        }
        
        locationnew = CLLocation(latitude: marker47.position.latitude, longitude: marker47.position.longitude)
        distance2 = mylocation.distance(from: locationnew)
        
        if(distance2 < distance) {
            markernew = marker47
            location  = locationnew
            distance = distance2
        }
        
        hideAllMaker()
        markernew.map = mapView
        menuShowing = false
        leadingConstraints.constant = -200
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        mapView.camera = GMSCameraPosition(target: markernew.position, zoom: 17, bearing: 0, viewingAngle: 0)
        mapView.selectedMarker = markernew
        
        
    }
    @IBAction func hideStations(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations:{
            self.hideS.isHidden = true
            self.showS.isHidden = false
        })
        hideAllMaker()
        
        menuShowing = false
        leadingConstraints.constant = -200
        UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        
        
    }
    
    @IBAction func stationButton(_ sender: Any) {
        
        stationButtons.forEach{(button) in
            UIView.animate(withDuration: 0.5, animations:{button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
    var menuShowing = false
    
    @IBOutlet var menuS: UIBarButtonItem!
    
    @IBAction func openButton(_ sender: Any) {
        if(menuShowing){
            leadingConstraints.constant = -200
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        } else{
            leadingConstraints.constant = 0
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        }
        
        menuShowing = !menuShowing
        
    }
    
    func hideAllMaker() {
        marker1.map = nil
        marker2.map = nil
        marker3.map = nil
        marker4.map = nil
        marker5.map = nil
        marker7.map = nil
        marker8.map = nil
        marker9.map = nil
        marker10.map = nil
        marker11.map = nil
        marker12.map = nil
        marker13.map = nil
        marker14.map = nil
        marker15.map = nil
        marker16.map = nil
        marker17.map = nil
        marker18.map = nil
        marker19.map = nil
        marker20.map = nil
        marker21.map = nil
        marker22.map = nil
        marker23.map = nil
        marker24.map = nil
        marker25.map = nil
        marker26.map = nil
        marker27.map = nil
        marker28.map = nil
        marker31.map = nil
        marker32.map = nil
        marker33.map = nil
        marker34.map = nil
        marker35.map = nil
        marker36.map = nil
        marker37.map = nil
        marker38.map = nil
        marker40.map = nil
        marker41.map = nil
        marker42.map = nil
        marker43.map = nil
        marker44.map = nil
        marker45.map = nil
        marker46.map = nil
        marker47.map = nil
        
    }
    
    @objc func pastBus() {
        var isLate = false
        
        let date = Date()
        
        let dateFormatter1 : DateFormatter = DateFormatter()
        dateFormatter1.dateFormat = "HH"
        let dateH = Int(dateFormatter1.string(from: date))!
        
        if(dateH >= 22 || dateH <= 7){
            isLate = true
        }
        
        print(dateH)
        
        let dateFormatter2 : DateFormatter = DateFormatter()
        dateFormatter2.dateFormat = "mm"
        let dateM = Int(dateFormatter2.string(from: date))!
        
        print(dateM)
        
        var sni:String = ""
        
        if(isLate) {
            marker1.snippet = "SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 17) {
            sni = "SMU\n" + "Previous bus time " + String(dateH-1)
            marker1.snippet = sni + ":" + "57"
        }
        else if (dateM < 27) {
            sni = "SMU\n" + "Previous bus time " + String(dateH)
            marker1.snippet = sni + ":" + "17"
        } else if (dateM < 47) {
            sni = "SMU\n" + "Previous bus time " + String(dateH)
            marker1.snippet = sni + ":" + "27"
        } else if(dateM < 57) {
            sni = "SMU\n" + "Previous bus time " + String(dateH)
            marker1.snippet = sni + ":" + "47"
        } else {
            sni = "SMU\n" + "Previous bus time " + String(dateH)
            marker1.snippet = sni + ":" + "57"
        }
        
        if(isLate) {
            marker2.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 16) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker2.snippet = sni + ":" + "56"
        }
        else if (dateM < 26) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker2.snippet = sni + ":" + "16"
        } else if (dateM < 46) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker2.snippet = sni + ":" + "26"
        } else if(dateM < 56) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker2.snippet = sni + ":" + "46"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker2.snippet = sni + ":" + "56"
        }
        
        if(isLate) {
            marker3.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 14) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker3.snippet = sni + ":" + "54"
        }
        else if (dateM < 24) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker3.snippet = sni + ":" + "14"
        } else if (dateM < 44) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker3.snippet = sni + ":" + "24"
        } else if(dateM < 54) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker3.snippet = sni + ":" + "44"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker3.snippet = sni + ":" + "54"
        }
        if(isLate) {
            marker4.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 15) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker4.snippet = sni + ":" + "55"
        }
        else if (dateM < 25) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker4.snippet = sni + ":" + "15"
        } else if (dateM < 45) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker4.snippet = sni + ":" + "25"
        } else if(dateM < 55) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker4.snippet = sni + ":" + "45"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker4.snippet = sni + ":" + "54"
        }
        
        if(isLate) {
            marker5.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 15) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker5.snippet = sni + ":" + "55"
        }
        else if (dateM < 25) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker5.snippet = sni + ":" + "15"
        } else if (dateM < 45) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker5.snippet = sni + ":" + "25"
        } else if(dateM < 55) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker5.snippet = sni + ":" + "45"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker5.snippet = sni + ":" + "55"
        }
        
        if(isLate) {
            marker7.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 16) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker7.snippet = sni + ":" + "56"
        }
        else if (dateM < 26) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker7.snippet = sni + ":" + "16"
        } else if (dateM < 46) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker7.snippet = sni + ":" + "26"
        } else if(dateM < 56) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker7.snippet = sni + ":" + "46"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker7.snippet = sni + ":" + "56"
        }
        if(isLate) {
            marker8.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 14) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker8.snippet = sni + ":" + "54"
        }
        else if (dateM < 24) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker8.snippet = sni + ":" + "14"
        } else if (dateM < 44) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker8.snippet = sni + ":" + "24"
        } else if(dateM < 54) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker8.snippet = sni + ":" + "44"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker8.snippet = sni + ":" + "54"
        }
        
        if(isLate) {
            marker9.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 14) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker9.snippet = sni + ":" + "54"
        }
        else if (dateM < 24) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker9.snippet = sni + ":" + "14"
        } else if (dateM < 44) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker9.snippet = sni + ":" + "24"
        } else if(dateM < 54) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker9.snippet = sni + ":" + "44"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker9.snippet = sni + ":" + "54"
        }
        if(isLate) {
            marker10.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 16) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker10.snippet = sni + ":" + "56"
        }
        else if (dateM < 26) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker10.snippet = sni + ":" + "16"
        } else if (dateM < 46) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker10.snippet = sni + ":" + "26"
        } else if(dateM < 56) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker10.snippet = sni + ":" + "46"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker10.snippet = sni + ":" + "56"
        }
        
        if(isLate) {
            marker11.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 13) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker11.snippet = sni + ":" + "53"
        }
        else if (dateM < 23) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker11.snippet = sni + ":" + "13"
        } else if (dateM < 43) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker11.snippet = sni + ":" + "23"
        } else if(dateM < 53) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker11.snippet = sni + ":" + "43"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker11.snippet = sni + ":" + "53"
        }
        
        if(isLate) {
            marker12.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 17) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker12.snippet = sni + ":" + "57"
        }
        else if (dateM < 27) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker12.snippet = sni + ":" + "17"
        } else if (dateM < 47) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker12.snippet = sni + ":" + "27"
        } else if(dateM < 57) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker12.snippet = sni + ":" + "47"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker12.snippet = sni + ":" + "57"
        }
        
        if(isLate) {
            marker13.snippet = "go to MockingBird Station\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 02) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "52\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker13.snippet = spo + ":" + "52"
        }
        else if(dateM < 12) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "52\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker13.snippet = spo + ":" + "02"
        }
        else if (dateM < 22) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "12\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker13.snippet = spo + ":" + "02"
        } else if (dateM < 32) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "22\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker13.snippet = spo + ":" + "22"
        } else if(dateM < 42) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "22\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker13.snippet = spo + ":" + "32"
        }else if(dateM < 52) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "42\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker13.snippet = spo + ":" + "32"
        } else {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "52\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker13.snippet = spo + ":" + "52"
        }
        
        if(isLate) {
            marker14.snippet = "go to MockingBird Station\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 08) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "48\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker14.snippet = spo + ":" + "58"
        }
        else if(dateM < 18) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "08\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker14.snippet = spo + ":" + "58"
        }
        else if (dateM < 28) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "18\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker14.snippet = spo + ":" + "18"
        } else if (dateM < 38) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "18\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker14.snippet = spo + ":" + "28"
        } else if(dateM < 48) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "38\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker14.snippet = spo + ":" + "28"
        }else if(dateM < 58) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "48\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker14.snippet = spo + ":" + "48"
        } else {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "48\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker14.snippet = spo + ":" + "58"
        }
        
        if(isLate) {
            marker15.snippet = "go to MockingBird Station\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 08) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "48\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker15.snippet = spo + ":" + "58"
        }
        else if(dateM < 18) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "08\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker15.snippet = spo + ":" + "58"
        }
        else if (dateM < 28) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "18\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker15.snippet = spo + ":" + "18"
        } else if (dateM < 38) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "18\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker15.snippet = spo + ":" + "28"
        } else if(dateM < 48) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "38\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker15.snippet = spo + ":" + "28"
        }else if(dateM < 58) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "48\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker15.snippet = spo + ":" + "48"
        } else {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "48\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker15.snippet = spo + ":" + "58"
        }
        
        if(isLate) {
            marker16.snippet = "go to MockingBird Station\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 02) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "52\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker16.snippet = spo + ":" + "52"
        }
        else if(dateM < 12) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "52\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker16.snippet = spo + ":" + "02"
        }
        else if (dateM < 22) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "12\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker16.snippet = spo + ":" + "02"
        } else if (dateM < 32) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "22\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker16.snippet = spo + ":" + "22"
        } else if(dateM < 42) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "22\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker16.snippet = spo + ":" + "32"
        }else if(dateM < 52) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "42\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker16.snippet = spo + ":" + "32"
        } else {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "52\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker16.snippet = spo + ":" + "52"
        }
        
        if(isLate) {
            marker17.snippet = "go to MockingBird Station\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 01) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "51\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker17.snippet = spo + ":" + "51"
        }
        else if(dateM < 11) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "51\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker17.snippet = spo + ":" + "01"
        }
        else if (dateM < 21) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "11\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker17.snippet = spo + ":" + "01"
        } else if (dateM < 31) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "21\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker17.snippet = spo + ":" + "21"
        } else if(dateM < 41) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "21\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker17.snippet = spo + ":" + "31"
        }else if(dateM < 51) {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "41\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker17.snippet = spo + ":" + "31"
        } else {
            sni = "leave MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "51\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker17.snippet = spo + ":" + "51"
        }
        
        if(isLate) {
            marker18.snippet = "go to MockingBird Station\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 09) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "49\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker18.snippet = spo + ":" + "59"
        }
        else if(dateM < 19) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "09\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker18.snippet = spo + ":" + "59"
        }
        else if (dateM < 29) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "19\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker18.snippet = spo + ":" + "19"
        } else if (dateM < 39) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "19\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker18.snippet = spo + ":" + "29"
        } else if(dateM < 49) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "39\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker18.snippet = spo + ":" + "29"
        }else if(dateM < 59) {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "49\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker18.snippet = spo + ":" + "49"
        } else {
            sni = "go to MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "49\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker18.snippet = spo + ":" + "59"
        }
        
        if(isLate) {
            marker19.snippet = "MockingBird Station\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 0) {
            sni = "MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "50\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH-1)
            marker19.snippet = spo + ":" + "50"
        }
        else if(dateM < 10) {
            sni = "MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH-1)
            let spa = sni + ":" + "50\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker19.snippet = spo + ":" + "00"
        }
        else if (dateM < 20) {
            sni = "MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "10\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker19.snippet = spo + ":" + "00"
        } else if (dateM < 30) {
            sni = "MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "20\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker19.snippet = spo + ":" + "20"
        } else if(dateM < 40) {
            sni = "MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "20\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker19.snippet = spo + ":" + "30"
        }else if(dateM < 50) {
            sni = "MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "40\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker19.snippet = spo + ":" + "30"
        } else {
            sni = "MockingBird Station\n" + "Previous bus(go SMU) time " + String(dateH)
            let spa = sni + ":" + "50\n"
            let spo = spa + "Previous bus(go Greenvile) time " + String(dateH)
            marker19.snippet = spo + ":" + "50"
        }
        
        if(isLate) {
            marker20.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 07) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker20.snippet = sni + ":" + "47"
        }
        else if (dateM < 17) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker20.snippet = sni + ":" + "07"
        } else if (dateM < 37) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker20.snippet = sni + ":" + "17"
        } else if(dateM < 47) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker20.snippet = sni + ":" + "37"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker20.snippet = sni + ":" + "47"
        }
        marker20.icon = UIImage(named: "bus2_3")
        
        marker21.position = CLLocationCoordinate2D(latitude: 32.843249, longitude: -96.770218)
        marker21.title = "Station24018"
        if(isLate) {
            marker21.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 07) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker21.snippet = sni + ":" + "47"
        }
        else if (dateM < 17) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker21.snippet = sni + ":" + "07"
        } else if (dateM < 37) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker21.snippet = sni + ":" + "17"
        } else if(dateM < 47) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker21.snippet = sni + ":" + "37"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker21.snippet = sni + ":" + "47"
        }
        
        if(isLate) {
            marker22.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 03) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker22.snippet = sni + ":" + "53"
        }
        else if (dateM < 23) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker22.snippet = sni + ":" + "03"
        } else if (dateM < 33) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker22.snippet = sni + ":" + "23"
        } else if(dateM < 53) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker22.snippet = sni + ":" + "33"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker22.snippet = sni + ":" + "53"
        }
        
        if(isLate) {
            marker23.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 03) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker23.snippet = sni + ":" + "53"
        }
        else if (dateM < 23) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker23.snippet = sni + ":" + "03"
        } else if (dateM < 33) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker23.snippet = sni + ":" + "23"
        } else if(dateM < 53) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker23.snippet = sni + ":" + "33"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker23.snippet = sni + ":" + "53"
        }
        
        if(isLate) {
            marker20.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 06) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker24.snippet = sni + ":" + "46"
        }
        else if (dateM < 16) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker24.snippet = sni + ":" + "06"
        } else if (dateM < 36) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker24.snippet = sni + ":" + "16"
        } else if(dateM < 46) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker24.snippet = sni + ":" + "36"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker24.snippet = sni + ":" + "46"
        }
        
        if(isLate) {
            marker25.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 06) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker25.snippet = sni + ":" + "46"
        }
        else if (dateM < 16) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker25.snippet = sni + ":" + "06"
        } else if (dateM < 36) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker25.snippet = sni + ":" + "16"
        } else if(dateM < 46) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker25.snippet = sni + ":" + "36"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker25.snippet = sni + ":" + "46"
        }
        
        if(isLate) {
            marker26.snippet = "go to SMU\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 05) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH-1)
            marker26.snippet = sni + ":" + "45"
        }
        else if (dateM < 15) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker26.snippet = sni + ":" + "05"
        } else if (dateM < 35) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker26.snippet = sni + ":" + "15"
        } else if(dateM < 45) {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker26.snippet = sni + ":" + "35"
        } else {
            sni = "go to SMU\n" + "Previous bus time " + String(dateH)
            marker26.snippet = sni + ":" + "45"
        }
        
        if(isLate) {
            marker27.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 04) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker27.snippet = sni + ":" + "54"
        }
        else if (dateM < 24) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker27.snippet = sni + ":" + "04"
        } else if (dateM < 34) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker27.snippet = sni + ":" + "24"
        } else if(dateM < 54) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker27.snippet = sni + ":" + "34"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker27.snippet = sni + ":" + "54"
        }
        
        if(isLate) {
            marker28.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 05) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker28.snippet = sni + ":" + "55"
        }
        else if (dateM < 25) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker28.snippet = sni + ":" + "05"
        } else if (dateM < 35) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker28.snippet = sni + ":" + "25"
        } else if(dateM < 55) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker28.snippet = sni + ":" + "35"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker28.snippet = sni + ":" + "55"
        }
        
        if(isLate) {
            marker31.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 05) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker31.snippet = sni + ":" + "55"
        }
        else if (dateM < 25) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker31.snippet = sni + ":" + "05"
        } else if (dateM < 35) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker31.snippet = sni + ":" + "25"
        } else if(dateM < 55) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker31.snippet = sni + ":" + "35"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker31.snippet = sni + ":" + "55"
        }
        
        if(isLate) {
            marker32.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 06) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker32.snippet = sni + ":" + "56"
        }
        else if (dateM < 26) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker32.snippet = sni + ":" + "06"
        } else if (dateM < 36) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker32.snippet = sni + ":" + "26"
        } else if(dateM < 56) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker32.snippet = sni + ":" + "36"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker32.snippet = sni + ":" + "56"
        }
        
        if(isLate) {
            marker42.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 06) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker42.snippet = sni + ":" + "56"
        }
        else if (dateM < 26) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker42.snippet = sni + ":" + "06"
        } else if (dateM < 36) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker42.snippet = sni + ":" + "26"
        } else if(dateM < 56) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker42.snippet = sni + ":" + "36"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker42.snippet = sni + ":" + "56"
        }
        
        if(isLate) {
            marker33.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 07) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker33.snippet = sni + ":" + "57"
        }
        else if (dateM < 27) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker33.snippet = sni + ":" + "07"
        } else if (dateM < 37) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker33.snippet = sni + ":" + "27"
        } else if(dateM < 57) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker33.snippet = sni + ":" + "37"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker33.snippet = sni + ":" + "57"
        }
        
        if(isLate) {
            marker34.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 07) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker34.snippet = sni + ":" + "57"
        }
        else if (dateM < 27) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker34.snippet = sni + ":" + "07"
        } else if (dateM < 37) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker34.snippet = sni + ":" + "27"
        } else if(dateM < 57) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker34.snippet = sni + ":" + "37"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker34.snippet = sni + ":" + "57"
        }
        
        if(isLate) {
            marker35.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 08) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker35.snippet = sni + ":" + "58"
        }
        else if (dateM < 28) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker35.snippet = sni + ":" + "08"
        } else if (dateM < 38) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker35.snippet = sni + ":" + "28"
        } else if(dateM < 58) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker35.snippet = sni + ":" + "38"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker35.snippet = sni + ":" + "58"
        }
        
        if(isLate) {
            marker36.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 08) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker36.snippet = sni + ":" + "58"
        }
        else if (dateM < 28) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker36.snippet = sni + ":" + "08"
        } else if (dateM < 38) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker36.snippet = sni + ":" + "28"
        } else if(dateM < 58) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker36.snippet = sni + ":" + "38"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker36.snippet = sni + ":" + "58"
        }
        
        if(isLate) {
            marker37.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 09) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker37.snippet = sni + ":" + "59"
        }
        else if (dateM < 29) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker37.snippet = sni + ":" + "09"
        } else if (dateM < 39) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker37.snippet = sni + ":" + "29"
        } else if(dateM < 59) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker37.snippet = sni + ":" + "39"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker37.snippet = sni + ":" + "59"
        }
        
        if(isLate) {
            marker38.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 09) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker38.snippet = sni + ":" + "59"
        }
        else if (dateM < 29) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker38.snippet = sni + ":" + "09"
        } else if (dateM < 39) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker38.snippet = sni + ":" + "29"
        } else if(dateM < 59) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker38.snippet = sni + ":" + "39"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker38.snippet = sni + ":" + "59"
        }
        
        if(isLate) {
            marker39.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 09) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker39.snippet = sni + ":" + "59"
        }
        else if (dateM < 29) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker39.snippet = sni + ":" + "09"
        } else if (dateM < 39) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker39.snippet = sni + ":" + "29"
        } else if(dateM < 59) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker39.snippet = sni + ":" + "39"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker39.snippet = sni + ":" + "59"
        }
        
        if(isLate) {
            marker40.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 0) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker40.snippet = sni + ":" + "40"
        }
        else if (dateM < 10) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker40.snippet = sni + ":" + "00"
        } else if (dateM < 30) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker40.snippet = sni + ":" + "10"
        } else if(dateM < 40) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker40.snippet = sni + ":" + "30"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker40.snippet = sni + ":" + "40"
        }
        
        if(isLate) {
            marker41.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 0) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker41.snippet = sni + ":" + "40"
        }
        else if (dateM < 10) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker41.snippet = sni + ":" + "00"
        } else if (dateM < 30) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker41.snippet = sni + ":" + "10"
        } else if(dateM < 40) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker41.snippet = sni + ":" + "30"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker41.snippet = sni + ":" + "40"
        }
        
        if(isLate) {
            marker43.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 2) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker43.snippet = sni + ":" + "42"
        }
        else if (dateM < 12) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker43.snippet = sni + ":" + "02"
        } else if (dateM < 32) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker43.snippet = sni + ":" + "12"
        } else if(dateM < 42) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker43.snippet = sni + ":" + "32"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker43.snippet = sni + ":" + "42"
        }
        
        if(isLate) {
            marker44.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 3) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker44.snippet = sni + ":" + "43"
        }
        else if (dateM < 13) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker44.snippet = sni + ":" + "03"
        } else if (dateM < 33) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker44.snippet = sni + ":" + "13"
        } else if(dateM < 43) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker44.snippet = sni + ":" + "33"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker44.snippet = sni + ":" + "43"
        }
        
        if(isLate) {
            marker45.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 4) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker45.snippet = sni + ":" + "44"
        }
        else if (dateM < 14) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker45.snippet = sni + ":" + "04"
        } else if (dateM < 34) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker45.snippet = sni + ":" + "14"
        } else if(dateM < 44) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker45.snippet = sni + ":" + "34"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker45.snippet = sni + ":" + "44"
        }
        if(isLate) {
            marker46.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 4) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker46.snippet = sni + ":" + "44"
        }
        else if (dateM < 14) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker46.snippet = sni + ":" + "04"
        } else if (dateM < 34) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker46.snippet = sni + ":" + "14"
        } else if(dateM < 44) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker46.snippet = sni + ":" + "34"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker46.snippet = sni + ":" + "44"
        }
        
        if(isLate) {
            marker47.snippet = "go to Greenvile\n" + "No bus avaibaline at this time."
        }
        else if(dateM < 3) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH-1)
            marker47.snippet = sni + ":" + "43"
        }
        else if (dateM < 13) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker47.snippet = sni + ":" + "03"
        } else if (dateM < 33) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker47.snippet = sni + ":" + "13"
        } else if(dateM < 43) {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker47.snippet = sni + ":" + "33"
        } else {
            sni = "go to Greenvile\n" + "Previous bus time " + String(dateH)
            marker47.snippet = sni + ":" + "43"
        }
    }
    
    

    
    override func viewDidLoad() {
        locationManager.delegate = self as CLLocationManagerDelegate
        locationManager.requestWhenInUseAuthorization()

        super.viewDidLoad()

        
        mapView.setMinZoom(15, maxZoom: 17)
        
        
        
        if(!isCorrected) {
        logoutS.title=""
        timer1 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.getLocation), userInfo: nil, repeats: true)
        }
        else{
            menuS.title = ""
            loginS.title=""
            timer1 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.postLocation), userInfo: nil, repeats: true)
        }
        
        timer2 = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(ViewController.pastBus), userInfo: nil, repeats: true)
        
        pastBus()
        
        
        
        marker1.position = CLLocationCoordinate2D(latitude: 32.842776, longitude: -96.784705)
        marker1.title = "Station28156"
        marker1.icon = UIImage(named: "bus2_3")
        
        marker2.position = CLLocationCoordinate2D(latitude: 32.841199, longitude: -96.784762)
        marker2.title = "Station28155"
        marker2.icon = UIImage(named: "bus2_3")
        
        marker3.position = CLLocationCoordinate2D(latitude: 32.841165, longitude: -96.785194)
        marker3.title = "Station28157"
        marker3.icon = UIImage(named: "bus2_3")
        
        marker4.position = CLLocationCoordinate2D(latitude: 32.841005, longitude: -96.781871)
        marker4.title = "Station32991"
        marker4.icon = UIImage(named: "bus2_3")
        
        marker5.position = CLLocationCoordinate2D(latitude: 32.840992,longitude: -96.781531)
        marker5.title = "Station32990"
        marker5.icon = UIImage(named: "bus2_3")
        
        marker7.position = CLLocationCoordinate2D(latitude: 32.840877, longitude: -96.779696)
        marker7.title = "Station32992"
        marker7.icon = UIImage(named: "bus2_3")
        
        marker8.position = CLLocationCoordinate2D(latitude: 32.841034, longitude: -96.779456)
        marker8.title = "Station32917"
        marker8.icon = UIImage(named: "bus2_3")
        
        marker9.position = CLLocationCoordinate2D(latitude: 32.842073, longitude: -96.777424)
        marker9.title = "Station26523"
        marker9.icon = UIImage(named: "bus2_3")
        
        
        marker10.position = CLLocationCoordinate2D(latitude: 32.841886, longitude: -96.778151)
        marker10.title = "Station25727"
        marker10.icon = UIImage(named: "bus2_3")
        
        
        marker11.position = CLLocationCoordinate2D(latitude: 32.842083, longitude: -96.774384)
        marker11.title = "Station26521"
        marker11.icon = UIImage(named: "bus2_3")
        
        marker12.position = CLLocationCoordinate2D(latitude: 32.841950, longitude: -96.774086)
        marker12.title = "Station26522"
        marker12.icon = UIImage(named: "bus2_3")
        
        //sushi folk,can be both to SMU and Greenvile
        marker13.position = CLLocationCoordinate2D(latitude: 32.841746, longitude: -96.771666)
        marker13.title = "Station23376"
        marker13.icon = UIImage(named: "bus2_3")
        
        marker14.position = CLLocationCoordinate2D(latitude: 32.841584, longitude: -96.771745)
        marker14.title = "Station23375"
        marker14.icon = UIImage(named: "bus2_3")
        
        marker15.position = CLLocationCoordinate2D(latitude: 32.839978, longitude: -96.771776)
        marker15.title = "Station27222"
        marker15.icon = UIImage(named: "bus2_3")
        
        marker16.position = CLLocationCoordinate2D(latitude: 32.840024, longitude: -96.771656)
        marker16.title = "Station27428"
        marker16.icon = UIImage(named: "bus2_3")
        
        marker17.position = CLLocationCoordinate2D(latitude: 32.838141, longitude: -96.771806)
        marker17.title = "Station28450"
        marker17.icon = UIImage(named: "bus2_3")
        
        marker18.position = CLLocationCoordinate2D(latitude: 32.838072, longitude: -96.772050)
        marker18.title = "Station27427"
        marker18.icon = UIImage(named: "bus2_3")
        
        //Mockingbird , can be both to SMU and Greenvile
        marker19.position = CLLocationCoordinate2D(latitude: 32.838076, longitude: -96.774426)
        marker19.title = "Station33244"
        marker19.icon = UIImage(named: "bus2_3")
        
        
        marker20.position = CLLocationCoordinate2D(latitude: 32.842307, longitude: -96.770215)
        marker20.title = "Station26624"
        marker20.icon = UIImage(named: "bus2_3")
        
        marker21.position = CLLocationCoordinate2D(latitude: 32.843249, longitude: -96.770218)
        marker21.title = "Station24018"
        marker21.icon = UIImage(named: "bus2_3")
        
        marker22.position = CLLocationCoordinate2D(latitude: 32.842925, longitude: -96.769947)
        marker22.title = "Station24019"
        marker22.icon = UIImage(named: "bus2_3")
        
        marker23.position = CLLocationCoordinate2D(latitude: 32.845302, longitude: -96.769911)
        marker23.title = "Station12983"
        marker23.icon = UIImage(named: "bus2_3")
        
        marker24.position = CLLocationCoordinate2D(latitude: 32.844844, longitude: -96.770236)
        marker24.title = "Station31501"
        marker24.icon = UIImage(named: "bus2_3")
        
        marker25.position = CLLocationCoordinate2D(latitude: 32.845837, longitude: -96.770221)
        marker25.title = "Station12985"
        marker25.icon = UIImage(named: "bus2_3")
        
        marker26.position = CLLocationCoordinate2D(latitude: 32.848546, longitude: -96.770258)
        marker26.title = "Station23031"
        marker26.icon = UIImage(named: "bus2_3")
        
        marker27.position = CLLocationCoordinate2D(latitude: 32.848705, longitude:-96.769878)
        marker27.title = "Station23032"
        marker27.icon = UIImage(named: "bus2_3")
        
        marker28.position = CLLocationCoordinate2D(latitude: 32.850776, longitude: -96.769789)
        marker28.title = "Station23830"
        marker28.icon = UIImage(named: "bus2_3")
        
        marker31.position = CLLocationCoordinate2D(latitude: 32.852942, longitude: -96.769355)
        marker31.title = "Station12967"
        marker31.icon = UIImage(named: "bus2_3")
        
        marker32.position = CLLocationCoordinate2D(latitude: 32.8549, longitude: -96.768922)
        marker32.title = "Station21971"
        marker32.icon = UIImage(named: "bus2_3")
        
        marker42.position = CLLocationCoordinate2D(latitude: 32.856928, longitude:  -96.768501)
        marker42.title = "Station12986"
        marker42.icon = UIImage(named: "bus2_3")
        
        marker33.position = CLLocationCoordinate2D(latitude: 32.857012, longitude: -96.765799)
        marker33.title = "Station14312"
        marker33.icon = UIImage(named: "bus2_3")
        
        marker34.position = CLLocationCoordinate2D(latitude: 32.85531, longitude: -96.765395)
        marker34.title = "Station21931"
        marker34.icon = UIImage(named: "bus2_3")
        
        marker35.position = CLLocationCoordinate2D(latitude: 32.853922, longitude: -96.764625)
        marker35.title = "Station14313"
        marker35.icon = UIImage(named: "bus2_3")
        
        marker36.position = CLLocationCoordinate2D(latitude: 32.852383, longitude: -96.764505)
        marker36.title = "Station14314"
        marker36.icon = UIImage(named: "bus2_3")
        
        marker37.position = CLLocationCoordinate2D(latitude: 32.850557, longitude: -96.764474)
        marker37.title = "Station14308"
        marker37.icon = UIImage(named: "bus2_3")
        
        marker38.position = CLLocationCoordinate2D(latitude: 32.849413, longitude: -96.764495)
        marker38.title = "Station14315"
        marker38.icon = UIImage(named: "bus2_3")
        
        marker39.position = CLLocationCoordinate2D(latitude: 32.847858, longitude: -96.764449)
        marker39.title = "Station14316"
        marker39.icon = UIImage(named: "bus2_3")
        
        marker40.position = CLLocationCoordinate2D(latitude: 32.846476, longitude: -96.764018)
        marker40.title = "Station14317"
        marker40.icon = UIImage(named: "bus2_3")
        
        marker41.position = CLLocationCoordinate2D(latitude: 32.844429, longitude: -96.762806)
        marker41.title = "Station26162"
        marker41.icon = UIImage(named: "bus2_3")
        
        marker43.position = CLLocationCoordinate2D(latitude: 32.843812, longitude: -96.765118)
        marker43.title = "Station26164"
        marker43.icon = UIImage(named: "bus2_3")
        
        marker44.position = CLLocationCoordinate2D(latitude: 32.844059, longitude: -96.767253)
        marker44.title = "Station31457"
        marker44.icon = UIImage(named: "bus2_3")
        
        marker45.position = CLLocationCoordinate2D(latitude: 32.847241, longitude: -96.767636)
        marker45.title = "Station30079"
        marker45.icon = UIImage(named: "bus2_3")
        
        marker46.position = CLLocationCoordinate2D(latitude: 32.84882, longitude: -96.767763)
        marker46.title = "Station31459"
        marker46.icon = UIImage(named: "bus2_3")
        
        marker47.position = CLLocationCoordinate2D(latitude: 32.845377, longitude: -96.767666)
        marker47.title = "Station31458"
        marker47.icon = UIImage(named: "bus2_3")


        
        
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 32.841075, longitude: -96.784853))
        path.add(CLLocationCoordinate2D(latitude: 32.842911, longitude: -96.784825))
        path.add(CLLocationCoordinate2D(latitude: 32.842967, longitude: -96.784951))
        path.add(CLLocationCoordinate2D(latitude: 32.842946, longitude: -96.785073))
        path.add(CLLocationCoordinate2D(latitude: 32.842881, longitude: -96.785122))
        path.add(CLLocationCoordinate2D(latitude: 32.841080, longitude: -96.785170))
        path.add(CLLocationCoordinate2D(latitude: 32.841061, longitude: -96.782082))
        path.add(CLLocationCoordinate2D(latitude: 32.840995, longitude: -96.781723))
        path.add(CLLocationCoordinate2D(latitude: 32.840931, longitude: -96.781454))
        path.add(CLLocationCoordinate2D(latitude: 32.840927, longitude: -96.779380))
        path.add(CLLocationCoordinate2D(latitude: 32.842074, longitude: -96.779385))
        path.add(CLLocationCoordinate2D(latitude: 32.842023, longitude: -96.778793))
        path.add(CLLocationCoordinate2D(latitude: 32.841926, longitude: -96.778212))
        path.add(CLLocationCoordinate2D(latitude: 32.841963, longitude: -96.777696))
        path.add(CLLocationCoordinate2D(latitude: 32.842046, longitude: -96.777210))
        path.add(CLLocationCoordinate2D(latitude: 32.842101, longitude: -96.776632))
        path.add(CLLocationCoordinate2D(latitude: 32.842075, longitude: -96.775851))
        path.add(CLLocationCoordinate2D(latitude: 32.842057, longitude: -96.774431))
        path.add(CLLocationCoordinate2D(latitude: 32.842020, longitude: -96.774217))
        
        let path2 = GMSMutablePath()

        path2.add(CLLocationCoordinate2D(latitude: 32.841967, longitude: -96.779385))
        path2.add(CLLocationCoordinate2D(latitude: 32.841959, longitude: -96.779068))
        path2.add(CLLocationCoordinate2D(latitude: 32.841812, longitude: -96.778210))
        path2.add(CLLocationCoordinate2D(latitude: 32.841853, longitude: -96.777664))
        path2.add(CLLocationCoordinate2D(latitude: 32.841935, longitude: -96.777182))
        path2.add(CLLocationCoordinate2D(latitude: 32.841974, longitude: -96.776908))
        path2.add(CLLocationCoordinate2D(latitude: 32.841975, longitude: -96.776756))
        path2.add(CLLocationCoordinate2D(latitude: 32.841956, longitude: -96.776561))
        path2.add(CLLocationCoordinate2D(latitude: 32.841951, longitude: -96.775928))
        path2.add(CLLocationCoordinate2D(latitude: 32.841949, longitude: -96.775021))
        path2.add(CLLocationCoordinate2D(latitude: 32.841970, longitude: -96.774401))
        path2.add(CLLocationCoordinate2D(latitude: 32.842020, longitude: -96.774217))
        
        let path3 = GMSMutablePath()
        path3.add(CLLocationCoordinate2D(latitude: 32.842020, longitude: -96.774217))
        path3.add(CLLocationCoordinate2D(latitude: 32.842015, longitude: -96.774104))
        path3.add(CLLocationCoordinate2D(latitude: 32.842020, longitude: -96.771921))
        path3.add(CLLocationCoordinate2D(latitude: 32.842010, longitude: -96.771701))
        path3.add(CLLocationCoordinate2D(latitude: 32.838453, longitude: -96.771730))
        path3.add(CLLocationCoordinate2D(latitude: 32.838347, longitude: -96.771755))
        path3.add(CLLocationCoordinate2D(latitude: 32.838262, longitude: -96.771791))
        path3.add(CLLocationCoordinate2D(latitude: 32.837984, longitude: -96.772074))
        path3.add(CLLocationCoordinate2D(latitude: 32.837930, longitude: -96.772189))
        path3.add(CLLocationCoordinate2D(latitude: 32.837903, longitude: -96.772283))
        path3.add(CLLocationCoordinate2D(latitude: 32.837880, longitude: -96.772411))
        path3.add(CLLocationCoordinate2D(latitude: 32.837889, longitude: -96.773660))
        path3.add(CLLocationCoordinate2D(latitude: 32.838108, longitude: -96.773655))
        path3.add(CLLocationCoordinate2D(latitude: 32.838311, longitude: -96.773726))
        path3.add(CLLocationCoordinate2D(latitude: 32.838251, longitude: -96.773829))
        path3.add(CLLocationCoordinate2D(latitude: 32.838131, longitude: -96.773910))
        path3.add(CLLocationCoordinate2D(latitude: 32.837250, longitude: -96.77510))
        path3.add(CLLocationCoordinate2D(latitude: 32.837516, longitude: -96.774525))
        path3.add(CLLocationCoordinate2D(latitude: 32.837717, longitude: -96.774287))
        path3.add(CLLocationCoordinate2D(latitude: 32.837818, longitude: -96.774136))
        path3.add(CLLocationCoordinate2D(latitude: 32.837884, longitude: -96.773891))
        path3.add(CLLocationCoordinate2D(latitude: 32.837889, longitude: -96.773660))
        
        let path4 = GMSMutablePath()
        path4.add(CLLocationCoordinate2D(latitude: 32.842010, longitude: -96.771701))
        path4.add(CLLocationCoordinate2D(latitude: 32.842005, longitude: -96.770015))
        path4.add(CLLocationCoordinate2D(latitude: 32.850235, longitude: -96.769966))
        path4.add(CLLocationCoordinate2D(latitude: 32.850466, longitude: -96.769947))
        path4.add(CLLocationCoordinate2D(latitude: 32.851157, longitude: -96.769815))
        path4.add(CLLocationCoordinate2D(latitude: 32.855192, longitude: -96.768947))
        path4.add(CLLocationCoordinate2D(latitude: 32.855559, longitude: -96.768883))
        path4.add(CLLocationCoordinate2D(latitude: 32.857073, longitude: -96.768549))
        path4.add(CLLocationCoordinate2D(latitude: 32.857081, longitude: -96.768200))
        path4.add(CLLocationCoordinate2D(latitude: 32.857080, longitude: -96.767633))
        path4.add(CLLocationCoordinate2D(latitude: 32.857063, longitude: -96.766916))
        path4.add(CLLocationCoordinate2D(latitude: 32.857072, longitude: -96.766677))
        path4.add(CLLocationCoordinate2D(latitude: 32.857106, longitude: -96.766474))
        path4.add(CLLocationCoordinate2D(latitude: 32.857150, longitude: -96.766291))
        path4.add(CLLocationCoordinate2D(latitude: 32.857275, longitude: -96.765988))
        path4.add(CLLocationCoordinate2D(latitude: 32.856835, longitude: -96.765630))
        path4.add(CLLocationCoordinate2D(latitude: 32.856652, longitude: -96.765518))
        path4.add(CLLocationCoordinate2D(latitude: 32.856433, longitude: -96.765448))
        path4.add(CLLocationCoordinate2D(latitude: 32.855723, longitude: -96.765445))
        path4.add(CLLocationCoordinate2D(latitude: 32.855507, longitude: -96.765418))
        path4.add(CLLocationCoordinate2D(latitude: 32.855363, longitude: -96.765387))
        path4.add(CLLocationCoordinate2D(latitude: 32.855222, longitude: -96.765348))
        path4.add(CLLocationCoordinate2D(latitude: 32.855076, longitude: -96.765287))
        path4.add(CLLocationCoordinate2D(latitude: 32.854761, longitude: -96.765110))
        path4.add(CLLocationCoordinate2D(latitude: 32.854064, longitude: -96.764654))
        path4.add(CLLocationCoordinate2D(latitude: 32.853525, longitude: -96.764458))
        path4.add(CLLocationCoordinate2D(latitude: 32.853171, longitude: -96.764453))
        path4.add(CLLocationCoordinate2D(latitude: 32.852865, longitude: -96.764462))
        path4.add(CLLocationCoordinate2D(latitude: 32.852654, longitude: -96.764472))
        path4.add(CLLocationCoordinate2D(latitude: 32.850941, longitude: -96.764493))
        path4.add(CLLocationCoordinate2D(latitude: 32.850792, longitude: -96.764450))
        path4.add(CLLocationCoordinate2D(latitude: 32.849176, longitude: -96.764449))
        path4.add(CLLocationCoordinate2D(latitude: 32.848381, longitude: -96.764452))
        path4.add(CLLocationCoordinate2D(latitude: 32.847983, longitude: -96.764439))
        path4.add(CLLocationCoordinate2D(latitude: 32.847722, longitude: -96.764397))
        path4.add(CLLocationCoordinate2D(latitude: 32.847578, longitude: -96.764384))
        path4.add(CLLocationCoordinate2D(latitude: 32.847190, longitude: -96.764277))
        path4.add(CLLocationCoordinate2D(latitude: 32.846818, longitude: -96.764113))
        path4.add(CLLocationCoordinate2D(latitude: 32.846722, longitude: -96.764069))
        path4.add(CLLocationCoordinate2D(latitude: 32.845899, longitude: -96.763566))
        path4.add(CLLocationCoordinate2D(latitude: 32.845399, longitude: -96.763255))
        path4.add(CLLocationCoordinate2D(latitude: 32.845059, longitude: -96.763072))
        path4.add(CLLocationCoordinate2D(latitude: 32.844794, longitude: -96.762962))
        path4.add(CLLocationCoordinate2D(latitude: 32.844679, longitude: -96.762917))
        path4.add(CLLocationCoordinate2D(latitude: 32.844335, longitude: -96.762806))
        path4.add(CLLocationCoordinate2D(latitude: 32.844340, longitude: -96.763178))
        path4.add(CLLocationCoordinate2D(latitude: 32.844286, longitude: -96.763598))
        path4.add(CLLocationCoordinate2D(latitude: 32.844143, longitude: -96.764136))
        path4.add(CLLocationCoordinate2D(latitude: 32.844053, longitude: -96.764461))
        path4.add(CLLocationCoordinate2D(latitude: 32.843986, longitude: -96.764861))
        path4.add(CLLocationCoordinate2D(latitude: 32.843960, longitude: -96.765300))
        path4.add(CLLocationCoordinate2D(latitude: 32.843956, longitude: -96.766159))
        path4.add(CLLocationCoordinate2D(latitude: 32.843987, longitude: -96.767719))
        path4.add(CLLocationCoordinate2D(latitude: 32.844947, longitude: -96.767715))
        path4.add(CLLocationCoordinate2D(latitude: 32.845584, longitude: -96.767709))
        path4.add(CLLocationCoordinate2D(latitude: 32.846494, longitude: -96.767706))
        path4.add(CLLocationCoordinate2D(latitude: 32.847390, longitude: -96.767706))
        path4.add(CLLocationCoordinate2D(latitude: 32.848825, longitude: -96.767703))
        path4.add(CLLocationCoordinate2D(latitude: 32.848809, longitude: -96.768010))
        path4.add(CLLocationCoordinate2D(latitude: 32.848806, longitude: -96.769266))
        path4.add(CLLocationCoordinate2D(latitude: 32.848819, longitude: -96.770148))
        path4.add(CLLocationCoordinate2D(latitude: 32.845574, longitude: -96.770154))
        path4.add(CLLocationCoordinate2D(latitude: 32.844695, longitude: -96.770168))
        path4.add(CLLocationCoordinate2D(latitude: 32.843144, longitude: -96.770158))
        path4.add(CLLocationCoordinate2D(latitude: 32.842010, longitude: -96.770161))
   

        
        let route = GMSPolyline(path: path)
        route.strokeColor = .gray
        route.strokeWidth = 3
        route.map = mapView
        
        let route2 = GMSPolyline(path: path2)
        route2.strokeColor = .gray
        route2.strokeWidth = 3
        route2.map = mapView
        
        let route3 = GMSPolyline(path: path3)
        route3.strokeColor = .gray
        route3.strokeWidth = 3
        route3.map = mapView
        
        let route4 = GMSPolyline(path: path4)
        route4.strokeColor = .gray
        route4.strokeWidth = 3
        route4.map = mapView
        
        
        if(selectedIndex != -1) {
            isSearched = true
            let mid = stopId[selectedIndex]

            if(mid == (marker1.title!.substring(from: 7))) {
                markerS = marker1
                markerS.map = mapView
            }
            
            if(mid == marker2.title?.substring(from: 7)) {
                markerS = marker2
                markerS.map = mapView
            }
            
            if(mid == marker3.title?.substring(from: 7)) {
                markerS = marker3
                markerS.map = mapView
            }
            
            if(mid == marker4.title?.substring(from: 7)) {
                markerS = marker4
                markerS.map = mapView
            }
            
            if(mid == marker5.title?.substring(from: 7)) {
                markerS = marker5
                markerS.map = mapView
            }
            
            
            if(mid == marker7.title?.substring(from: 7)) {
                markerS = marker7
                markerS.map = mapView
            }
            
            if(mid == marker8.title?.substring(from: 7)) {
                markerS = marker8
                markerS.map = mapView
            }
            
            if(mid == marker9.title?.substring(from: 7)) {
                markerS = marker9
                markerS.map = mapView
            }
            
            if(mid == marker10.title?.substring(from: 7)) {
                markerS = marker10
                markerS.map = mapView
            }
            
            if(mid == marker11.title?.substring(from: 7)) {
                markerS = marker11
                markerS.map = mapView
            }
            
            if(mid == marker12.title?.substring(from: 7)) {
                markerS = marker12
                markerS.map = mapView
            }
            
            if(mid == marker13.title?.substring(from: 7)) {
                markerS = marker13
                markerS.map = mapView
            }
            
            if(mid == marker14.title?.substring(from: 7)) {
                markerS = marker14
                markerS.map = mapView
            }
            
            if(mid == marker15.title?.substring(from: 7)) {
                markerS = marker15
                markerS.map = mapView
            }
            
            if(mid == marker16.title?.substring(from: 7)) {
                markerS = marker16
                markerS.map = mapView
            }
            
            if(mid == marker17.title?.substring(from: 7)) {
                markerS = marker17
                markerS.map = mapView
            }
            
            if(mid == marker18.title?.substring(from: 7)) {
                markerS = marker18
                markerS.map = mapView
            }
            
            if(mid == marker19.title?.substring(from: 7)) {
                markerS = marker19
                markerS.map = mapView
            }
            
            if(mid == marker20.title?.substring(from: 7)) {
                markerS = marker20
                markerS.map = mapView
            }
            
            if(mid == marker21.title?.substring(from: 7)) {
                markerS = marker21
                markerS.map = mapView
            }
            
            if(mid == marker22.title?.substring(from: 7)) {
                markerS = marker22
                markerS.map = mapView
            }
            
            if(mid == marker23.title?.substring(from: 7)) {
                markerS = marker23
                markerS.map = mapView
            }
            
            if(mid == marker24.title?.substring(from: 7)) {
                markerS = marker24
                markerS.map = mapView
            }
            
            if(mid == marker25.title?.substring(from: 7)) {
                markerS = marker25
                markerS.map = mapView
            }
            
            if(mid == marker26.title?.substring(from: 7)) {
                markerS = marker26
                markerS.map = mapView
            }
            
            if(mid == marker27.title?.substring(from: 7)) {
                markerS = marker27
                markerS.map = mapView
            }
            
            if(mid == marker28.title?.substring(from: 7)) {
                markerS = marker28
                markerS.map = mapView
            }
            
            if(mid == marker31.title?.substring(from: 7)) {
                markerS = marker31
                markerS.map = mapView
            }
            
            if(mid == marker32.title?.substring(from: 7)) {
                markerS = marker32
                markerS.map = mapView
            }
            
            if(mid == marker33.title?.substring(from: 7)) {
                markerS = marker33
                markerS.map = mapView
            }
            
            if(mid == marker34.title?.substring(from: 7)) {
                markerS = marker34
                markerS.map = mapView
            }
            
            if(mid == marker35.title?.substring(from: 7)) {
                markerS = marker35
                markerS.map = mapView
            }
            
            if(mid == marker36.title?.substring(from: 7)) {
                markerS = marker36
                markerS.map = mapView
            }
            
            if(mid == marker37.title?.substring(from: 7)) {
                markerS = marker37
                markerS.map = mapView
            }
            
            if(mid == marker38.title?.substring(from: 7)) {
                markerS = marker38
                markerS.map = mapView
            }
            
            if(mid == marker39.title?.substring(from: 7)) {
                markerS = marker39
                markerS.map = mapView
            }
            
            if(mid == marker40.title?.substring(from: 7)) {
                markerS = marker40
                markerS.map = mapView
            }
            
            if(mid == marker41.title?.substring(from: 7)) {
                markerS = marker41
                markerS.map = mapView
            }
            
            if(mid == marker42.title?.substring(from: 7)) {
                markerS = marker42
                markerS.map = mapView
            }
            
            if(mid == marker43.title?.substring(from: 7)) {
                markerS = marker43
                markerS.map = mapView
            }
            
            if(mid == marker44.title?.substring(from: 7)) {
                markerS = marker44
                markerS.map = mapView
            }
            
            if(mid == marker45.title?.substring(from: 7)) {
                markerS = marker45
                markerS.map = mapView
            }
            
            if(mid == marker46.title?.substring(from: 7)) {
                markerS = marker46
                markerS.map = mapView
            }
            
            if(mid == marker47.title?.substring(from: 7)) {
                markerS = marker47
                markerS.map = mapView
            }
        }

    }
    
    

    
    
    
    
}
// MARK: - CLLocationManagerDelegate
//1
extension ViewController: CLLocationManagerDelegate {
    // 2
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // 3
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
        locationCo = (locationManager.location?.coordinate)!
        
        //5
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        locationCo = location.coordinate
        if(isSearched) {
            mapView.camera = GMSCameraPosition(target: markerS.position, zoom: 17, bearing: 0, viewingAngle: 0)
            mapView.selectedMarker = markerS
        } else {
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        }
        
        // 8
        locationManager.stopUpdatingLocation()
    }
}

extension String {
    public func substring(from index: Int) -> String {
        if self.characters.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[startIndex..<self.endIndex]
            
            return String(subString)
        } else {
            return self
        }
    }
}

