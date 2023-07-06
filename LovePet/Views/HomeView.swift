//
//  HomeView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = DogApiService()
    @StateObject var viewModel1 = CatApiService()
    @EnvironmentObject var authService :
    FirebaseAuthService
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    
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
