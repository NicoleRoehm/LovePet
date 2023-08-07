//
//  AddPetView.swift
//  LovePet
//
//  Created by Nicole Röhm on 03.07.23.
//
// Bild muss noch eingefügt werden

import SwiftUI

struct AddPetView: View {
    @EnvironmentObject var viewModel : OwnerViewModel
    @Binding var isDrawerOpen : Bool
    var owner: Owner
    @State var name = ""
    @State var race = ""
    @State var age = ""
    @State var gender = ""
    @State var descriptions = ""
    
    
    var body: some View {
        VStack{
            HStack{
                Text("NewPet")
                    .font(.title)
                
                Spacer()
                
                Button(
                    action: { isDrawerOpen = false},
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                )
                
            }
            .padding()
                
                TextField("Name", text: $name)
                .padding(.leading)
                TextField("Race", text: $race)
                .padding(.leading)
                TextField("Age", text: $age)
                .padding(.leading)
                TextField("Gender", text: $gender)
                .padding(.leading)
                TextField("Description", text:$descriptions)
                .padding(.leading)
            
                  
                Button(
                    action: {
                        viewModel.createNewPets(age: age, name: name , gender: gender, race: race, descriptions: descriptions, ownerId: viewModel.savedOwner.first!.id!, image: "")
                            isDrawerOpen = false
                        viewModel.fetchPetsbyOwner(ownerId: owner.id!)
                    
                }, label: {
                    Text("add Pet")
                        .foregroundColor(.white)
                }
            )
                .frame(maxWidth: .infinity , minHeight: 44)
                .background(Color.blue)
                .cornerRadius(8)
                .padding()
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 5)
        .offset(y: isDrawerOpen ? 0 : UIScreen.main.bounds.height)
    }
}


struct AddPetView_Previews: PreviewProvider {
    static var viewModel = OwnerViewModel()
    static let owners = Owner.fetchRequest()
    static var previews: some View {
        AddPetView(isDrawerOpen:.constant(true), owner: viewModel.savedOwner.first!)
                                .environmentObject(OwnerViewModel())
    }
}
