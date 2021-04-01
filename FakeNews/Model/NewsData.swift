//
//  NewsData.swift
//  FakeNews
//
//  Created by Marina Svistkova on 29.03.2021.
//

import Foundation

struct NewsData: Codable {
    let articles: [Article]
    let videoNews: [VideoNews]
    let interviews: [Interview]

    enum CodingKeys: String, CodingKey {
        case articles
        case videoNews = "video_news"
        case interviews
    }
}

struct Article: Codable {
    let id: Int
    let title: String
    let shortDescription: String
    let date: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case shortDescription = "short_description"
        case date
    }
}

struct VideoNews: Codable {
    let id: Int
    let title: String
    let duration: String
    let url: String
    let topic: String
}

struct Interview: Codable {
    let id: Int
    let title: String
    let duration: String
    let url: String
    let person: Person
}

struct Person: Codable {
    let fullName: String
    let dOB: String
    let about: String

    enum CodingKeys: String, CodingKey {
        case fullName = "fio"
        case dOB = "date_of_birth"
        case about
    }
}
