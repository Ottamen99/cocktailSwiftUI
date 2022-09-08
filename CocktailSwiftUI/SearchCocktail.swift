//
//  SearchCocktail.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 23.08.21.
//

import SwiftUI

struct SearchCocktail: View {
    
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
                    Text("Search")
                        .font(.custom("Montserrat-ExtraLight", size: 40))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding()
                }.frame(width: geometry.size.width, alignment: .center)
                SearchBar(text: .constant(""))
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
    }
}

struct SearchCocktail_Previews: PreviewProvider {
    static var previews: some View {
        SearchCocktail()
    }
}
