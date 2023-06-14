//
//  CharacterImageCell.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 14/06/2023.
//

import Foundation
import UIKit

class CharacterImageCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var statusView: UIView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        statusView.layer.cornerRadius = 7
    }
}
