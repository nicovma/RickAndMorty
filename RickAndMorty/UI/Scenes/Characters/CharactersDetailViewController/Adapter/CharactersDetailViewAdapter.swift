//
//  CharactersDetailViewAdapter.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 14/06/2023.
//

import Foundation
import UIKit

// MARK: - Properties

class CharactersDetailViewAdapter: NSObject {
    
    // MARK: - Properties
    
    var items: [CharacterDetailUIItem] = []
}

// MARK: - Extensions

extension CharactersDetailViewAdapter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row] {
        case .basicInfo(let characterClasificationInfo):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterClasificationCell", for: indexPath) as! CharacterClasificationCell
            cell.setItemInformation(itemInformation: characterClasificationInfo)
            return cell
        case .image(let characterBasicInfo):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterImageCell", for: indexPath) as! CharacterImageCell
            cell.setItemInformation(itemInformation: characterBasicInfo)
            return cell
        case .episode(let episodeNumber):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterEpisodeCell", for: indexPath) as! CharacterEpisodeCell
            cell.setItemInformation(itemInformation: episodeNumber)
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
