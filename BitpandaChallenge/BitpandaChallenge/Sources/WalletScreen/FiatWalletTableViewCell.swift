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
        view.backgroundColor = .systemBlue
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.contentMode = .left
        return label
    }()

    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .systemCyan
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

    private let balanceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    private let roundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray.withAlphaComponent(0.1)
        view.layer.cornerRadius = 10
        return view
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
        titleLabel.text = viewModel.title
        balanceLabel.text = viewModel.balance
        symbolLabel.text = viewModel.symbol
        //        iconView.image =
    }


}

// MARK: - Private

private extension FiatWalletTableViewCell {

    func setupViews() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(roundView)
        roundView.addSubview(containerStackView)

        containerStackView.addArrangedSubview(iconView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(balanceStackView)

        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(symbolLabel)
    }

    func setupConstraints() {
        roundView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
                .inset(12)
            make.top.bottom.equalToSuperview()
                .inset(8)
        }

        containerStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
                .inset(10)
            make.top.bottom.equalToSuperview()
                .inset(20)
        }

        iconView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(iconView.snp.height)
        }
    }
}

