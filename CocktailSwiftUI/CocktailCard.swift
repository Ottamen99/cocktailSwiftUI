//
//  CocktailCard.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 01.07.21.
//

import SwiftUI

struct CocktailCard: View {
    
    var cocktail: CocktailObject
    
    var imageName = "cocktail"
    var cocktailName = "Cocktail"
    var body: some View {
        Image(cocktail.getImage())
            .resizable(resizingMode: .stretch)
            .frame(width: 300, height: 400)
            .background(Color.black)
            .cornerRadius(15)
            .overlay(
                HStack {
                    Text(cocktail.getName())
                        .font(Font.body.bold())
                       .foregroundColor(.white)
                       .padding()
                       .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                     // Using the system heart icon see https://developer.apple.com/sf-symbols/
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: cocktail.isLiked() ? "suit.heart.fill" : "suit.heart")
                           .font(.title3)
                           .padding()
                           // Using maxWidth, maxHeight and alignement is usefull to not use additionnal views in your code (such as spacers, stacks, etc…)
                           .frame(maxHeight: .infinity, alignment: .topTrailing)
                           .foregroundColor(.white)
                    }
                }.cornerRadius(15)
            )
    }
}

struct CocktailCard_Previews: PreviewProvider {
    static var previews: some View {
        CocktailCard(cocktail: CocktailObject(vName: "Test", vImage: "negroni", vLiked: true, vGlassType: "Old Fashioned", vCocktailType: "None", vIngredients: [], vNbLikes: 453, vStrength: 23))
    }
}
