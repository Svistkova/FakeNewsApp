//
//  TableDataSource.swift
//  FakeNews
//
//  Created by Marina Svistkova on 01.04.2021.
//

import UIKit

class GeneralTableViewDataSource: NSObject, UITableViewDataSource {

    var cells: [CellType] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        let type = cells[indexPath.row]

        switch type {

        case .article(let article):
            let articleCell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
            articleCell.article = article
            articleCell.accessoryType = .disclosureIndicator
            articleCell.configure(withTitle: article.title, withText: article.shortDescription)
            cell = articleCell

        case .video(let video):
            let videoCell = tableView.dequeueReusableCell(withIdentifier: VideoCell.identifier, for: indexPath) as! VideoCell
            videoCell.video = video
            videoCell.accessoryType = .disclosureIndicator
            videoCell.configure(withTitle: video.title)
            cell = videoCell

        case .audio(let audio):
            let audioCell = tableView.dequeueReusableCell(withIdentifier: AudioCell.identifier, for: indexPath) as! AudioCell
            audioCell.accessoryType = .disclosureIndicator
            audioCell.audio = audio
            audioCell.configure(withTitle: audio.title, withText: audio.person, withDuration: audio.duration)
            cell = audioCell
        }
        return cell
    }
    
}
