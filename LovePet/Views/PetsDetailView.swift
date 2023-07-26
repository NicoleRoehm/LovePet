//
//  PetsView.swift
//  LovePet
//
//  Created by Nicole Röhm on 19.07.23.
//

import SwiftUI

struct PetsDetailView: View {
    var pets: Pets
    var body: some View {
        
        ZStack{
            
            Color.orange.opacity(0.3)
        VStack{
            
            Image(pets.image!)
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom)
            
            List{
                
                    Text("Name:  \(pets.name!)")
                    .bold()
                    Text("Age: \(pets.age!)")
                    .bold()
                    Text("Race: \(pets.race!)")
                    .bold()
                    Text("Gender: \(pets.gender!)")
                    .bold()
                Text("Description: \(pets.descriptions!)")
                    .bold()
                
            }.fontDesign(.serif)
                
        }
        }
    }
}

struct PetsDetailView_Previews: PreviewProvider {
    static var viewModel = OwnerViewModel()
    
    
    static var previews: some View {
        PetsDetailView(pets: viewModel.petsByOwner.first!)
    }
}
