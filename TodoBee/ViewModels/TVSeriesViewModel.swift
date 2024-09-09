//
//  TVSeriesViewModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 23.08.2024.
//

import Foundation

@MainActor
final class TVSeriesViewModel: ObservableObject {
    @Published var tvSeries: [TVSeries] = []
    
    func loadTVSeries(for category: TVSeriesCategory) async {
        do {
            let tvResponse: TVResponse = try await NetworkManager.shared.request(from: "tv/\(category.rawValue)", as: TVResponse.self)
            self.tvSeries = tvResponse.results
        } catch {
            print("Failed to load TV series: \(error)")
        }
    }
}

struct TVResponse: Decodable {
    let results: [TVSeries]
}
