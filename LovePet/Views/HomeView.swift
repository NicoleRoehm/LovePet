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
    @StateObject var viewModel2 = OwnerViewModel()
    @State private var isDrawerOpen = false
    @EnvironmentObject var authService :
    FirebaseAuthService
    
    var body: some View {
        NavigationStack{
            
                VStack{
                    ForEach(viewModel2.savedOwner){ owner in
                        NavigationLink{
                            ProfilDetailView()
                        }label: {
                            ProfilSmallView(owner: owner)
                        }
                    }
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView().environmentObject(FirebaseAuthService())
        
    
    }
}
