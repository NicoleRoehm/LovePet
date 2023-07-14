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
            
            HStack{
                ForEach(viewModel2.savedOwner) { owner
                    in
                    NavigationLink {
                        
                        ProfilDetailView()
                        
                    } label: {
                        ProfilSmallView()
                    }
                }
                
                
            }
            .toolbar {
                ToolbarItem {
                    Button(
                        action: { isDrawerOpen.toggle()},
                        label: {Label ("Add Pet",
                            systemImage: "plus") }
                    )
                }
            }
            .navigationTitle("Profile")
            .sheet(
                isPresented: $isDrawerOpen,
                content:{
                    AddPetView(isDrawerOpen: $isDrawerOpen, name: "", race: "", age: "", gender: "", descriptions: "")
                })
            
            
            
        }
    }
}


                

        
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FirebaseAuthService())
    }
}
