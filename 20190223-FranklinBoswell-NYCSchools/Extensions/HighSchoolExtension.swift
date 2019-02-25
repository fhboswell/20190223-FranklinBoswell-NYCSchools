//
//  HighSchoolExtension.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Franklin Henry Boswell on 2/23/19.
//  Copyright © 2019 Franklin Henry Boswell. All rights reserved.
//

extension HighSchool {
    init?(json: [String: Any]) {
        
        guard let dbn = json["dbn"] as? String,
            let schoolName = json["school_name"] as? String,
            let overviewParagraph = json["overview_paragraph"] as? String,
            let neighborhood = json["neighborhood"] as? String,
            let location = json["location"] as? String,
            let phoneNumber = json["phone_number"] as? String,
            let schoolEmail = json["school_email"] as? String,
            let website = json["website"] as? String,
            let schoolSports = json["school_sports"] as? String
            else {
                return nil
        }
        
        self.dbn  = dbn
        self.schoolName = schoolName
        self.overviewParagraph = overviewParagraph
        self.neighborhood = neighborhood
        self.location = location
        self.phoneNumber = phoneNumber
        self.schoolEmail = schoolEmail
        self.website = website
        self.schoolSports = schoolSports
        
        print(self)
        
        
    }
}
