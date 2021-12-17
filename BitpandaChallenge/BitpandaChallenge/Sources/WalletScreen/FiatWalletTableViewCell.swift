//
//  FiatWalletTableViewCell.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import UIKit

class FiatWalletTableViewCell: UITableViewCell {

    // MARK: - Views

    private let iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.contentMode = .left
        return label
    }()

    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.contentMode = .right
        return label
    }()

    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.contentMode = .left
        return label
    }()

    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()




    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.layer.cornerRadius  = iconView.frame.width * 0.5
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
    }

    // MARK: - Public

    func bind(_ viewModel: FiatWalletTableViewCellViewModel) {
        titleLabel.text = viewModel.fiatWallet.name
        balanceLabel.text = viewModel.fiatWallet.balance
        symbolLabel.text = viewModel.fiatWallet.fiatSymbol
        //        iconView.image =
    }


}

// MARK: - Private

private extension FiatWalletTableViewCell {

    func setupViews() {
        contentView.backgroundColor = .systemGray

        contentView.addSubview(containerStackView)

        containerStackView.addArrangedSubview(iconView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(symbolLabel)
        containerStackView.addArrangedSubview(balanceLabel)
    }

    func setupConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
                .inset(20)
            make.top.bottom.equalToSuperview()
                .inset(20)
        }

        iconView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(iconView.snp.height)
        }
    }
}

