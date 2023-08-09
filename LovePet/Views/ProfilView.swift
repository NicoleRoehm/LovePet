//
//  ProfilView.swift
//  LovePet
//
//  Created by Nicole Röhm on 09.08.23.
//

import SwiftUI

struct ProfilView: View {
    
    @EnvironmentObject var viewModel : OwnerViewModel
    var owner: Owner
    @State var isDrawerOpen = false
    @AppStorage("UserId") var userId = ""
    
    var body: some View {
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
                }
                .navigationTitle("Profil")
                .sheet(
                    isPresented: $isDrawerOpen,
                    content:{
                        AddPetView(isDrawerOpen: $isDrawerOpen, owner: owner)
                    }
                )
            }
        }
        
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(owner: Owner())
            .environmentObject(OwnerViewModel())
            
    }
}
