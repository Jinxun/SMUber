//
//  SearchViewController.swift
//  SMUBer
//
//  Created by Du Jinxun on 2019/4/5.
//  Copyright © 2019年 smuber. All rights reserved.
//

import UIKit

var stopId = ["28156", "28155", "28157", "32991", "32990", "32992", "32917", "26523", "23727", "26521", "26522", "23376", "23375", "27222", "27428", "28450", "27427", "28155", "26624", "24018", "24019", "12983", "31501", "12985", "23031", "23032", "23830", "12967", "21971", "12986", "14312", "21931", "14313", "14314", "14308", "14315", "14316", "14317", "26162", "26164", "31457", "30079", "31459", "31458"]
var selectedIndex = -1

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tbView: UITableView!
    
    
    var searchID = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchID.count
        } else {
        return stopId.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching {
            cell?.textLabel?.text = searchID[indexPath.row]
        } else {
        cell?.textLabel?.text = stopId[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(searchID.count == 0) {
            selectedIndex = indexPath.row
        } else {
        let idselected = searchID[indexPath.row]
        selectedIndex = stopId.firstIndex(of: idselected)!
        }
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        selectedIndex = -1
        performSegue(withIdentifier: "segue", sender: self)
    }
    

}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchID = stopId.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tbView.reloadData()
    }
        
    
}

