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
                    ZStack{
                        
                        Color.teal.opacity(0.3)
                        Image("pfotenabdruck2")
                            .resizable()
                            .colorInvert()
                        VStack{
                        Text("Welcome")
                            .bold()
                            .font(.largeTitle)
                            .padding(.bottom, 10)
                            .fontDesign(.serif)
                        Text("to")
                            .bold()
                            .font(.largeTitle)
                            .padding(.bottom, 10)
                            .fontDesign(.serif)
                        Text("LovePet")
                            .bold()
                            .font(.largeTitle)
                            .padding(.bottom, 10)
                            .fontDesign(.serif)
                            Text(owner.name!)
                            .bold()
                            .font(.title)
                            .fontDesign(.monospaced)
                            .foregroundColor(.purple)
                        
                        
                    }.toolbar{
                        ToolbarItem{
                            Button(
                                action: {
                                    authService.signOut()
                                },
                                label:{Label("LogOut", systemImage: "rectangle.portrait.and.arrow.right")})
                        }
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
    static var viewModel = OwnerViewModel()
    static var previews: some View {
        
        HomeView(owner: viewModel.savedOwner.first!)
            .environmentObject(OwnerViewModel())
            .environmentObject(FirebaseAuthService())
           
    }
}
