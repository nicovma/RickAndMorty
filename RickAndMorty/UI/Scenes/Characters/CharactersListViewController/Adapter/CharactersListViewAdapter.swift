//
//  CharactersListViewAdapter.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import Foundation
import UIKit

class CharactersListViewAdapter: NSObject {
    
    // MARK: - Properties
    
    var delegate: CharactersListAdapterDelegate
    var items: [CharactersListUIItem] = []
    
    init(delegate: CharactersListAdapterDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Extensions

extension CharactersListViewAdapter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row] {
        case .data(let data):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
            cell.setItemInformation(itemInformation: data)
            return cell
        case .noCharacter:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoCharacterCell", for: indexPath) as! NoCharacterCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch items[indexPath.section] {
            case .data(_):
                delegate.showCharacterDetail(index: indexPath.row)
                break
            case .noCharacter:
                break
        }
    }
}
