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
  
  init() {
    let navbarAppearance = UINavigationBarAppearance()
    
    navbarAppearance.largeTitleTextAttributes = [
      .font: UIFont(name: "ArialRoundedMTBold", size: 36)!,
      .foregroundColor: UIColor.white
    ]
    
    navbarAppearance.titleTextAttributes = [
      .font: UIFont(name: "ArialRoundedMTBold", size: 19)!
    ]
    
    UINavigationBar.appearance().standardAppearance = navbarAppearance
    UINavigationBar.appearance().compactAppearance = navbarAppearance
  }
  
  var body: some View {
    List(pokemonList.pokemons.indices, id: \.self) { index in
      Text("\(index + 1).  \(pokemonList.pokemons[index].name.capitalized)")
        .fontWeight(.semibold)
        .onTapGesture {
          showDetails = true
          url = pokemonList.pokemons[index].url
        }
        .sheet(isPresented: $showDetails) {
          PokemonDetailsView(url: $url)
        }
    }
    .background(Color.red)
    .scrollContentBackground(.hidden)
    .navigationTitle("Pokedex")
  }
}

//#Preview {
//  PokemonListView()
//}
