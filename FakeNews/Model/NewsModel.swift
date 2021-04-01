//
//  NewsModel.swift
//  FakeNews
//
//  Created by Marina Svistkova on 30.03.2021.
//

import Foundation


enum CellType {
    case article(ArticleModel)
    case video(VideoModel)
    case audio(AudioModel)
}

struct ArticleModel {
    let id: Int
    let title: String
    let shortDescription: String
}

struct VideoModel {
    let id: Int
    let title: String
    let duration: String
}

struct AudioModel {
    let id: Int
    let title: String
    let duration: String
    let person: String
}
