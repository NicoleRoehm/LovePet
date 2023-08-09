//
//  ContentView.swift
//  LovePet
//
//  Created by Nicole Röhm on 23.06.23.

// TabView einfügen

// Hier ist ein Fehler drin, den wir nicht beheben konnten.
// 
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authServices :
        FirebaseAuthService
    
    @EnvironmentObject var viewModel : OwnerViewModel
    @AppStorage("UserId") var userId = ""
    
    var body: some View {
        
        
            Group{
                if userId != ""{
                    
                    HomeView(owner: viewModel.savedOwner.first!)
                    
                }else{
                    LogInView()
                }
                
            }
            .onAppear{
                authServices.listentoAuthState()
                
                
            }
    }
}


struct ContentView_Previews: PreviewProvider {
   
    
    static var previews: some View {
        ContentView().environmentObject(FirebaseAuthService())
            .environmentObject(OwnerViewModel())
    }
}

