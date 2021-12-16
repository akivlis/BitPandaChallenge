//
//  AssetTableViewCell.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import UIKit
import SnapKit

class AssetTableViewCell: UITableViewCell {

    private let iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .gray
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.contentMode = .left
        return label
    }()

    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.contentMode = .left
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.contentMode = .right
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

    private let nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()

    // MARK: - Properties


    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.layer.cornerRadius  = iconView.frame.width * 0.5
    }

    func bind(_ viewModel: AssetTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.averagePrice
    }
}

private extension AssetTableViewCell {

    func setupViews() {
        contentView.addSubview(containerStackView)

        containerStackView.addArrangedSubview(iconView)
        containerStackView.addArrangedSubview(nameStackView)
        containerStackView.addArrangedSubview(priceLabel)

        nameStackView.addArrangedSubview(titleLabel)
        nameStackView.addArrangedSubview(symbolLabel)
    }

    func setupConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
                .inset(10)
            make.top.bottom.equalToSuperview()
                .inset(8)
        }

        iconView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(iconView.snp.height)
        }
    }
}
