//
//  TabViewRouter.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 23.08.21.
//

import Foundation

class TabViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
     case home
     case liked
     case search
 }
