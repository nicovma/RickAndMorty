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
    
    @IBOutlet weak var previousPageButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    
    // MARK: - Properties
    
    private var adapter: CharactersListViewAdapter?
    private var viewModel: CharactersListViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: CharacterCell.self)
        tableView.register(cell: NoCharacterCell.self)
        tableView.separatorStyle = .none
        adapter = CharactersListViewAdapter(delegate: self)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        viewModel = CharactersListViewModel(delegate: self)
        pageLabel.text = viewModel?.pageText
        searchData()
    }
    
    // MARK: - Actions and selectors
    
    @IBAction func addPageButtonPressed(_ sender: Any) {
        viewModel?.addPage()
        searchData()
    }
    
    @IBAction func subtractPageButtonPressed(_ sender: Any) {
        viewModel?.subtractPage()
        searchData()
    }
    
    // MARK: - public methods
    
    func searchData() {
        showLoading()
        viewModel?.loadData()
    }
}

extension CharactersListViewController: CharactersListViewModelDelegate {
    
    func onSuccess(responseCase: CharactersListResponse) {
        pageLabel.text = viewModel?.pageText
        hideLoading()
        switch responseCase {
        case .loadData:
            if let viewModel = viewModel, let uiItems = viewModel.uiItems, let adapter = adapter {
                previousPageButton.isHidden = !viewModel.showPrev
                nextPageButton.isHidden = !viewModel.showNext
                adapter.items = uiItems
                tableView.reloadData()
            } else {
                showError(title: STRINGS.errorTitle, description: STRINGS.errorGenericDescription)
            }
        }
    }
    
    func onError(error: String) {
        hideLoading()
        showError(title: STRINGS.errorTitle, description: error)
    }
}

extension CharactersListViewController: CharactersListAdapterDelegate {
    
    func showCharacterDetail(index: Int) {
        performSegue(withIdentifier: "showCharacterDetail", sender: index)
    }
}

extension CharactersListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacterDetail" {
            if let charactersDetailViewController = segue.destination as? CharactersDetailViewController, let sender = sender as? Int{
                charactersDetailViewController.viewModel.rawResponse = viewModel?.rawResponse?.results[sender]
            } else {
                showError(title: STRINGS.errorTitle, description: STRINGS.errorGenericDescription)
            }
        }
    }
}
