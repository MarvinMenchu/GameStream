//
//  Home.swift
//  GameStream
//
//  Created by Marvin Manuel Menchú Menchú on 7/08/23.
//

import SwiftUI

struct Home: View {
    
    @State var tabSeleccionado :Int = 2
    
    var body: some View {
        
    
        TabView(selection: $tabSeleccionado){
            
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            Text("Pantalla Juegos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            /*Text("Pantalla Inicio").font(.system(size: 30, weight: .bold, design: .rounded))*/
            
            PantallaHome().tabItem{
                    Image(systemName: "house")
                    Text("Inicio")
                    
                }.tag(2)
            
            
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }.accentColor(.white)
        
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
        print("iniciando las vistas del home")
    }
}


struct PantallaHome:View{
    
    @State var textoBusqueda: String = ""
    
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            
            VStack {
                Image("applogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11.0)
                HStack {
                    Button(action: busqueda, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-cian"))
                        
   
                    })
                    
                    ZStack(alignment: .leading) {
                        if textoBusqueda.isEmpty {
                            Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255).opacity(1.0))
                            
                        }
                        TextField("", text: $textoBusqueda).foregroundColor(.white)
                    }
                }.padding([.top,.leading, .bottom], 11).background(Color("Dark-gray")).clipShape(Capsule())
            }.padding(.horizontal, 18)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
    func busqueda() {
        print("El usuario esta buscando el texto de \(textoBusqueda)")
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
