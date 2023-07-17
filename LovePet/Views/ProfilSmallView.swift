//
//  ProfilListView.swift
//  LovePet
//
//  Created by Nicole Röhm on 14.07.23.
//

import SwiftUI

struct ProfilSmallView: View {
    @StateObject var viewModel = OwnerViewModel()
    var body: some View {
        
        HStack{
            
            HStack{
                
                
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding()
                
                
            }
        }
    }
}

struct ProfilSmallView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ProfilSmallView()
        
    }
}
