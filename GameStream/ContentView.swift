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
            Spacer()
            //Color(.blue).ignoresSafeArea()
            Color(red: 21/255, green: 30/255, blue: 52/255).ignoresSafeArea()
            
            VStack {
                Image("applogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 60)
                InicioYRegistroView()
            }
            
            
        }
        
        
        
    }
}

struct InicioYRegistroView: View {
    
    @State var tipoInicioSesion: Bool = true
    
    var body: some View {
        
        VStack {
            HStack {
                
                Spacer()
                
                Button("INICIA SESIÓN") {
                    tipoInicioSesion = true
                    print("Pantalla inicio de sesión")
                }.foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                    print("Pantalla registro")
                }.foregroundColor(tipoInicioSesion ? .gray : .white)
                
                Spacer()
                
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true {
                InicioSesionView()
            } else {
                RegistroView()
            }
        }
        
    }
    
}

struct InicioSesionView: View {
    
    @State var correo : String = ""
    @State var contrasena : String = ""
    @State var isContrasenaInvisible: Bool = false
    
    var body: some View {
        ScrollView  {
            VStack (alignment: .leading) {
                Text("Correo electrónico").foregroundColor(Color("Dark-cian"))
                ZStack (alignment: .leading) {
                    
                    if correo.isEmpty {
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text : $correo).foregroundColor(.white)
                }
                
                Divider().frame(height: 1).background(Color("Dark-cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)
                ZStack (alignment: .leading) {
                    
                    if contrasena.isEmpty {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    HStack {
                        if !isContrasenaInvisible {
                            SecureField("", text: $contrasena)
                        } else {
                            TextField("", text: $contrasena)
                        }
                        Button(action: {
                            isContrasenaInvisible.toggle()
                        }, label: {
                            Image(systemName: "eye.fill").foregroundColor(Color("Dark-cian"))
                        })
                    }
                    
                    SecureField("", text : $contrasena).foregroundColor(.white)
                }
                
                Divider().frame(height: 1).background(Color("Dark-cian")).padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("Dark-cian")).padding(.bottom)
                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-cian"), lineWidth: 1.0).shadow(color: .white,radius: 6))
                })
                
                
                Text("Iniciar sesión con redes sociales").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 60, leading: 18, bottom: 11, trailing: 18))
                
                HStack{
                    
                    Button(action: iniciarConFacebook, label: {
                        Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Dark-gray")))
                    })
                    
                    Button(action: iniciarConTwitter, label: {
                        Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Dark-gray")))
                    })
                }
                
            }.padding(.horizontal, 77.0)
        }
    }
}

func iniciarSesion() {
    print("Estoy iniciando boton")
}

struct RegistroView: View {
    var body: some View {
        Text("Soy la vista de registro")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla01").resizable().ignoresSafeArea()
        ContentView()
        
    }
}

func iniciarConFacebook() {
    print("Has iniciado con Facebook")
}

func iniciarConTwitter() {
    print("Has iniciado con Twitter")
}
