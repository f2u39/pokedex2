//
//  PokemonStatus.swift
//  PokemonStatus
//
//  Created by Fuu on 2022/09/23.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct PokemonStatus: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PokemonAttributes.self) { context in
        } dynamicIsland: { context in
            DynamicIsland {
                // ---------------------------------------
                // |compactLeading ■■■■ ◉ compactTrailing|  minimal
                // ---------------------------------------
                // 
                // -----------------------
                // |Lead  |Center|  Trail|
                // |-ing  |Buttom|  -ing |
                // -----------------------
                DynamicIslandExpandedRegion(.leading) {
                    HStack{
                        Image(systemName: "person")
                            .font(.system(size: 14))
                            .clipShape(Circle())
                        Text("CenterText")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .leading)
                    }
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    Image(systemName: "timer")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
                DynamicIslandExpandedRegion(.center) {}
                DynamicIslandExpandedRegion(.bottom) {
                    DynamicIslandStatusView(context: context)
                }
            } compactLeading: {
                Image(systemName: "heart")
                    .font(.title3)
            } compactTrailing: {
                Image(systemName: "pencil")
                    .font(.title3)
            } minimal: {
                Image(systemName: "house")
                    .font(.title3)
            }
        }
    }
        
    @ViewBuilder
    func DynamicIslandStatusView(context: ActivityViewContext<PokemonAttributes>)->some View{
        HStack(alignment: .bottom, spacing: 0){
            VStack(alignment: .leading, spacing: 4) {
                Text("Active Calories")
                    .font(.callout)
                    .foregroundColor(.white)
                Text("\(Int(context.state.progress * 500)) CAL")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .offset(x: 5,y: 5)
            
            HStack(alignment: .bottom,spacing: 0){
                Image("003")
                    .frame(width: 45, height: 45)
            }
        }
    }
}
