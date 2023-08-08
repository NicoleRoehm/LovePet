//
//  ProfilView.swift
//  LovePet
//
//  Created by Nicole Röhm on 14.07.23.
//
// 

import SwiftUI

struct ProfilDetailView: View {
    @EnvironmentObject var viewModel : OwnerViewModel
    @EnvironmentObject var authService :
    FirebaseAuthService
    var owner: Owner
    @State var isDrawerOpen = false
    @AppStorage("UserId") var userId = ""
    
    var body: some View {
        TabView{
            NavigationStack{
                ZStack{
                    Color.indigo.opacity(0.2)
                    VStack{
                        HStack(alignment: .center){
                            Image(owner.image!)
                                .resizable()
                                .frame(width: 125, height: 125)
                            Text(owner.name!)
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                        }
                        VStack{
                            Form{
                                Section("Pets"){
                                    if (!viewModel.petsByOwner.isEmpty){
                                        ForEach(viewModel.petsByOwner){ pet in
                                            
                                            NavigationLink{
                                                PetsDetailView(pet: pet)
                                            }label: {
                                                CatAndDogSmallView(pet: pet)
                                            }
                                        }
                                    }
                                }
                            }
                        }.onAppear{
                            viewModel.fetchPetsbyOwner(ownerId: userId)
                        }
                    }.toolbar {
                        ToolbarItem {
                            Button(
                                action: { isDrawerOpen.toggle()},
                                label: {Label ("Add Pet",
                                               systemImage: "plus") }
                            )
                        }
                        ToolbarItem{
                            Button(
                                action: {
                                    authService.signOut()
                                },
                                label:{Label("LogOut", systemImage: "rectangle.portrait.and.arrow.right")})
                        }
                    }
                    .navigationTitle("Profil")
                    .sheet(
                        isPresented: $isDrawerOpen,
                        content:{
                            AddPetView(isDrawerOpen: $isDrawerOpen, owner: owner)
                        }
                    )
                }
            }.tabItem{
                Label("Profil", systemImage: "person")
            }
            NavigationStack{
                SettingsView()
                    
            }.tabItem{
                Label("Settings", systemImage: "gearshape.fill")
            }
            NavigationStack{
                ProfilListView()
            }.tabItem{
                Label("List", systemImage: "person.crop.rectangle.stack.fill")
            }
            NavigationStack{
                PetBreedsView()
            }.tabItem{
                Label("PetRace", systemImage: "pawprint.fill")
            }
        }
    }
}
struct ProfilDetailView_Previews: PreviewProvider {
    static var viewModel = OwnerViewModel()
    static let owners = Owner.fetchRequest()
    static let pets = Pets.fetchRequest()
    
    static var previews: some View {
        ProfilDetailView(owner: viewModel.savedOwner.first!)
                        .environmentObject(OwnerViewModel())
                        .environmentObject(FirebaseAuthService())
    }
}
  
