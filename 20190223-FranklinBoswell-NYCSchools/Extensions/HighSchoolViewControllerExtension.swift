//
//  RootViewControllerExtension.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Franklin Henry Boswell on 2/23/19.
//  Copyright © 2019 Franklin Henry Boswell. All rights reserved.
//
//

import Foundation
import UIKit
import MessageUI

extension HighSchoolViewController: UISearchResultsUpdating {
    
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredHighSchools = nycHighSchools.filter({( nycHighSchool : HighSchool) -> Bool in
            return (nycHighSchool.schoolName?.lowercased().contains(searchText.lowercased()))!
        })
        
        highSchoolTableView.reloadData()
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension HighSchoolViewController: MFMailComposeViewControllerDelegate, OutboundCommunication {
    
    //Calls makeACall which is an extension on string, this could be done in a better way with more time
    func makeCall(phoneNumber: String) {
        phoneNumber.makeACall()
    }
    
    
    /// Pulls up an email modal
    func makeEmail(emailAddress: String) {
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        composeVC.setToRecipients([emailAddress])
        composeVC.setSubject("Message Subject")
        composeVC.setMessageBody("Message content.", isHTML: false)
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    //Required for sending mail
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

