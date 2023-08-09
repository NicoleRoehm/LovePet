//
//  HomeView.swift
//  LovePet
//
//  Created by Nicole Röhm on 09.08.23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel : OwnerViewModel
    @EnvironmentObject var authService : FirebaseAuthService
    var owner: Owner
    
    
    var body: some View {
        TabView{
            NavigationStack{
                
                VStack{
                    
                        Text("Welcome")
                            .frame(width: 300, height: 200)
                            .padding()
                        Text(owner.name!)
                            .frame(width: 200, height: 200)
                            .padding(.trailing)
                }.toolbar{
                    ToolbarItem{
                        Button(
                            action: {
                                authService.signOut()
                            },
                            label:{Label("LogOut", systemImage: "rectangle.portrait.and.arrow.right")})
                }
            }
                
            }.tabItem{
                Label("Home", systemImage: "house")
            }
            NavigationStack{
                
                ProfilView(owner: viewModel.savedOwner.first!)
                
            }.tabItem{
                Label("Profil", systemImage: "person")
            }
            NavigationStack{
                ProfilListView()
            }.tabItem{
                Label("List", systemImage: "person.crop.rectangle.stack.fill")
            }
            NavigationStack{
                SettingsView()
            }.tabItem{
                Label("Settings", systemImage: "gearshape.fill")
            }
            NavigationStack{
                PetBreedsView()
            }.tabItem{
                Label("PetRace", systemImage: "pawprint.fill")
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        HomeView(owner: Owner())
            .environmentObject(OwnerViewModel())
            .environmentObject(FirebaseAuthService())
    }
}
