//
//  SATScoreViewController.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Henry Boswell on 2/24/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//


import UIKit

class SATScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //MARK: - Properties
    var nycHighSchool: HighSchool!
    var nycSATScore: SATScoreData!
   
    //MARK: - IBOutlets
 
    @IBOutlet weak var satScoreTableView: UITableView!
    
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        satScoreTableView.delegate = self
        satScoreTableView.dataSource = self
    }
    
    //MARK: - Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard nycHighSchool != nil && nycSATScore != nil else { return UITableViewCell() }
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SATScoreTableViewCell", for: indexPath) as! SATScoreTableViewCell
            cell.propagateData(nycSatScore: nycSATScore, schoolName: nycHighSchool.schoolName!)
            return cell
        }
       return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 276
        }else {
            return UITableView.automaticDimension
        }
    }
}

