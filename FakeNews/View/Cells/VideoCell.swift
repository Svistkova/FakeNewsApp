//
//  VideoCell.swift
//  FakeNews
//
//  Created by Marina Svistkova on 30.03.2021.
//

import UIKit

final class VideoCell: UITableViewCell {

    var video: VideoModel?

    static let identifier = "VideoCell"

    private lazy var videoTitle: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        return label
    }()

    private lazy var fakeVideoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()


    public func configure(withTitle title: String) {
        setupViews()
        videoTitle.text = title
        fakeVideoView.image = ImageKey.Cells.videoCellImage.image
        setupConstraints()
    }

    func setupViews() {
        contentView.addSubviews(videoTitle, fakeVideoView)
        backgroundColor = Palette.blue.color
    }

    private func setupConstraints() {
        videoTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-30)
        }

        fakeVideoView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview().inset(10)
            make.top.equalTo(videoTitle.snp.bottom).offset(10)
            make.height.equalTo(200)
        }
    }
}
