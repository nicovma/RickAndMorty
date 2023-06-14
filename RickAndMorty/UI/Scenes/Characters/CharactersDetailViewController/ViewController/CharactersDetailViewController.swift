//
//  CharactersDetailViewController.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import Foundation
import UIKit

class CharactersDetailViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var adapter: CharactersDetailViewAdapter = CharactersDetailViewAdapter()
    var viewModel: CharactersDetailViewModel = CharactersDetailViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(cell: NoCharacterCell.self)
        tableView.separatorStyle = .none
        tableView.dataSource = adapter
        tableView.delegate = adapter
        setupView()
        
    }
    
    // MARK: - Actions and selectors
    
    
    // MARK: - public methods
    
    func setupView() {
        if let uiItems = viewModel.uiItems {
            adapter.items = uiItems
            tableView.reloadData()
        } else {
            showError(title: STRINGS.errorTitle, description: STRINGS.errorGenericDescription)
        }
    }

}
