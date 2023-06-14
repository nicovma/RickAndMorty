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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var separatorLabel: UILabel!
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var statusView: UIView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        statusView.layer.cornerRadius = 5
        characterImageView.layer.cornerRadius = 8
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: CharacterUIItems) {
        characterImageView.loadAvatar(url: URL.init(string: itemInformation.image)!, placeholder: "person.fill")
        
        nameLabel.text = itemInformation.name
        typeLabel.text = itemInformation.type
        specieLabel.text = itemInformation.species
        statusLabel.text = itemInformation.status.rawValue
        separatorLabel.isHidden = itemInformation.type == ""
        
        switch itemInformation.status {
        case .dead:
            statusView.backgroundColor = UIColor.red
            break
        case .alive:
            statusView.backgroundColor = UIColor.green
            break
        case .unknown:
            statusView.backgroundColor = UIColor.gray
            break
        }
        
    }
}
