//
//  VideoViewController.swift
//  FakeNews
//
//  Created by Marina Svistkova on 30.03.2021.
//

import UIKit

final class VideoViewController: UIViewController {

    let newsTitle: String? = nil

    private lazy var videoTitle: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.textAlignment = .center
        title.font = title.font.withSize(30)
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle(LocalizableKey.SingleNewsScreen.dismissButton.localized(), for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    public func configure(withTitle title: String) {
        videoTitle.text = title
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSubviews()
        setupConstraints()
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }

    @objc private func dismissButtonTapped(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }

    private func setupSubviews() {
        view.addSubviews(videoTitle, dismissButton)
    }

    private func setupUI() {
        view.backgroundColor = .white
    }

    private func setupConstraints() {

        videoTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        dismissButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
        }
    }
}
