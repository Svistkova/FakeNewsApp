//
//  GeneralViewController.swift
//  FakeNews
//
//  Created by Marina Svistkova on 29.03.2021.
//

import UIKit
import SnapKit

final class GeneralViewController: UIViewController {

    private var newsManager = NewsManager()
    private var cells: [CellType] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var dataSource = GeneralTableViewDataSource()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.identifier)
        table.register(VideoCell.self, forCellReuseIdentifier: VideoCell.identifier)
        table.register(AudioCell.self, forCellReuseIdentifier: AudioCell.identifier)
        table.backgroundColor = Palette.gray.color
        table.delegate = self
        return table
    }()

    private lazy var generalTitle: UILabel = {
        let label = UILabel()
        label.text = LocalizableKey.General.generalTitle.localized()
        label.font = label.font.withSize(30)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        if let localData = newsManager.readLocalFile(forName: "data") {
            cells = newsManager.parse(jsonData: localData)
        }
        dataSource.cells = cells
        tableView.dataSource = dataSource
    }

    private func configure() {
        setupSubviews()
        setupUI()
        setupConstraints()
    }

    private func setupUI() {
        view.backgroundColor = Palette.gray.color
    }

    private func setupSubviews() {
        view.addSubviews(tableView, generalTitle)
    }

    private func setupConstraints() {

        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(generalTitle.snp.bottom).offset(20)
        }

        generalTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}


extension GeneralViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let type = cells[indexPath.row]
        switch type {
        case .article(let article):
            let articleVC = ArticleViewController()
            articleVC.configure(withTitle: article.title)
            articleVC.modalPresentationStyle = .fullScreen
            self.present(articleVC, animated: true, completion: nil)
        case .video(let video):
            let videoVC = VideoViewController()
            videoVC.configure(withTitle: video.title)
            videoVC.modalPresentationStyle = .fullScreen
            self.present(videoVC, animated: true, completion: nil)
        case .audio(let audio):
            let audioVC = AudioViewController()
            audioVC.configure(withTitle: audio.title)
            audioVC.modalPresentationStyle = .fullScreen
            self.present(audioVC, animated: true, completion: nil)
        }
    }
}
