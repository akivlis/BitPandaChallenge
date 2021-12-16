//
//  TabBarController.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 02.12.21.
//

import UIKit

class TabBarController: UITabBarController {

    let viewModel = TabBarViewModel()

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

        let assetViewController = UINavigationController(rootViewController: AssetViewController())
        assetViewController.tabBarItem = Tab.asset.tabBarItem

        let walletViewController = UINavigationController(rootViewController: WalletViewController())
        walletViewController.tabBarItem = Tab.wallet.tabBarItem

        self.viewControllers = [assetViewController, walletViewController]
        self.selectedViewController = assetViewController
    }

    func setupConstraints() {

    }
}
