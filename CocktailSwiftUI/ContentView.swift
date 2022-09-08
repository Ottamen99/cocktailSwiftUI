//
//  ContentView.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 01.07.21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var tabViewRouter: TabViewRouter
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor1"), Color("BackgroundColor2")]), startPoint: .leading, endPoint: .trailing).ignoresSafeArea()
                switch tabViewRouter.currentPage {
                case .home:
                    HomeCocktail()
                case .liked:
                    LikedCocktail()
                case .search:
                    SearchCocktail()
                }
                ZStack {
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            HStack {
                                TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/35, sysIconName: "house", tabName: "Home", tabViewRouter: tabViewRouter, assignedPage: .home)
                                TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/35, sysIconName: "heart", tabName: "Liked", tabViewRouter: tabViewRouter, assignedPage: .liked)
                                TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/35, sysIconName: "magnifyingglass", tabName: "Search", tabViewRouter: tabViewRouter, assignedPage: .search)
                            }.frame(width: geometry.size.width - 100, height: geometry.size.height/12)
                            .background(Color.black.opacity(0.75))
                            .shadow(radius: 15)
                            .cornerRadius(15)
                        }.frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                  Button(action: {
                    print("Refresh")
                  }) {
                    Label("Send", systemImage: "paperplane.fill")
                  }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                  Button(action: {
                    print("Refresh")
                  }) {
                    Label("Refresh", systemImage: "arrow.clockwise")
                  }
                }
              }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tabViewRouter: TabViewRouter())
    }
}

struct TabBarIcon: View {
    
    let width, height: CGFloat
    let sysIconName, tabName: String
    
    @StateObject var tabViewRouter: TabViewRouter
    let assignedPage: Page
    
    var body: some View {
        VStack {
            Image(systemName: sysIconName).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .foregroundColor(.white)
        }.onTapGesture {
            tabViewRouter.currentPage = assignedPage
        }
    }
}
