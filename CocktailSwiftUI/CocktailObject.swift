//
//  CocktailObject.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 23.08.21.
//

import Foundation
class CocktailObject: Identifiable {
    
    private var name: String = ""
    private var image: String = ""
    private var liked: Bool = false
    private var glassType: String = ""
    private var cocktailType: String = ""
    private var ingredients: [String] = []
    private var nbLikes: Int = 0
    private var strength: Int = 0
    var id = UUID()
    
    init(vName: String, vImage: String, vLiked: Bool, vGlassType: String, vCocktailType: String, vIngredients: [String], vNbLikes: Int, vStrength: Int) {
        self.name = vName
        self.image = vImage
        self.liked = vLiked
        self.glassType = vGlassType
        self.cocktailType = vCocktailType
        self.ingredients = vIngredients
        self.nbLikes = vNbLikes
        self.strength = vStrength
    }
    
    func like() {
        self.liked = true
    }
    
    func dislike() {
        self.liked = false
    }
    
    func getName() -> String {
        return self.name
    }
    
    func setName(vName: String) {
        self.name = vName
    }
    
    func getImage() -> String {
        return self.image
    }
    
    func setImage(vImage: String) {
        self.image = vImage
    }
    
    func isLiked() -> Bool {
        return self.liked
    }
    
    func setGlassType(vGlassType: String) {
        self.name = vGlassType
    }
    
    func getGlassType() -> String {
        return self.glassType
    }
    
    func setCocktailType(vCocktailType: String) {
        self.name = vCocktailType
    }
    
    func getCocktailType() -> String {
        return self.cocktailType
    }
    
    func getAllIngredients() -> [String] {
        return self.ingredients
    }
    
    func getNbLikes() -> Int {
        return self.nbLikes
    }
    
    func getStrength() -> Int {
        return self.strength
    }
}
