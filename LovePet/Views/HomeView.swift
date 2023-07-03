//
//  HomeView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authService :
    FirebaseAuthService
    
    var body: some View {
        VStack{
            Text("Hello \(authService.user?.email ?? "User")")
            
            Section(header: Text("My Pets")){
                
                List{
                    
                    
                    
                }
            }.toolbar{
                Button{} label: {
                    Text("Add Pet")
                    Image(systemName: "plus")
                }
            }
        }
                
    }
}
        
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FirebaseAuthService())
    }
}
