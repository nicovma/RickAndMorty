//
//  ErrorView.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import UIKit

class ErrorView: UIView {
    
    var delegate: ErrorViewDelegate? = nil
    
    @IBOutlet weak var errorTitleLabel: UILabel!
    @IBOutlet weak var errorDescriptionLabel: UILabel!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBAction func okPressed(_ sender: Any) {
        delegate?.okPressed()
    }
}
