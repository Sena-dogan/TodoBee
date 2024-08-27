//
//  NetworkManager.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 20.08.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let apiKey = "54bff5bee509b27e4eb82ef042d64876"
    
    private func fetch<T: Decodable>(from endpoint: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: "https://api.themoviedb.org/3/\(endpoint)?api_key=\(apiKey)&language=en-US&page=1") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
    
    func fetchMovies(for category: MovieCategory) async throws -> [Movie] {
        let movieResponse: MovieResponse = try await fetch(from: "movie/\(category.rawValue)", as: MovieResponse.self)
        return movieResponse.results
    }
    
    func fetchTVSeries(for category: TVSeriesCategory) async throws -> [TVSeries] {
        let tvResponse: TVResponse = try await fetch(from: "tv/\(category.rawValue)", as: TVResponse.self)
        return tvResponse.results
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct TVResponse: Decodable {
    let results: [TVSeries]
}

