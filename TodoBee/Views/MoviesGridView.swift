//
//  MoviesGridView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 20.08.2024.
//

import SwiftUI

struct MoviesGridView: View {
    @StateObject private var viewModel = MoviesViewModel()
    @State private var selectedCategory: MovieCategory = .popular
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Picker("Select Category", selection: $selectedCategory) {
                ForEach(MovieCategory.allCases, id: \.self) { category in
                    Text(category.name).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            VStack {
                                AsyncImage(url: movie.posterURL) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 225)
                                        .cornerRadius(10)
                                } placeholder: {
                                    ProgressView()
                                }
                                Text(movie.title)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 5)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("\(selectedCategory.name.capitalized) Movies")
            .onAppear {
                Task {
                    await viewModel.loadMovies(for: selectedCategory)
                }
            }
            .onChange(of: selectedCategory) { newCategory in
                Task {
                    await viewModel.loadMovies(for: newCategory)
                }
            }
        }
    }
}
