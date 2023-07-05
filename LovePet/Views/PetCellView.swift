//
//  PetCellView.swift
//  LovePet
//
//  Created by Nicole Röhm on 05.07.23.
//

import SwiftUI

struct PetCellView: View {
    var dog: Dogs
    var cat: Cats
    var body: some View {
        NavigationStack{
            VStack{
                
                
                
            
                
            }
        }
    }
}

struct PetCellView_Previews: PreviewProvider {
    static var previews: some View {
        PetCellView(dog: Dogs.dummyDog, cat: Cats.dummyCat)
    }
}
