//
//  PetListView.swift
//  LovePet
//
//  Created by Nicole Röhm on 17.07.23.
//

import SwiftUI

struct CatListView: View {
    @StateObject var catApiService = CatApiService()
    var body: some View {
        VStack{
            List{
                Section("Cats"){
                    ForEach(catApiService.cats, id: \.self){
                        cat in
                        VStack(alignment: .leading){
                            
                            Text(cat.name)
                        }
                    }
                }
            }
        }.onAppear{catApiService.fetchCats()}
            
        
    }
    
}


struct CatListView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView()
    }
}
