//
//  CharactersListViewAdapter.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import Foundation
import UIKit

// MARK: - Properties

class CharactersListViewAdapter: NSObject {
    
    // MARK: - Properties
    
    var delegate: CharactersListAdapterDelegate
//    var items: [HomeUIItem] = []
//
    init(delegate: CharactersListAdapterDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Extensions

extension CharactersListViewAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
//        switch items[section] {
//        case .data(let data):
//            return data.matches.count
//        case .noMatches:
//            return 1
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
//        cell.setItemInformation(itemInformation: data.matches[indexPath.row])
        return cell
//        switch items[indexPath.section] {
//        case .data(let data):
//            let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchCell
//            cell.setItemInformation(itemInformation: data.matches[indexPath.row])
//            return cell
//        case .noMatches:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "NoMatchesCell", for: indexPath) as! NoMatchesCell
//            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.showCharacterDetail()
//        switch items[indexPath.section] {
//        case .data(_):
//            delegate.showMatchDetail()
//            break
//        case .noMatches:
//            break
//        }
    }
}
