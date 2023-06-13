//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import UIKit

class LoadingView: UIView {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    func setupTitle(title: String?) {
        indicator.color = UIColor(named: "AccentColor")
        if let title = title {
            loadingLabel.text =  title
        } else {
//            loadingLabel.text = NSLocalizedString("LoadingView.loading", comment: "")
        }
    }
}

