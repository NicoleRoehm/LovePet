//
//  PetsView.swift
//  LovePet
//
//  Created by Nicole Röhm on 19.07.23.
//

import SwiftUI

struct PetsDetailView: View {
    var pet:Pets
    var body: some View {
        
        ZStack{
            
            Color.orange.opacity(0.3)
        VStack{
            
            Image(pet.image!)
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom)
            
            List{
                
                Text("Name:  \(pet.name!)")
                    .bold()
                    Text("Age: \(pet.age!)")
                    .bold()
                    Text("Race: \(pet.race!)")
                    .bold()
                    Text("Gender: \(pet.gender!)")
                    .bold()
                Text("Description: \(pet.descriptions!)")
                    .bold()
                
            }.fontDesign(.serif)
                
        }
        }
    }
}

struct PetsDetailView_Previews: PreviewProvider {
    static var viewModel = OwnerViewModel()
    
    
    static var previews: some View {
        PetsDetailView(pet: viewModel.petsByOwner.first!)
    }
}
