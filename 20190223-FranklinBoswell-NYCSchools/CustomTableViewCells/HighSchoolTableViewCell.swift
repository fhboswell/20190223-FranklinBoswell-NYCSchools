//
//  HighSchoolTableViewCell.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Franklin Henry Boswell on 2/23/19.
//  Copyright © 2019 Franklin Henry Boswell. All rights reserved.
//

import Foundation

import UIKit

class HighSchoolTableViewCell: UITableViewCell {
    
    var phoneNumber: String?
    var email: String?
    var delegate: OutboundCommunication?
    @IBOutlet weak var highSchoolTitleLabel: UILabel!
    
    @IBAction func makeACallAction(_ sender: Any) {
        guard let unwrappedPhoneNumber = phoneNumber else { return }
        delegate?.makeCall(phoneNumber: unwrappedPhoneNumber)
    }
    @IBAction func makeAnEmailAction(_ sender: Any) {
        guard let unwrappedEmail = email else { return }
        delegate?.makeEmail(emailAddress: unwrappedEmail)
    }
    
}
