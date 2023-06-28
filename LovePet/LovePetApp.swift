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
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(FirebaseAuthService())
        }
    }
}
