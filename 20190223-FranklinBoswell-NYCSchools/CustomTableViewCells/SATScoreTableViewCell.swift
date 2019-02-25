//
//  SATScoreTableViewCell.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Henry Boswell on 2/24/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//

import Foundation

import UIKit

class SATScoreTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var numTestTakersLabel: UILabel!
    @IBOutlet weak var satCritReadingLabel: UILabel!
    @IBOutlet weak var satMathLabel: UILabel!
    @IBOutlet weak var satMathWritingLabel: UILabel!
    
    func propagateData(nycSatScore: SATScoreData, schoolName: String) {
        schoolNameLabel.text = schoolName
        numTestTakersLabel.text = nycSatScore.numOfSatTestTakers
    }
    
}

