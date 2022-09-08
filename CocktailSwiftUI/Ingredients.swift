//
//  Ingredients.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 24.08.21.
//

import Foundation
import CoreData

public class Ingredients: NSManagedObject, Identifiable {
    @NSManaged public var ingredientName: String
    @NSManaged public var imageName: String
    @NSManaged public var idIngredient: Int
}


extension Ingredients {
    static func getAllIngredients() -> NSFetchRequest<Ingredients> {
        let request: NSFetchRequest<Ingredients> = Ingredients.fetchRequest() as! NSFetchRequest<Ingredients>
        let sortDescriptor = NSSortDescriptor(key: "idIngredient", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
