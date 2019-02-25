//
//  OutboundCommunication.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Franklin Henry Boswell on 2/24/19.
//  Copyright © 2019 Franklin Henry Boswell. All rights reserved.
//

protocol OutboundCommunication {
    func makeCall(phoneNumber: String)
    func makeEmail(emailAddress: String)
}
