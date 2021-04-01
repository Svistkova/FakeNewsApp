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
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }

        fakeVideoView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview().inset(10)
            make.top.equalTo(videoTitle.snp.bottom).offset(5)
            make.height.equalTo(200)
        }
    }
}
