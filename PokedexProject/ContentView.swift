//
//  ContentView.swift
//  PokedexProject
//
//  Created by Cristian Bermudez Martinez on 26/2/24.
//

import SwiftUI

struct ContentView: View {
  @StateObject var pokemonListViewModel = PokemonList()
  
  var body: some View {
    NavigationStack {
      PokemonListView()
        .environmentObject(pokemonListViewModel)
    }
    .onAppear {
      pokemonListViewModel.getPokemons()
    }
    
  }
  
}

#Preview {
  ContentView()
}
