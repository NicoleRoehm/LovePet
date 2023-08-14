//
//  LogInView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//


import SwiftUI

struct LogInView: View {
    @EnvironmentObject var authService: FirebaseAuthService
    @EnvironmentObject var viewModel : OwnerViewModel
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @AppStorage("UserId") var userId = ""
    
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
                    if name == "" {
                        authService.signIn(email: email, password: password)
                        
                    }
                   
                    
                    //save currentOwner
                }.buttonStyle(.borderedProminent)
            
                Text("or")
            
                Button("SignUp"){
                    authService.signUp(email: email, password: password)
                    viewModel.createOwner(name: name, image: "profilbild1", iD: userId)
                    
                       
                    
                    
                }.buttonStyle(.bordered)
        }
    )
    }
}

struct LogInView_Previews: PreviewProvider {

    static var previews: some View {
        LogInView().environmentObject(FirebaseAuthService())
                   .environmentObject(OwnerViewModel())
    }
}
