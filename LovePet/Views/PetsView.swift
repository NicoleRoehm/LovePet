//
//  PetsView.swift
//  LovePet
//
//  Created by Nicole Röhm on 19.07.23.
//

import SwiftUI

struct PetsView: View {
    var body: some View {
        VStack{
            HStack{
            Text("Name")
            }
        }
    }
}

struct PetsView_Previews: PreviewProvider {
    static var viewModel = OwnerViewModel()
    static let pets = Pets.fetchRequest()
    
    static var previews: some View {
        PetsView()
    }
}
