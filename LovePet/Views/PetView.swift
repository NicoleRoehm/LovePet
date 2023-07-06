//
//  PetListView.swift
//  LovePet
//
//  Created by Nicole Röhm on 03.07.23.
//

import SwiftUI

struct PetView: View {
    @StateObject var viewModel1 = DogApiService()
    @StateObject var viewModel2 = CatApiService()
    
    var body: some View {
        VStack{
            if (viewModel2.cats.isEmpty){
                Button(action:{viewModel2.fetchCats()}){
                    
                    Text("load Cats")
                }
            }
            else{
                List{
                    ForEach(viewModel2.cats, id: \.self){
                        cat in
                        VStack(alignment: .leading){
                            
                            
                            Text(cat.name)
                        }
                    }
                }
            }
        }
    }
}

struct PetListView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}
