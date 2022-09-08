//
//  LikedCocktail.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 23.08.21.
//

import SwiftUI

struct LikedCocktail: View {
    
    let cocktailArray: [CocktailObject] = [
        CocktailObject(vName: "Test 1", vImage: "cocktail", vLiked: false, vGlassType: "Martini", vCocktailType: "Strong", vIngredients: [], vNbLikes: 300, vStrength: 23),
        CocktailObject(vName: "Negroni", vImage: "negroni", vLiked: true, vGlassType: "Old Fashioned", vCocktailType: "Strong", vIngredients: [], vNbLikes: 566, vStrength: 23),
        CocktailObject(vName: "Blue Lagoon", vImage: "blue_lagoon", vLiked: true, vGlassType: "Long Drink", vCocktailType: "Long Drink", vIngredients: ["blue_curacao", "absolutVodka", "lemon", "ice"], vNbLikes: 653, vStrength: 23)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "line.horizontal.3")
                           .font(.title3)
                           .padding(25)
                           .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                           .foregroundColor(.white)
                    }
                    Image("avatar")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 50, height: 50, alignment: .topTrailing)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 25)
                }.frame(width: geometry.size.width, height: geometry.size.height/15, alignment: .topLeading)
                HStack {
                    Text("Liked drinks")
                        .font(.custom("Montserrat-ExtraLight", size: 40))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding()
                }.frame(width: geometry.size.width, alignment: .center)
                ScrollView {
                    ForEach(cocktailArray.filter {$0.isLiked()}, id: \.id){ c in
                        NavigationLink(
                            destination: CocktailDetailView(cocktail: c)) {
                            CocktailCard(cocktail: c).padding(.vertical, 15)
                        }
                    }
                }.frame(width: .infinity, alignment: .topTrailing)
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
    }
}

struct LikedCocktail_Previews: PreviewProvider {
    static var previews: some View {
        LikedCocktail()
    }
}
