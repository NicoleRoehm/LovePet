//
//  ContentView.swift
//  LovePet
//
//  Created by Nicole Röhm on 23.06.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authServices :
        FirebaseAuthService
    
    var body: some View {
        TabView{
            ChatView()
               .tabItem{
                   Label("Chat", systemImage: "text.bubble")
               }
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                    ProfilDetailView(isDrawerOpen: .constant(true), name: "", race: "", age: "", gender: "", descriptions: "")
                        .tabItem{
                            Label("Profil", systemImage: "person")
                        }
            
                
        }
        
        Group{
            if authServices.user != nil{
                HomeView()
            }else{
                LogInView()
            }
        }.onAppear{
            authServices.listentoAuthState()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FirebaseAuthService())
    }
}
