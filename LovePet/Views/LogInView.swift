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
    
    var body: some View {
        
        
        VStack{
            
            Image("logolp")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.bottom, 70)
            HStack{
                Image(systemName: "person")
                    .padding()
                TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(5)
            }
            HStack{
                Image(systemName: "envelope")
                    .padding()
                TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding(.leading, 5)
            }
            HStack{
                Image(systemName: "lock")
                    .padding()
                SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(5)
                
            }
                
                
                Button("SignIn"){
                    authService.signIn(email: email, password: password)
                    //save currentOwner
                }.buttonStyle(.borderedProminent)
            
                Text("or")
            
                Button("SignUp"){
                    // create User
                    authService.signUp(email: email, password: password)
                    
                }.buttonStyle(.bordered)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView().environmentObject(FirebaseAuthService())
                   .environmentObject(OwnerViewModel())
    }
}
