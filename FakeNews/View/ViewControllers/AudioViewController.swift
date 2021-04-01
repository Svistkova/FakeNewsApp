//
//  AudioViewController.swift
//  FakeNews
//
//  Created by Marina Svistkova on 30.03.2021.
//

import UIKit

final class AudioViewController: UIViewController {

    private lazy var audioTitle: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.textAlignment = .center
        title.font = title.font.withSize(30)
        return title

    }()

    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle(LocalizableKey.SingleNewsScreen.dismissButton.localized(), for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    func configure(withTitle title: String) {
        audioTitle.text = title
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.addSubviews(audioTitle, dismissButton)
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        setupConstraints()
    }


    @objc private func dismissButtonTapped(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }

    private func setupViews() {
        view.backgroundColor = .white
    }

    private func setupConstraints() {

        audioTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        dismissButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
        }
    }
}
