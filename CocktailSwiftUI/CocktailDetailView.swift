//
//  CocktailDetailView.swift
//  CocktailSwiftUI
//
//  Created by Ottavio Buonomo on 18.08.21.
//

import SwiftUI

struct CocktailDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var cocktail: CocktailObject
    let layout = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.backward")
                   .font(.title3)
                   .foregroundColor(.white)
            }
        }
    }
    
    var btnAddFav : some View { Button(action: {
//        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: cocktail.isLiked() ? "heart.fill": "heart")
                    .font(.title3)
                    .foregroundColor(.white)
            }
        }
    }
    
    init(cocktail: CocktailObject) {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        self.cocktail = cocktail
     }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor1"), Color("BackgroundColor2")]), startPoint: .leading, endPoint: .trailing).ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false, content: {
                GeometryReader { geometry in
                    if geometry.frame(in: .global).minY > -480 {
                        Image(cocktail.getImage()).resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .offset(y: -geometry.frame(in: .global).minY)
                            .frame(width: UIScreen.main.bounds.width, height:
                                    geometry.frame(in: .global).minY > 0 ?
                                geometry.frame(in: .global).minY + 480 : 480)
                    }
                }.frame(height: 400)
                VStack(alignment: .leading, spacing: 15, content: {
                    Text(cocktail.getName())
                        .font(.custom("Montserrat-ExtraLight", size: 40))
                       .foregroundColor(.white)
                    HStack {
                        Image(systemName: cocktail.isLiked() ? "heart.fill": "heart").foregroundColor(.white)
                        Text(String(cocktail.getNbLikes())).foregroundColor(.white).font(.caption).padding(.trailing, 30)
                        
                        Image(systemName: "clock").foregroundColor(.white)
                        Text("10 min").foregroundColor(.white).font(.caption)
                    }
                    Spacer()
                    HStack {
                        VStack {
                            Text("Glass Type").textCase(.uppercase).font(.caption)
                            Text(cocktail.getGlassType()).foregroundColor(Color(hue: 0.15, saturation: 0.429, brightness: 0.987)).padding(.top, 5).font(Font.body.bold())
                        }
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                        VStack {
                            Text("Cocktail type").textCase(.uppercase).font(.caption)
                            Text(cocktail.getCocktailType()).padding(.top, 5).font(Font.body.bold()).foregroundColor(Color(hue: 0.15, saturation: 0.429, brightness: 0.987)).font(Font.body.bold())
                        }
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                        VStack {
                            Text("Strength").textCase(.uppercase).font(.caption)
                            Text(String(cocktail.getStrength()) + "%").padding(.top, 5).font(Font.body.bold()).foregroundColor(Color(hue: 0.15, saturation: 0.429, brightness: 0.987)).font(Font.body.bold())
                        }
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                    }.frame(width: UIScreen.main.bounds.width - 50, alignment: .center)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    Spacer()
                    HStack {
                        Text("Ingredients").font(.title2).frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                        Text(String(cocktail.getAllIngredients().count) + " items").font(.subheadline).foregroundColor(.gray)
                    }.padding(.bottom, 10)
                    LazyVGrid(columns: layout, spacing: 215, content: {
                        ForEach(cocktail.getAllIngredients(), id: \.self){ i in
                            IngredientsCard(bottleName: i)
                        }
                    }).frame(height: CGFloat(ceil(Double(cocktail.getAllIngredients().count) / 3.0) * 205), alignment: .topLeading)
                    Spacer()
                    Text("Instructions").font(.title2)
                    Text(plot).padding(.top, 10).foregroundColor(.white)
                }).padding(.top, 25)
                .padding(.horizontal)
                .background(LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor1"), Color("BackgroundColor2")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .offset(y: -35)
            }).edgesIgnoringSafeArea(.all)
            .foregroundColor(.white)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack, trailing: btnAddFav)
        }
    }
}

var plot = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras suscipit interdum sem quis mollis. Sed id velit gravida, accumsan felis ultricies, molestie purus. Sed blandit elementum libero nec varius. Aliquam hendrerit convallis est, ut tempor nulla consequat ut. Donec sollicitudin id risus ac tempor. Quisque quis augue dui. Pellentesque posuere tortor vel erat pharetra laoreet. Praesent in ullamcorper neque. Maecenas egestas dictum nunc, sit amet convallis risus dapibus ultrices. Etiam mattis diam purus, id lobortis libero rutrum vel. Nullam tempor urna eu imperdiet pharetra. Aenean porttitor elit eu odio tempor imperdiet. Cras nec erat in massa scelerisque vulputate at vel nunc. Suspendisse congue ornare vestibulum. Sed venenatis massa nibh, at sodales libero sollicitudin a."

struct CocktailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailView(cocktail: CocktailObject(vName: "Blue Lagoon", vImage: "blue_lagoon", vLiked: true, vGlassType: "Long Drink", vCocktailType: "Long Drink", vIngredients: ["blue_curacao", "absolutVodka", "lemon", "ice"], vNbLikes: 653, vStrength: 23))
    }
}
