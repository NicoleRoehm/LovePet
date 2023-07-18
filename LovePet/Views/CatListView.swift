//
//  PetListView.swift
//  LovePet
//
//  Created by Nicole Röhm on 17.07.23.
//

import SwiftUI

struct CatListView: View {
    @StateObject var viewModel2 = CatApiService()
    @StateObject var viewModel3 = OwnerViewModel()
    var body: some View {
        VStack{
            List{
                ForEach(viewModel2.cats, id: \.self){
                    cat in
                    VStack(alignment: .leading){
                        
                        Text(cat.name)
                    }
                }
            }
        }.onAppear{viewModel2.fetchCats()}
            
        
    }
    
}


struct CatListView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView()
    }
}
