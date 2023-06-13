//
//  CharactersListViewController.swift
//  RickAndMorty
//
//  Created by Nico Valentini Mac Adden on 12/06/2023.
//

import Foundation
import UIKit

class CharactersListViewController: BaseViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageLabel: UILabel!
    
    // MARK: - Properties
    
    private var adapter: CharactersListViewAdapter?
//    private var viewModel: HomeViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: CharacterCell.self)
//        tableView.register(cell: NoMatchesCell.self)
        tableView.separatorStyle = .none
        adapter = CharactersListViewAdapter(delegate: self)
        tableView.dataSource = adapter
        tableView.delegate = adapter
//        viewModel = HomeViewModel(delegate: self)
//        dateLabel.text = viewModel?.dateText
//        searchData()
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func addPageButtonPressed(_ sender: Any) {
        showLoading()
//        viewModel?.addDay(quantity: 1)
//        searchData()
    }
    @IBAction func subtractPageButtonPressed(_ sender: Any) {
        showError(title: "Error", description: "This is an error description")
//        viewModel?.subtractDay(quantity: 1)
//        searchData()
    }
    
    // MARK: - public methods
    
    func searchData() {
//        showLoading()
//        viewModel?.loadData()
    }

}

extension CharactersListViewController: CharactersListViewModelDelegate {
    
    func onSuccess(responseCase: CharactersListResponse) {
//        dateLabel.text = viewModel?.dateText
//        hideLoading()
//        switch responseCase {
//        case .loadData:
//            if let viewModel = viewModel, let uiItems = viewModel.uiItems, let adapter = adapter {
//                adapter.items = uiItems
//                tableView.reloadData()
//            } else {
//                showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
//            }
//        }
    }
    
    func onError(error: String) {
        hideLoading()
//        dateLabel.text = viewModel?.dateText
//        adapter?.items = []
//        tableView.reloadData()
        showError(title: NSLocalizedString("Error.title", comment: ""), description: error)
    }
}

extension CharactersListViewController: CharactersListAdapterDelegate {
    
    func showCharacterDetail() {
        performSegue(withIdentifier: "showCharacterDetail", sender: self)
    }
    
    
}

extension CharactersListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showCharacterDetail" {
//            if let charactersDetailViewController = segue.destination as? CharactersDetailViewController, let sender = sender as? String{
//                leagueDetailViewController.viewModel.leagueCode = sender
//            } else {
//                showError(title: NSLocalizedString("Error.title", comment: ""), description: NSLocalizedString("Error.genericDescription", comment: ""))
//            }
//        }
    }
}
