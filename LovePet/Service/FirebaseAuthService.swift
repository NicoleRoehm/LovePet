//
//  FirebaseAuthService.swift
//  LovePet
//
//  Created by Nicole Röhm on 23.06.23.
//

// Aus vorigen Projekten entnommen zur Implementierung vom Login und Logout für die App

import Foundation
import FirebaseAuth
import SwiftUI

class FirebaseAuthService : ObservableObject{
    
    @AppStorage("UserId") var userId = ""
    
    
    var user : User?{
        didSet{
            objectWillChange.send()
        }
    }
    func listentoAuthState(){
        Auth.auth().addStateDidChangeListener { _, user in
            self.user = user
            
        }
    }
    
    func signUp(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("User can´t create \(error.localizedDescription)")
                return
                
            }
            self.userId = result!.user.uid
            
        }
    }
    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error{
                print("User can´t LogIn \(error.localizedDescription)")
            }
            self.userId = result!.user.uid
            
        }
    }
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userId = ""
        }catch{
            print(error)
        }
    }
}
