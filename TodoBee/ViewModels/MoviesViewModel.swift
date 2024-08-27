//
//  MoviesViewModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 20.08.2024.
//

import Foundation

@MainActor
class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func loadMovies(for category: MovieCategory) async {
        do {
            self.movies = try await NetworkManager.shared.fetchMovies(for: category)
        } catch {
            print("Failed to load movies: \(error)")
        }
    }
}
