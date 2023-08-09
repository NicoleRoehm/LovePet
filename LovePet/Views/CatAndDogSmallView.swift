//
//  CatAndDogSmallView.swift
//  LovePet
//
//  Created by Nicole Röhm on 20.07.23.
//

import SwiftUI

struct CatAndDogSmallView: View {
    
    var pet : Pets
    var deviceWidth = CGFloat(UIScreen.main.bounds.width)
    
    var body: some View {
        ZStack{Color.mint.opacity(0.4)
            
            VStack{
                Image(pet.image!)
                    .resizable()
                    .scaledToFit()
                HStack{
                    Text(pet.name!)
                    
                        .font(.system(size: 25))
                        .padding()
                    
                    Spacer()
                    
                    Image(systemName: "pawprint")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding()
                }
            }
        }.frame(width: (deviceWidth+30) / 2,
         height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct CatAndDogSmallView_Previews: PreviewProvider {
    
    static var viewModel = OwnerViewModel()
    
    
    static var previews: some View {
        CatAndDogSmallView(pet: viewModel.savedPets.first!)
    }
}
