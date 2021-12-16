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
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
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

    func bind(_ viewModel: AssetTableViewCellViewModel) {
        titleLabel.text = viewModel.title
    }

}

private extension AssetTableViewCell {

    func setupViews() {
        contentView.addSubview(containerStackView)

        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(iconView)
    }

    func setupConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
                .inset(4)
        }
    }
}
