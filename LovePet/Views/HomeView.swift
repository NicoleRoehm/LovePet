//
//  HomeView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = DogApiViewModel()
    @StateObject var viewModel1 = CatApiViewModel()
    @EnvironmentObject var authService :
    FirebaseAuthService
    
    var body: some View {
        NavigationStack{
            VStack{
                
                
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
