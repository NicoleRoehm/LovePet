//
//  AddPetView.swift
//  LovePet
//
//  Created by Nicole Röhm on 03.07.23.
//

import SwiftUI

struct AddPetView: View {
    @StateObject var viewModel1 = DogApiService()
    @StateObject var viewModel2 = CatApiService()
    @StateObject var viewModel3 = OwnerViewModel()
    @Binding var isDrawerOpen: Bool
    @State var name :String
    @State var race :String
    @State var age :String
    @State var gender :String
    @State var descriptions :String
    
    var body: some View {
        VStack{
            HStack{
                Text("New Pet")
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
                TextField("Race", text: $race)
                TextField("Age", text: $age)
                TextField("Gender", text: $gender)
                TextField("Description", text:$descriptions)
                  
                Button(
                    action: {
                        viewModel3.createNewPets(age: age, name: name , gender: gender, description: descriptions, race: race, descriptions: descriptions, ownerId: UUID())
                            isDrawerOpen = false
                    
                    
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
    static var previews: some View {
        AddPetView(isDrawerOpen: .constant(true), name: "", race: "", age: "", gender: "", descriptions: "")
    }
}
