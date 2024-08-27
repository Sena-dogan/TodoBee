//
//  TVSeriesViewModel.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 23.08.2024.
//

import Foundation

@MainActor
class TVSeriesViewModel: ObservableObject {
    @Published var tvSeries: [TVSeries] = []
    
    func loadTVSeries(for category: TVSeriesCategory) async {
        do {
            self.tvSeries = try await NetworkManager.shared.fetchTVSeries(for: category)
        } catch {
            print("Failed to load TV series: \(error)")
        }
    }
}
