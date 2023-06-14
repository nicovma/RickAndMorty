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
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.layer.cornerRadius = 8
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: CharacterClasificationInfo) {
        titleLabel.text = itemInformation.name
        valueLabel.text = itemInformation.value
    }
}
