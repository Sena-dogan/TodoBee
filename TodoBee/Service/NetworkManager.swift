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
    
    func fetchMovies() async throws -> [Movie] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        return movieResponse.results
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}
