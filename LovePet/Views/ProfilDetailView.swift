//
//  ProfilView.swift
//  LovePet
//
//  Created by Nicole Röhm on 14.07.23.
//

import SwiftUI

struct ProfilDetailView: View {
    @StateObject var viewModel2 = OwnerViewModel()
    let owner: Owner
    
    @State var isDrawerOpen = false
  
    
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
                                    ForEach(viewModel2.petsByOwner){ pet in
                                        
                                        NavigationLink{
                                            PetsView()
                                        }label: {
                                            CatAndDogSmallView(pet: pet)
                                        
                                        }
                                    }
                                }
                            }
                        }.onAppear{
                            //viewModel2.fetchPetsbyOwner(owner: owner)
                            
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
                .navigationTitle("Profile")
                .sheet(
                    isPresented: $isDrawerOpen,
                    content:{
                        AddPetView(isDrawerOpen: $isDrawerOpen, owner: owner)
                    })
                }            }
        }
    }




struct ProfilDetailView_Previews: PreviewProvider {
    static var viewModel = OwnerViewModel()
    static let owners = Owner.fetchRequest()
    
    static var previews: some View {
        ProfilDetailView( owner: viewModel.savedOwner.first! )
    }
}
