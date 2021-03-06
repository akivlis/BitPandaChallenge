//
//  AssetViewController.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 08.12.21.
//

import UIKit
import RxDataSources
import RxSwift

class AssetViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 50
        tableView.showsHorizontalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AssetTableViewCell.self)
        return tableView
    }()

    private let searchController = UISearchController()

    var viewModel: AssetViewModel? {
        didSet {
            tableView.reloadData()
        }
    }

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupObservables()
    }
}

// MARK: - Private

private extension AssetViewController {

    func setupViews() {
        view.backgroundColor = UIColor.systemBackground
        title = Tab.asset.title
        navigationController?.navigationBar.prefersLargeTitles = true

        searchController.searchBar.scopeButtonTitles = AssetType.allCases.map { $0.rawValue.capitalized }
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.isHidden = false
        navigationItem.searchController = searchController

        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    func setupObservables() {
        viewModel?.items$
            .drive(tableView.rx.items(cellIdentifier: AssetTableViewCell.reuseIdentifier, cellType: AssetTableViewCell.self)) { _, itemViewModel, cell in
                cell.bind(itemViewModel, isDarkMode: self.traitCollection.userInterfaceStyle == .dark)
            }
            .disposed(by: disposeBag)
    }
}

extension AssetViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if !searchController.isActive {
            viewModel?.filter(for: nil)
            return
        }
        let searchText = searchController.searchBar.text
    }


    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        viewModel?.filter(for: AssetType.allCases[selectedScope])
    }
}
