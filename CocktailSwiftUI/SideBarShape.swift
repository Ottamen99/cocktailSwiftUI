//
//  SideBarShape.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 01.07.21.
//

import SwiftUI

struct SideBarShape: View {
    
    var strokeColor = Color.black
    var title = ""
    var imageName = ""
    
    var isSelected = false
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: .init(x: 50, y: 50))
                path.addLine(to: .init(x: 0, y: 50))
                
                path.move(to: CGPoint(x: 0, y: 50))
                path.addLine(to: .init(x: 50, y: 50))
                path.addLine(to: .init(x: 50, y: 100))
                
                path.move(to: CGPoint(x: 0, y: 50))
                path.addLine(to: .init(x: 50, y: 100))
                path.addLine(to: .init(x: 0, y: 100))
                
                path.move(to: CGPoint(x: 0, y: 100))
                path.addLine(to: .init(x: 50, y: 100))
                path.addLine(to: .init(x: 0, y: 150))
            }.frame(width: 50, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(isSelected == true ? .black : strokeColor)
            VStack {
                Image(imageName).resizable()
                    .foregroundColor(.white)
                    .frame(width: 25, height: 25)
                Text(title)
                    .font(.caption)
                    .foregroundColor(.white)
                    .frame(width: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct SideBarShape_Previews: PreviewProvider {
    static var previews: some View {
        SideBarShape()
    }
}
