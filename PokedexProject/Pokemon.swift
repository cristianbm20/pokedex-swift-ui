//
//  Pokemon.swift
//  PokedexProject
//
//  Created by Cristian Bermudez Martinez on 26/2/24.
//

import Foundation

struct PokemonDetailsDataModel: Decodable {
  //  let sprite: String
  let height: Int
  let weight: Int
  let types: [TypeElement]
  
  enum CodingKeys: CodingKey {
    case height
    case weight
    case types
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.height = try container.decode(Int.self, forKey: .height)
    self.weight = try container.decode(Int.self, forKey: .weight)
    self.types = try container.decode([TypeElement].self, forKey: .types)
  }
}

struct TypeContainer: Codable {
  let types: [TypeElement]
}

struct TypeDetail: Codable {
  let name: String
  let url: String
}

struct TypeElement: Codable {
  let slot: Int
  let type: TypeDetail
}

final class Pokemon: ObservableObject {
  @Published var pokemonDetails: [PokemonDetailsDataModel] = []
  
  func getPokemonDetails(urlStr: String) {
    guard let url = URL(string: urlStr) else {
      print("Invalid url")
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let _ = error {
        print("Error")
        return
      }
      
      if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
        let pokemonDetailsDataModel = try? JSONDecoder().decode(PokemonDetailsDataModel.self, from: data)
        
        DispatchQueue.main.async {
          self.pokemonDetails.append(pokemonDetailsDataModel!)
        }
        
      }
      
    }
    .resume()
    
  }
}
