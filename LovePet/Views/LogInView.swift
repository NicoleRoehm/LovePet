//
//  LogInView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var authService: FirebaseAuthService
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        
        VStack{
            
            Image("logolp")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
                TextField("Email", text: $email)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    
                    
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                
                
                Button("SignIn"){
                    authService.signIn(email: email, password: password)
                    
                }.buttonStyle(.borderedProminent)
            
                Text("or")
            
                Button("SignUp"){
                    
                    authService.signUp(email: email, password: password)
                    
                }.buttonStyle(.bordered)
            
            
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView().environmentObject(FirebaseAuthService())
    }
}
