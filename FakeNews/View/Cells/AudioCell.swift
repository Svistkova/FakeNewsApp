//
//  AudioCell.swift
//  FakeNews
//
//  Created by Marina Svistkova on 30.03.2021.
//

import UIKit

final class AudioCell: UITableViewCell {

    var audio: AudioModel?
    
    static let identifier = "AudioCell"

    private lazy var audioTitle: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        return label
    }()

    private lazy var audioSubtitle: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        return label
    }()

    public func configure(withTitle title: String, withText text: String) {
        setupViews()
        audioTitle.text = title
        audioSubtitle.text = text
        setupConstraints()
    }

    private func setupViews() {
        addSubviews(audioTitle, audioSubtitle)
        backgroundColor = Palette.darkBlue.color
    }

    private func setupConstraints() {
        audioTitle.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }

        audioSubtitle.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview().inset(10)
            make.top.equalTo(audioTitle.snp.bottom).offset(5)
//            make.height.equalTo(30)
        }
    }
}
