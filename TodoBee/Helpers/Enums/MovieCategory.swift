//
//  MovieCategory.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 23.08.2024.
//

import Foundation

enum MovieCategory: String, CaseIterable {
    case popular
    case topRated = "top_rated"
    case upcoming
    case nowPlaying = "now_playing"
    
    var name: String {
        switch self {
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .upcoming:
            return "Upcoming"
        case .nowPlaying:
            return "Now Playing"
        }
    }
}
