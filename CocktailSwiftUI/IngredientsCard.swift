//
//  IngredientsCard.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 18.08.21.
//

import SwiftUI

struct IngredientsCard: View {
    
    var bottleName = ""
    var body: some View {
    
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Image(bottleName).resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 175, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 15)
                }
                .background(Color.black.opacity(0.5))
                 .cornerRadius(20)
                //.padding(.horizontal, 10)
                 .frame(width: 125, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
}

struct IngredientsCard_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsCard(bottleName: "midori")
    }
}
