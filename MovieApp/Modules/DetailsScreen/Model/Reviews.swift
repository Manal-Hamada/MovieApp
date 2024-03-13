//
//  Reviews.swift
//  MovieApp
//
//  Created by JETS Mobile Lab on 29/02/2024.
//

import Foundation

struct ReviewsResponse {
    let id, page: Int
    let results: [Review]
    let totalPages, totalResults: Int
}

struct Review {
    let author: String
    let authorDetails: AuthorDetails
    let content, createdAt, id, updatedAt: String
    let url: String
}

// MARK: - AuthorDetails
struct AuthorDetails {
    let name, username, avatarPath: String
    let rating: Double
}
