//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import Foundation
import UIKit

class CharacterCell: UITableViewCell {
    
    // MARK: - Outlets

    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: CharacterInformation) {
      
    }
}
