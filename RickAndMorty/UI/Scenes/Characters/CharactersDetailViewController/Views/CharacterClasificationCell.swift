//
//  CharacterClasificationCell.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 14/06/2023.
//

import Foundation
import UIKit

class CharacterClasificationCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.layer.cornerRadius = 8
    }
}
