//
//  SATScoresExtension.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Henry Boswell on 2/23/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//

import Foundation
extension SATScoreData {
    init?(json: [String: Any]) {
        
        guard let dbn = json["dbn"] as? String,
            let numOfSatTestTakers = json["num_of_sat_test_takers"] as? String,
            let satCriticalReadingAvgScore = json["sat_critical_reading_avg_score"] as? String,
            let satMathAvgScore = json["sat_math_avg_score"] as? String,
            let satWritingAvgScore = json["sat_writing_avg_score"] as? String else {
                return nil
        }
        
        self.dbn  = dbn
        if numOfSatTestTakers != "s" {
            self.numOfSatTestTakers = numOfSatTestTakers
            self.satCriticalReadingAvgScore = satCriticalReadingAvgScore
            self.satMathAvgScore = satMathAvgScore
            self.satWritingAvgScore = satWritingAvgScore
        } else{
            self.numOfSatTestTakers = "Less than 5"
            self.satCriticalReadingAvgScore = "Supressed"
            self.satMathAvgScore = "Supressed"
            self.satWritingAvgScore = "Supressed"
        }

        
        print(self)
    }
    init?() {
        self.dbn  = "No Data"
        self.numOfSatTestTakers = "No Data"
        self.satCriticalReadingAvgScore = "No Data"
        self.satMathAvgScore = "No Data"
        self.satWritingAvgScore = "No Data"
    }
}
