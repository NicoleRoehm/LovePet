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
  
    var body: some View {
        Group{
            if authServices.user != nil{
               
                ProfilDetailView(owner:viewModel.savedOwner.first(where: {$0.id == UUID(uuidString: authServices.user!.uid)})!)
            }else{
                LogInView()
            }
        }.onAppear{
            authServices.listentoAuthState()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var viewModel = OwnerViewModel()
    static let owners = Owner.fetchRequest()
    static let pets = Pets.fetchRequest()
    
    static var previews: some View {
        ContentView().environmentObject(FirebaseAuthService())
    }
}

