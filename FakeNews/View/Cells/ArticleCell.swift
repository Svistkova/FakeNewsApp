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
        return label
    }()

    private lazy var articleShortDescription: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        return label
    }()


    public func configure(withTitle title: String, withText text: String) {
        setupViews()
        articleTitle.text = title
        articleShortDescription.text = text
        setupConstraints()
    }

    private func setupViews() {
        addSubviews(articleTitle, articleShortDescription)
        backgroundColor = Palette.lightBlue.color
    }

    private func setupConstraints() {
        articleTitle.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
//            make.height.equalTo(30)
        }

        articleShortDescription.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.bottom.equalToSuperview().offset(-10)
            make.top.equalTo(articleTitle.snp.bottom).offset(5)
//            make.height.equalTo(30)
        }
    }
}
