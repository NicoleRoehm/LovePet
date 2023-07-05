//
//  PetListView.swift
//  LovePet
//
//  Created by Nicole Röhm on 03.07.23.
//

import SwiftUI

struct PetListView: View {
    @StateObject var viewModel1 = DogApiService()
    @StateObject var viewModel2 = CatApiService()
    
    var body: some View {
        VStack{
            ScrollView{
                
            }
        }
    }
}

struct PetListView_Previews: PreviewProvider {
    static var previews: some View {
        PetListView()
    }
}
