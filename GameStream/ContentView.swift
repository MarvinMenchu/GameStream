//
//  ContentView.swift
//  GameStream
//
//  Created by Marvin Manuel Menchú Menchú on 29/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

            ZStack {
                //Color(.blue).ignoresSafeArea()
                Color(red: 21/255, green: 30/255, blue: 52/255).ignoresSafeArea()
                
                VStack {
                    Image("applogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                    InicioYRegistroView()
                }
                
                
            }
            


    }
}

struct InicioYRegistroView: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Text("INICIA SESIÓN")
                Text("REGÍSTRATE")
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla01").resizable()
        ContentView()
        
    }
}
