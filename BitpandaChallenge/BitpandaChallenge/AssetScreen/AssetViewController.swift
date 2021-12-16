//
//  AssetViewController.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 08.12.21.
//

import UIKit

class AssetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
}

// MARK: - Private

private extension AssetViewController {

    func setupViews() {
        view.backgroundColor = .white
        title = Tab.asset.title

        navigationController?.navigationBar.barTintColor = UIColor.green
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupConstraints() {

    }
}

