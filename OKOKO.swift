//
//  OKOKO.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 11.01.22.
//

import SwiftUI

struct OKOKO: View {
    var body: some View {
        NavigationView {
            Text("Buttons Example")
              .toolbar {
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

struct OKOKO_Previews: PreviewProvider {
    static var previews: some View {
        OKOKO()
    }
}
