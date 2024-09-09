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
    
    func request<T: Decodable>(from endpoint: String, method: HTTPMethod = .GET, body: Data? = nil, as type: T.Type) async throws -> T {
        guard var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/\(endpoint)") else {
            throw URLError(.badURL)
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let body = body {
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
}
