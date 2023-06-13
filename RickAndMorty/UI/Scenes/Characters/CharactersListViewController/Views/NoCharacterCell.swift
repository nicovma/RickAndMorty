//
//  NoCharacterCell.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 13/06/2023.
//

import Foundation
import UIKit

class NoCharacterCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var noCharacterLabel: UILabel!
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: CharacterUIItems) {
    }
}
