//
//  DestinationCard.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

import SwiftUI

struct DestinationCard: View {
    let destination: Destination
    let isFavorite: Bool
    let onToggleFavorite: () -> Void
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: destination.poster)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                @unknown default:
                    EmptyView()
                }
            }
            .scaledToFill()
            .frame(width: 90, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack (alignment: .leading) {
                Text(destination.title)
                    .font(.headline)
                Text(destination.country)
                    .font(.subheadline)
            }
            .padding(.horizontal)
            Spacer()
            Button {
                onToggleFavorite()
                
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
            }
            
        }
    }
}
