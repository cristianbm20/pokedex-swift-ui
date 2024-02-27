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
      VStack {
        Text(String(pokemonViewModel.pokemonDetails.first?.height ?? -1))
        Text(String(pokemonViewModel.pokemonDetails.first?.weight ?? -1))
        
        if let types = pokemonViewModel.pokemonDetails.first?.types {
          let typesNames = types.map { $0.type.name }.joined(separator: " ,")
          Text(typesNames)
        } else {
          Text("Unavailable types")
        }
        
        // TODO: Add Sprites and more information
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
