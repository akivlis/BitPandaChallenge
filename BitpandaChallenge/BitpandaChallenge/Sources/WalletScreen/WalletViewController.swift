//
//  WalletViewController.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 08.12.21.
//

import UIKit
import RxDataSources
import RxSwift

class WalletViewController: UIViewController {

    // MARK: - Views

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.alwaysBounceVertical = false
        tableView.register(WalletTableViewCell.self)
        tableView.register(FiatWalletTableViewCell.self)
        return tableView
    }()

    // MARK: - Helper

    private lazy var dataSource = RxTableViewSectionedReloadDataSource<WalletSectionModel>(configureCell: { _, _, indexPath, item in
        switch item {
        case let .wallet(cellViewModel):
            return self.makeWalletCell(with: cellViewModel, at: indexPath)
        case let .fiatWallet(cellViewModel):
            return self.makeFiatWalletCell(with: cellViewModel, at: indexPath)
        }
    })

    // MARK: - Properties

    let viewModel = WalletViewModel()

    private let disposeBag = DisposeBag()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupObservables()
    }
}

// MARK: - Private

private extension WalletViewController {

    func setupViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.systemBackground
        title = Tab.wallet.title

        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    func setupObservables() {
        viewModel.items$
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)

    }

    func makeWalletCell(with cellViewModel: WalletTableViewCellViewModel, at indexPath: IndexPath) -> UITableViewCell {
        let cell: WalletTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.bind(cellViewModel)
        return cell
    }

    func makeFiatWalletCell(with cellViewModel: FiatWalletTableViewCellViewModel, at indexPath: IndexPath) -> UITableViewCell {
        let cell: FiatWalletTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.bind(cellViewModel)
        return cell
    }



}

// MARK: - UITableViewDelegate

extension WalletViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel = dataSource.sectionModels[section]
        let headerTitleView = UILabel()
        headerTitleView.text = sectionModel.title
        return headerTitleView
    }
}

