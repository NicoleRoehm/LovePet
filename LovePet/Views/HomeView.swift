//
//  HomeView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var viewModel2 = OwnerViewModel()
    @State private var isDrawerOpen = false
    @EnvironmentObject var authService :
    FirebaseAuthService
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(viewModel2.savedOwner){ owner in
                        NavigationLink{
                            ProfilDetailView()
                        }label: {
                            ProfilSmallView(owner: owner)
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
            }
                .navigationTitle("Profile")
                .sheet(
                    isPresented: $isDrawerOpen,
                    content:{
                        AddProfilView(isDrawerOpen: $isDrawerOpen, name: "", race: "", age: "", gender: "", descriptions: "")
                    })
                
            }
            
        }
    }


struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        //HomeView().environmentObject(FirebaseAuthService())
        HomeView(viewModel2: OwnerViewModel())
    
    }
}
