//
//  TabBarController.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 02.12.21.
//

import UIKit
import Combine

class TabBarController: UITabBarController {

    private var viewModel = TabBarViewModel()
    private let assetViewController = AssetViewController()
    private let walletViewController = WalletViewController()

    private var subscriptions: Set<AnyCancellable> = []

    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel.parseData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupObservables()
    }
}

private extension TabBarController {

    func setupViews() {
        tabBar.barTintColor = .red
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.layer.masksToBounds = true
        let borderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1))
        borderView.backgroundColor = UIColor.gray
        tabBar.addSubview(borderView)

        let assetNavigationController = UINavigationController(rootViewController: assetViewController)
        assetViewController.tabBarItem = Tab.asset.tabBarItem

        let walletNavigationController = UINavigationController(rootViewController: walletViewController)
        walletViewController.tabBarItem = Tab.wallet.tabBarItem

        self.viewControllers = [assetNavigationController, walletNavigationController]
        self.selectedViewController = assetNavigationController
    }

    func setupConstraints() {

    }

    func setupObservables() {

        viewModel.assetsPublisher
            .sink { [weak self ] assets in
                guard let self = self else { return }
                self.assetViewController.viewModel = AssetViewModel(assets: assets)
            }
            .store(in: &subscriptions)
        
    }
}
