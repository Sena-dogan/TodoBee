//
//  ManageMoviesView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 13.09.2024.
//

import SwiftUI

struct ManageMoviesView: View {
    @StateObject private var viewModel = ManageMoviesViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Button("Add Movie (POST)") {
                Task {
                    await viewModel.addMovie()
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button("Delete Movie (DELETE)") {
                Task {
                    await viewModel.deleteMovie()
                }
            }
            .buttonStyle(.borderedProminent)
            
            if let responseMessage = viewModel.responseMessage {
                Text(responseMessage)
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .padding()
        .navigationTitle("Manage Movies")
    }
}

final class ManageMoviesViewModel: ObservableObject {
    @Published var responseMessage: String?

    func addMovie() async {
        do {
            let movie = Movie(
                id: 12345,
                title: "Sample Movie",
                posterPath: "/samplePoster.jpg",
                originalLanguage: "en",
                overview: "This is a sample movie description.",
                releaseDate: "2024-09-01",
                voteAverage: 7.5,
                voteCount: 500
            )
            
            // Try to convert movie to Data with 'try'
            let movieData = try movie.toData()

            let response: BasicResponse = try await NetworkManager.shared.request(from: "movie/add", method: .POST, body: movieData, as: BasicResponse.self)
            self.responseMessage = response.message
        } catch {
            self.responseMessage = "Failed to add movie: \(error)"
        }
    }

    func deleteMovie() async {
        do {
            let response: BasicResponse = try await NetworkManager.shared.request(from: "movie/delete/99999", method: .DELETE, as: BasicResponse.self)
            self.responseMessage = response.message
        } catch {
            self.responseMessage = "Failed to delete movie: \(error)"
        }
    }
}

struct BasicResponse: Decodable {
    let message: String
}

extension Encodable {
    func toData() -> Data? {
        try? JSONEncoder().encode(self)
    }
}
