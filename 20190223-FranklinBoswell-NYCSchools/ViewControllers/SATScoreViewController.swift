//
//  SATScoreViewController.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Franklin Henry Boswell on 2/24/19.
//  Copyright © 2019 Franklin Henry Boswell. All rights reserved.
//


import UIKit

class SATScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //MARK: - Properties
    var nycHighSchool: HighSchool!
    var nycSATScore: SATScoreData!
    lazy var infoForDetailCell = "Neighborhood: \n" + nycHighSchool.neighborhood! + "\n\nSchool Sports: \n" + nycHighSchool.schoolSports! + "\n\nWebsite: \n" + nycHighSchool.website! + "\n\nEmail: \n" + nycHighSchool.schoolEmail! +  "\n\nPhone Number\n" + nycHighSchool.phoneNumber!
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
        return 3
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard nycHighSchool != nil && nycSATScore != nil else { return UITableViewCell() }
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SATScoreTableViewCell", for: indexPath) as! SATScoreTableViewCell
            cell.propagateData(nycSatScore: nycSATScore, schoolName: nycHighSchool.schoolName!)
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
            cell.detailTextView.text = "Overview Summary \n\n" + nycHighSchool.overviewParagraph!
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
            cell.detailTextView.text = infoForDetailCell
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

