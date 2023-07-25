//
//  DogListVIew.swift
//  LovePet
//
//  Created by Nicole Röhm on 17.07.23.
//

import SwiftUI

struct DogListView: View {
    @StateObject var viewModel1 = DogApiService()
    var body: some View {
        List{
            Section("Dogs"){
                ForEach(viewModel1.dogs, id: \.self){
                    dog in
                    
                    VStack(alignment: .leading){
                        Text(dog.name)
                    }
                }
            }
        }.onAppear{viewModel1.fetchDogs()}
        
    }
    
}


struct DogListView_Previews: PreviewProvider {
    static var previews: some View {
        DogListView()
    }
}
