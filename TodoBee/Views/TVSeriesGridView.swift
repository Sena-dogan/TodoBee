//
//  TVSeriesGridView.swift
//  TodoBee
//
//  Created by Zeynep Sena Doğan on 27.08.2024.
//

import SwiftUI

struct TVSeriesGridView: View {
    @StateObject private var viewModel = TVSeriesViewModel()
    @State private var selectedCategory: TVSeriesCategory = .popular
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Picker("Select Category", selection: $selectedCategory) {
                ForEach(TVSeriesCategory.allCases, id: \.self) { category in
                    Text(category.displayName()).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.tvSeries) { series in
                        NavigationLink(destination: TVSeriesDetailView(tvSeries: series)) {
                            VStack {
                                AsyncImage(url: series.posterURL) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 225)
                                        .cornerRadius(10)
                                } placeholder: {
                                    ProgressView()
                                }
                                Text(series.title)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 5)
                            }
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                Task {
                    await viewModel.loadTVSeries(for: selectedCategory)
                }
            }
            .onChange(of: selectedCategory) { newCategory in
                Task {
                    await viewModel.loadTVSeries(for: newCategory)
                }
            }
        }
        .navigationTitle("TV Series")
    }
}
