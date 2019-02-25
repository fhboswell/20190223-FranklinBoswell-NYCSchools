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
    var nycHighSchool: HighSchool?
    var nycSATScore: SATScoreData?
   
    //MARK: - IBOutlets
    
    @IBOutlet weak var satScoreTableView: UITableView!
    
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nycHighSchool)
        print(nycSATScore)
    }
    
    //MARK: - Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolTableViewCell", for: indexPath) as! HighSchoolTableViewCell
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
   
}

