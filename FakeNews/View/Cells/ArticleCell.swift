//
//  TableViewCell.swift
//  FakeNews
//
//  Created by Marina Svistkova on 29.03.2021.
//

import UIKit

final class ArticleCell: UITableViewCell {

    var article: ArticleModel?

    static let identifier = "ArticleCell"

    private lazy var articleTitle: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        return label
    }()

    private lazy var articleShortDescription: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.numberOfLines = 0
        return label
    }()


    public func configure(withTitle title: String, withText text: String) {
        setupViews()
        setupConstraints()
        articleTitle.text = title
        articleShortDescription.text = text
    }

    private func setupViews() {
        addSubviews(articleTitle, articleShortDescription)
        backgroundColor = Palette.lightBlue.color
    }

    private func setupConstraints() {
        articleTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-30)
        }

        articleShortDescription.snp.makeConstraints { (make) in
            make.leading.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(articleTitle.snp.bottom).offset(10)
        }
    }
}
