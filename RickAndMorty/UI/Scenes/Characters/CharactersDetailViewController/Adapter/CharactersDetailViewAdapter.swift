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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterImageCell", for: indexPath) as! CharacterImageCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
