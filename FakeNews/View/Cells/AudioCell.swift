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
        label.numberOfLines = 0
        return label
    }()

    private lazy var audioSubtitle: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(17)
        label.numberOfLines = 0
        return label
    }()

    private lazy var interviewDurationTitle: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        return label
    }()


    public func configure(withTitle title: String, withText text: String, withDuration duration: String) {
        setupViews()
        setupConstraints()
        audioTitle.text = title
        audioSubtitle.text = text
        interviewDurationTitle.text = "Интервью, " + duration + " мин."
    }

    private func setupViews() {
        addSubviews(audioTitle, audioSubtitle, interviewDurationTitle)
        backgroundColor = Palette.darkBlue.color
    }

    private func setupConstraints() {
        audioTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-30)
        }

        audioSubtitle.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalTo(audioTitle.snp.bottom).offset(10)
        }

        interviewDurationTitle.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().inset(10)
            make.top.equalTo(audioSubtitle.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
}
