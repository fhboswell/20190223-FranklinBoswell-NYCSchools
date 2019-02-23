//
//  HighSchoolExtension.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Henry Boswell on 2/23/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//

extension HighSchool {
    init?(json: [String: Any]) {
        
        guard let dbn = json["dbn"] as? String,
            let schoolName = json["school_name"] as? String
            //let borough = json["borough"] as? String
            
            else {
                return nil
        }
        
        self.dbn  = dbn
        self.schoolName = schoolName
        //self.borough = borough
        
        print(json)
        
        
    }
}
