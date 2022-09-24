//
//  PokemonDetail.swift
//  pokedex
//
//  Created by Fuu on 2022/09/23.
//

import SwiftUI

struct PokemonDetail: View {
    var pokemon: Pokemon
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/"+pokemon.id+".png")!,
                       placeholder: { Text("Loading...") },
                       image: { Image(uiImage: $0).resizable() })
            .frame(width: 260, height: 260)
            .border(Color.gray, width: 3)
            
            VStack(alignment: .center) {
                Text(pokemon.name)
                    .font(.title)
                List(pokemons) { pokemon in
                    NavigationLink {
                        PokemonDetail(pokemon: pokemon)
                    } label: {
                        PokemonRow(pokemon: pokemon)
                    }
                }
                HStack {
                    Text(pokemon.jp_name)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text(pokemon.description)
            }
            .padding()
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail(pokemon: pokemons[0])
    }
}
