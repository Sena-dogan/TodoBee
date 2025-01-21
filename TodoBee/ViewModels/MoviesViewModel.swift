//
//  MoviesViewModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 20.08.2024.
//

import Foundation

@MainActor
final class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func loadMovies(for category: MovieCategory) async {
        do {
            let movieResponse: MovieResponse = try await NetworkManager.shared.request(from: "movie/\(category.rawValue)", as: MovieResponse.self)
            self.movies = movieResponse.results
        } catch {
            print("Failed to load movies: \(error)")
        }
    }

    func addMovie(movieData: Data) async {
        do {
            try await NetworkManager.shared.postRequest(to: "movie", body: movieData)
            print("Movie added successfully")
        } catch {
            print("Failed to add movie: \(error)")
        }
    }
    
    func deleteMovie(movieId: Int) async {
        do {
            try await NetworkManager.shared.deleteRequest(from: "movie/\(movieId)")
            print("Movie deleted successfully")
        } catch {
            print("Failed to delete movie: \(error)")
        }
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}
