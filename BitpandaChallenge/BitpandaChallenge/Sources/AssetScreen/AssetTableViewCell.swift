//
//  AssetTableViewCell.swift
//  BitpandaChallenge
//
//  Created by Silvia Kuzmova on 16.12.21.
//

import UIKit
import SnapKit
import Kingfisher
import SVGKit

class AssetTableViewCell: UITableViewCell {

    private let iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
//        view.backgroundColor = .gray
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
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

    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.layer.cornerRadius  = iconView.frame.width * 0.5
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
    }

    // MARK: - Public

    func bind(_ viewModel: AssetTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.averagePrice

        iconView.kf.setImage(with: viewModel.iconURL, options: [.processor(SVGImgProcessor())])
    }
}

// MARK: - Private

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
                .inset(20)
            make.top.bottom.equalToSuperview()
                .inset(12)
        }

        iconView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(iconView.snp.height)
        }
    }
}

public struct SVGImgProcessor:ImageProcessor {
    public var identifier: String = "com.appidentifier.webpprocessor"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
