//
//  SATScoreTableViewCell.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Franklin Henry Boswell on 2/24/19.
//  Copyright © 2019 Franklin Henry Boswell. All rights reserved.
//

import Foundation

import UIKit

class SATScoreTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var numTestTakersLabel: UILabel!
    @IBOutlet weak var satCritReadingLabel: UILabel!
    @IBOutlet weak var satMathLabel: UILabel!
    @IBOutlet weak var satMathWritingLabel: UILabel!
    
    func propagateData(nycSatScore: SATScoreData, schoolName: String) {
        numTestTakersLabel.text = nycSatScore.numOfSatTestTakers
        satCritReadingLabel.text = nycSatScore.satCriticalReadingAvgScore
        satMathLabel.text = nycSatScore.satMathAvgScore
        satMathWritingLabel.text = nycSatScore.satWritingAvgScore
    }
    
}

