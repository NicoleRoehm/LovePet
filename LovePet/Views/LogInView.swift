//
//  LogInView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//
// Namen direkt mit registrieren fehlt noch 

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var authService: FirebaseAuthService
    @EnvironmentObject var viewModel : OwnerViewModel
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    
    var body: some View {
        
        Color.yellow.ignoresSafeArea()
        
            .overlay(VStack{
            
            Image("logolp")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.bottom, 70)
            HStack{
                Image(systemName: "person")
                    .padding(18)
                TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            }
            HStack{
                Image(systemName: "envelope")
                    .padding()
                TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            }
            HStack{
                Image(systemName: "lock")
                    .padding(18)
                SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                
            }
              
                
                Button("SignIn"){
                    viewModel.createOwner(name: name, image: "profilbild1")
                    authService.signIn(email: email, password: password)
                    //save currentOwner
                }.buttonStyle(.borderedProminent)
            
                Text("or")
            
                Button("SignUp"){
                    viewModel.createOwner(name: name, image: "profilbild1")
                    
                       authService.signUp(email: email, password: password)
                    
                    
                }.buttonStyle(.bordered)
        }
    )
    }
}

struct LogInView_Previews: PreviewProvider {
    static var viewModel = OwnerViewModel()
    static let owners = Owner.fetchRequest()
    static var previews: some View {
        LogInView().environmentObject(FirebaseAuthService())
                   .environmentObject(OwnerViewModel())
    }
}
