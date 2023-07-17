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
    @StateObject var viewModel3 = OwnerViewModel()
    
    var body: some View {
        HStack{
            
                if (viewModel2.cats.isEmpty){
                    Button(action:{viewModel2.fetchCats()}){
                        
                        Text("Cats")
                        Image(systemName: "")
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
                if (viewModel1.dogs.isEmpty){
                    Button(action:{viewModel1.fetchDogs()}){
                        
                        Text("Dogs")
                        Image(systemName: "")
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
        PetListView()
    }
}
