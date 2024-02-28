//
//  PokemonDetailsView.swift
//  PokedexProject
//
//  Created by Cristian Bermudez Martinez on 26/2/24.
//

import SwiftUI

struct PokemonDetailsView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject var pokemonViewModel: Pokemon = Pokemon()
  @Binding var url: String
  
  var body: some View {
    ScrollView {
      VStack(spacing: 8) {
        Text(pokemonViewModel.pokemonDetails.first?.name.capitalized ?? "Unavailable name")
          .font(.system(.largeTitle, design: .rounded, weight: .bold))
          .padding(.top)
        
        if let urlSprite = pokemonViewModel.pokemonDetails.first?.sprites.other.officialArtwork.frontDefault, let url = URL(string: urlSprite) {
          AsyncImage(url: url) { image in
            image.resizable()
          } placeholder: {
            ProgressView()
          }
          .frame(width: 250, height: 250)
            
        } else {
          Text("Unavailable sprite image")
        }
        
        Text("**Height:** \(pokemonViewModel.pokemonDetails.first?.height ?? -1)")
        Text("**Weight:** \(pokemonViewModel.pokemonDetails.first?.weight ?? -1)")
        
        if let types = pokemonViewModel.pokemonDetails.first?.types {
          let typesNames = types.map { $0.type.name }.joined(separator: " ,")
          Text("**Types:** \(typesNames)")
        } else {
          Text("Unavailable types")
        }
      }
    }
    .onAppear {
      pokemonViewModel.getPokemonDetails(urlStr: url)
    }
  }
}

//#Preview {
//  PokemonDetailsView()
//}
