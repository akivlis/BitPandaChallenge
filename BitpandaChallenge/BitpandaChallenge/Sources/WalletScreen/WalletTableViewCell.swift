//
//  WalletTableViewCell.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import UIKit

class WalletTableViewCell: UITableViewCell {

    // MARK: - Views

    private let iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.contentMode = .left
        return label
    }()

    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
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

    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    private let roundView: UIView = {
        let view = UIView()
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

    func bind(_ viewModel: WalletTableViewCellViewModel, isDarkMode: Bool) {
        roundView.backgroundColor = viewModel.backgroundColor
        titleLabel.text = viewModel.title
        balanceLabel.text = viewModel.balance
        symbolLabel.text = viewModel.symbol

        let url = isDarkMode ? viewModel.icons?.darkIcon : viewModel.icons?.lightIcon
        iconView.kf.setImage(with: url, options: [.processor(SVGImgProcessor())])
    }

}

// MARK: - Private

private extension WalletTableViewCell {

    func setupViews() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(roundView)
        roundView.addSubview(containerStackView)

        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(iconView)

        containerStackView.addArrangedSubview(verticalStackView)
        containerStackView.addArrangedSubview(balanceLabel)
        containerStackView.addArrangedSubview(symbolLabel)
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
                .inset(10)
        }

        iconView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(iconView.snp.height)
        }
    }
}
