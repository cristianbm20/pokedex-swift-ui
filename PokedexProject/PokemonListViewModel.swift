//
//  PokemonListViewModel.swift
//  PokedexProject
//
//  Created by Cristian Bermudez Martinez on 27/2/24.
//

import Foundation

struct PokemonDataModel: Decodable {
  let name: String
  let url: String
}

struct PokemonResponseDataModel: Decodable {
  let pokemons: [PokemonDataModel]
  
  enum CodingKeys: String, CodingKey {
    case results
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
  }
}

final class PokemonList: ObservableObject {
  @Published var pokemons: [PokemonDataModel] = []
  
  func getPokemons() {
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=493")
    
    URLSession.shared.dataTask(with: url!) { data, response, error in
      if let _ = error {
        print("Error")
      }
      
      if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
        let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
        
        DispatchQueue.main.async {
          self.pokemons = pokemonDataModel.pokemons
        }
        
      }
      
    }
    .resume()
    
  }
  
}
