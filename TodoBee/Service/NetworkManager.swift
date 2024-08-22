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
    
    func fetch<T: Decodable>(from endpoint: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: "https://api.themoviedb.org/3/\(endpoint)?api_key=\(apiKey)&language=en-US&page=1") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
    
    func fetchPopularMovies() async throws -> [Movie] {
        let movieResponse: MovieResponse = try await fetch(from: "movie/popular", as: MovieResponse.self)
        return movieResponse.results
    }
    
    func fetchNowPlayingMovies() async throws -> [Movie] {
        let movieResponse: MovieResponse = try await fetch(from: "movie/now_playing", as: MovieResponse.self)
        return movieResponse.results
    }
    
    func fetchTopRatedMovies() async throws -> [Movie] {
        let movieResponse: MovieResponse = try await fetch(from: "movie/top_rated", as: MovieResponse.self)
        return movieResponse.results
    }
    
    func fetchUpComingMovies() async throws -> [Movie] {
        let movieResponse: MovieResponse = try await fetch(from: "movie/upcoming", as: MovieResponse.self)
        return movieResponse.results
    }
    
    
}

struct MovieResponse: Decodable {
    let results: [Movie]
}

