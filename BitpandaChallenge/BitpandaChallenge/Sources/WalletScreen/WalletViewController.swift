//
//  WalletViewController.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 08.12.21.
//

import UIKit

class WalletViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()

    }

}

// MARK: - Private

private extension WalletViewController {

    func setupViews() {
        view.backgroundColor = .white
        title = Tab.wallet.title

        navigationController?.navigationBar.barTintColor = UIColor.green
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupConstraints() {

    }
}

