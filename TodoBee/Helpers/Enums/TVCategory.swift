//
//  TVCategory.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 23.08.2024.
//

import Foundation

enum TVSeriesCategory: String, CaseIterable {
    case popular
    case topRated = "top_rated"
    case airingToday = "airing_today"
    case onTheAir = "on_the_air"
    
    func displayName() -> String {
        switch self {
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .airingToday:
            return "Airing Today"
        case .onTheAir:
            return "On The Air"
        }
    }
}
