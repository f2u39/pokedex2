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
        VStack {
            CircleImage(image: pokemon.image)
                .offset(y: -150)
                .padding(.bottom, -130)
            
            VStack(alignment: .center) {
                Text(pokemon.name)
                    .font(.title)
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
