//
//  ViewController.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Henry Boswell on 2/23/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    var nycHighSchools = [HighSchool]()
    var nycSATScores = [SATScoreData]()
    
    var highSchoolDataURLString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$select=dbn,school_name,overview_paragraph,neighborhood,location,phone_number,school_email,website,school_sports"
    var satScoreDataURLString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    //MARK: - IBOutlets
    @IBOutlet weak var highSchoolTableview: UITableView!
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromAPI(urlString: highSchoolDataURLString, processingClosure: processHighSchoolData)
        getDataFromAPI(urlString: satScoreDataURLString, processingClosure: processSATScoreData)
        
        
        highSchoolTableview.delegate = self
        highSchoolTableview.dataSource = self
    }
    
    //MARK: - Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nycHighSchools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolTableViewCell", for: indexPath)
        
        cell.textLabel?.text = nycHighSchools[indexPath.row].schoolName
        return cell
    }
    
    //MARK: - Data
    func getDataFromAPI(urlString: String, processingClosure: @escaping (_: [String: Any]) -> ()) {
        guard let dataEndpointUrl = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url:dataEndpointUrl)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { [weak self] (data, response, error)  in
            if error == nil{
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let jsonAsArrayOfDictonarys = json as! [[String : Any]]? {
                    for jsonUnit in jsonAsArrayOfDictonarys {
                        processingClosure(jsonUnit)
                    }
                    DispatchQueue.main.async { [weak self] in
                        self?.highSchoolTableview.reloadData()
                    }
                }
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
        }
        task.resume()
        
    }
    func processSATScoreData(unit: [String: Any]){
        if let nycSATScore = SATScoreData(json: unit) {
            nycSATScores.append(nycSATScore)
        }
    }
    func processHighSchoolData(unit: [String: Any]){
        if let nycHighSchool = HighSchool(json: unit) {
            nycHighSchools.append(nycHighSchool)
        }
    }
}
