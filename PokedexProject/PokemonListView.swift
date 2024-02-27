//
//  PokemonListView.swift
//  PokedexProject
//
//  Created by Cristian Bermudez Martinez on 27/2/24.
//

import SwiftUI

struct PokemonListView: View {
  @EnvironmentObject var pokemonList: PokemonList
  @State var showDetails = false
  @State var url = String()
  
  var body: some View {
    List(pokemonList.pokemons.indices, id: \.self) { index in
      Text("\(index + 1).  \(pokemonList.pokemons[index].name.capitalized)")
        .onTapGesture {
          showDetails = true
          url = pokemonList.pokemons[index].url
        }
        .sheet(isPresented: $showDetails) {
          PokemonDetailsView(url: $url)
        }
    }
    .navigationTitle("Pokedex")
  }
}

#Preview {
  PokemonListView()
}
