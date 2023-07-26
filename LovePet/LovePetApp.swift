//
//  LovePetApp.swift
//  LovePet
//
//  Created by Nicole Röhm on 23.06.23.
//

import SwiftUI
import Firebase

@main
struct LovePetApp: App {
    
    @StateObject var viewModel = OwnerViewModel()
    @StateObject var fireBaseAuth = FirebaseAuthService()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(FirebaseAuthService())
                        .environmentObject(OwnerViewModel())
        }
    }
}
