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
    
    // tableView
    @IBOutlet weak var tableView: UITableView!
    
    // labels
    @IBOutlet weak var titleLabel: UILabel!
    
    // textFields
    @IBOutlet weak var filterTextField: UITextField!
    
    // buttons
    @IBOutlet weak var previousPageButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var removeFilterButton: UIButton!
    
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
        setupView()
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
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        guard let viewModel = viewModel, let filteredText = filterTextField.text else {
            return
        }
        filterTextField.resignFirstResponder()
        viewModel.filterText = filteredText
        searchData()
    }
    
    @IBAction func removeFilterButtonPressed(_ sender: Any) {
        filterTextField.text = ""
        viewModel?.filterText = ""
        searchData()
    }
    
    @IBAction func filterValueChange(_ sender: Any) {
        guard let viewModel = viewModel, let textToFilter = filterTextField.text else {
            filterButton.isEnabled = false
            return
        }

        removeFilterButton.isHidden = false
        switch textToFilter {
        case "":
            if (viewModel.isFilteredResponse){
                removeFilterButton.isHidden = true
                filterButton.isEnabled = true
            } else {
                removeFilterButton.isHidden = true
                filterButton.isEnabled = false
            }
            break
        case viewModel.filterText:
            if (viewModel.isFilteredResponse){
                removeFilterButton.isHidden = false
                filterButton.isEnabled = false
            }
            break
        default:
            removeFilterButton.isHidden = true
            filterButton.isEnabled = true
            break
        }
    }
    
    // MARK: - public methods
    
    func searchData() {
        showLoading()
        viewModel?.loadData()
    }
    
    func setupView() {
        titleLabel.text = viewModel?.pageText
        filterButton.isEnabled = false
        removeFilterButton.isHidden = true
        filterTextField.placeholder = STRINGS.filterPlaceholder
    }
}

extension CharactersListViewController: CharactersListViewModelDelegate {
    
    func onSuccess(responseCase: CharactersListResponse) {
        hideLoading()
        switch responseCase {
        case .loadData:
            if let viewModel = viewModel, let uiItems = viewModel.uiItems, let adapter = adapter {
                titleLabel.text = viewModel.isFilteredResponse ? STRINGS.filtered : viewModel.pageText
                filterButton.isEnabled = false
                removeFilterButton.isHidden = viewModel.isFilteredResponse ? false : true
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
