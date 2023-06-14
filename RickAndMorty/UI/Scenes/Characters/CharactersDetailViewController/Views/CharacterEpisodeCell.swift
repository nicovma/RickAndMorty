//
//  CharacterEpisodeCell.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 14/06/2023.
//

import Foundation
import UIKit

class CharacterEpisodeCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
    }
}
