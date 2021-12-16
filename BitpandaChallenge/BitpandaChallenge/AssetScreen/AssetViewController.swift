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
//        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.estimatedRowHeight = 50
        tableView.showsHorizontalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AssetTableViewCell.self)
        return tableView
    }()

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
        view.backgroundColor = .white
        title = Tab.asset.title

        navigationController?.navigationBar.prefersLargeTitles = true

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
                cell.bind(itemViewModel)
            }
            .disposed(by: disposeBag)
    }
}

