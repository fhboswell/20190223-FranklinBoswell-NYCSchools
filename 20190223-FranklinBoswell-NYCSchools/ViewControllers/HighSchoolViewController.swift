//
//  ViewController.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Franklin Henry Boswell on 2/23/19.
//  Copyright © 2019 Franklin Henry Boswell. All rights reserved.
//

import UIKit

class HighSchoolViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    var nycHighSchools = [HighSchool]()
    var nycSATScores = [SATScoreData]()
    var filteredHighSchools = [HighSchool]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    var highSchoolDataURLString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$select=dbn,school_name,overview_paragraph,neighborhood,location,phone_number,school_email,website,school_sports"
    var satScoreDataURLString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var highSchoolTableView: UITableView!
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search High Schools"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        highSchoolTableView.delegate = self
        highSchoolTableView.dataSource = self
        
        getDataFromAPI(urlString: highSchoolDataURLString, processingClosure: processHighSchoolData)
        getDataFromAPI(urlString: satScoreDataURLString, processingClosure: processSATScoreData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var indexPath = sender as! IndexPath
        if segue.identifier == "SATScoreSeuge" {
            let destinationVC = segue.destination as! SATScoreViewController
            
            var nycHighSchoolFromAppropriateDataStore: HighSchool!
            if isFiltering() {
                nycHighSchoolFromAppropriateDataStore = filteredHighSchools[indexPath.row]
            }else{
                nycHighSchoolFromAppropriateDataStore = nycHighSchools[indexPath.row]
            }
            destinationVC.nycHighSchool = nycHighSchoolFromAppropriateDataStore
            destinationVC.nycSATScore = nycSATScores.first(where: { $0.dbn == nycHighSchoolFromAppropriateDataStore.dbn })
            if destinationVC.nycSATScore == nil {
                var noScoreFoundPlaceholder = SATScoreData()
                destinationVC.nycSATScore = noScoreFoundPlaceholder
            }
        }
    }
    
    //MARK: - Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering() {
            return filteredHighSchools.count
        }
        
        return nycHighSchools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolTableViewCell", for: indexPath) as! HighSchoolTableViewCell
        var nycHighSchoolFromAppropriateDataStore: HighSchool!
        if isFiltering() {
            nycHighSchoolFromAppropriateDataStore = filteredHighSchools[indexPath.row]
        }else{
            nycHighSchoolFromAppropriateDataStore = nycHighSchools[indexPath.row]
        }
        
        cell.highSchoolTitleLabel.text = nycHighSchoolFromAppropriateDataStore.schoolName
        cell.delegate = self
        cell.email = nycHighSchoolFromAppropriateDataStore.schoolEmail
        cell.phoneNumber = nycHighSchoolFromAppropriateDataStore.phoneNumber
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SATScoreSeuge", sender: indexPath)
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
                        self?.highSchoolTableView.reloadData()
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
