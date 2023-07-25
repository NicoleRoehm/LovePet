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
