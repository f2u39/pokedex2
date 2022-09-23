//
//  PokemonList.swift
//  pokedex
//
//  Created by Fuu on 2022/09/23.
//

import SwiftUI

struct PokemonList: View {
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink {
                    PokemonDetail(pokemon: pokemon)
                } label: {
                    PokemonRow(pokemon: pokemon)
                }
            }
        }
        .navigationTitle("Pokemon")
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
