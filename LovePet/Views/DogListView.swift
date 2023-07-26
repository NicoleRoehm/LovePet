//
//  DogListVIew.swift
//  LovePet
//
//  Created by Nicole Röhm on 17.07.23.
//

import SwiftUI

struct DogListView: View {
    @StateObject var dogApiService = DogApiService()
    var body: some View {
        List{
            Section("Dogs"){
                ForEach(dogApiService.dogs, id: \.self){
                    dog in
                    
                    VStack(alignment: .leading){
                        Text(dog.name)
                    }
                }
            }
        }.onAppear{dogApiService.fetchDogs()}
        
    }
    
}


struct DogListView_Previews: PreviewProvider {
    static var previews: some View {
        DogListView()
    }
}
