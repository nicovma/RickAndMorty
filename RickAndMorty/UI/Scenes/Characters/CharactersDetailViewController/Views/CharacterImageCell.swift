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
        mainImageView.layer.cornerRadius = 8
    }
    
    // MARK: - Public Methods
    
    func setItemInformation(itemInformation: CharacterBasicInfo) {
        mainImageView.loadAvatar(url: URL.init(string: itemInformation.image)!, placeholder: "person.fill")
        
        nameLabel.text = itemInformation.name
        statusLabel.text = itemInformation.status.rawValue
        
        // TODO: Date Format
        creationDateLabel.text = STRINGS.createdOn + itemInformation.date
        
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
