//
//  PokemonRow.swift
//  pokedex
//
//  Created by Fuu on 2022/09/23.
//

// If the preview isn’t visible already,
// show the canvas by choosing Editor > Canvas, and then click Resume.

import SwiftUI

struct PokemonRow: View {
    var pokemon: Pokemon
    
    var body: some View {
        HStack {
            pokemon.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(pokemon.name)
            Text(pokemon.jp_name)
            
            Spacer()
        }
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonRow(pokemon: pokemons[0])
            PokemonRow(pokemon: pokemons[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
