//
//  ViewController.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Henry Boswell on 2/23/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var nycHighSchools = [HighSchool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNYCHighSchoolData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    /// gets HighSchool Data
    func fetchNYCHighSchoolData() {
        guard let highSchoolDataEndpoint = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$select=dbn,school_name") else {
            return
        }
        let request = URLRequest(url:highSchoolDataEndpoint)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { [weak self] (data, response, error)  in
            if error == nil{
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let highSchoolJSON = json as! [[String : Any]]? {
                    for unit in highSchoolJSON {
                        if let nycHighSchool = HighSchool(json: unit) {
                            self?.nycHighSchools.append(nycHighSchool)
                        }
                    }
                }
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
        }
        task.resume()
        
    }
    /// gets SAT data
    func fetchNYCSATScoreData() {
        guard let satScoreDataEndpoint = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$select=dbn,school_name") else {
            return
        }
        
        let request = URLRequest(url:satScoreDataEndpoint)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { [weak self] (data, response, error)  in
            if error == nil{
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let highSchoolJSON = json as! [[String : Any]]? {
                    for unit in highSchoolJSON {
                        if let nycHighSchool = HighSchool(json: unit) {
                            self?.nycHighSchools.append(nycHighSchool)
                        }
                    }
                }
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
        }
        task.resume()
        
    }

}

