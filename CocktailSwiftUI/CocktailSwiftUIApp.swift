//
//  CocktailSwiftUIApp.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 01.07.21.
//

import SwiftUI
import CoreData

@main
struct CocktailSwiftUIApp: App {
    
    @StateObject var tabViewRouter = TabViewRouter()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CocktailsDatabase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView(tabViewRouter: TabViewRouter())
        }
    }
}
