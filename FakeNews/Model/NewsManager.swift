//
//  NewsManager.swift
//  FakeNews
//
//  Created by Marina Svistkova on 29.03.2021.
//

import Foundation

struct NewsManager {

    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

    func parse(jsonData: Data) -> [CellType] {
        var cellType = [CellType]()
        do {
            let decodedData = try JSONDecoder().decode(NewsData.self,
                                                       from: jsonData)
            let articles: [Article] = decodedData.articles
            let videos: [VideoNews] = decodedData.videoNews
            let interview: [Interview] = decodedData.interviews

            let articleCells: [CellType] = articles.map { article in
                let articleModel = ArticleModel.init(
                    id: article.id,
                    title: article.title,
                    shortDescription: article.shortDescription
                )
                return .article(articleModel)
            }
            let videoCells: [CellType] = videos.map { video in
                let videoModel = VideoModel.init(
                    id: video.id,
                    title: video.title,
                    duration: video.duration
                )
                return .video(videoModel)
            }
            let interviewCells: [CellType] = interview.map { interview in
                let interviewModel = AudioModel.init(
                    id: interview.id,
                    title: interview.title,
                    duration: interview.duration,
                    person: interview.person.fullName
                )
                return .audio(interviewModel)
            }
            
            cellType = articleCells + videoCells + interviewCells
        } catch {
            print("decode error:", error)
        }
        return cellType
    }
}
