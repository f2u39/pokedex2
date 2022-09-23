//
//  PokemonList.swift
//  pokedex
//
//  Created by Fuu on 2022/09/23.
//

import SwiftUI

struct PokemonList: View {
    var body: some View {
        List(pokemons) { pokemon in
            PokemonRow(pokemon: pokemon)
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
