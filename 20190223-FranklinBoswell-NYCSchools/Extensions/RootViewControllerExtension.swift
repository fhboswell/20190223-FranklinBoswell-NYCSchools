//
//  RootViewControllerExtension.swift
//  20190223-FranklinBoswell-NYCSchools
//
//  Created by Henry Boswell on 2/23/19.
//  Copyright © 2019 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit

extension RootViewController: UISearchResultsUpdating {
    
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
        
        highSchoolTableview.reloadData()
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}
