//
//  ProfilListView.swift
//  LovePet
//
//  Created by Nicole Röhm on 14.07.23.
//

import SwiftUI

struct ProfilSmallView: View {
    var owner: Owner
    var body: some View {
        HStack{
                
                Text(owner.name!)
                    .font(.title)
                    .padding()
                
                Spacer()
                
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding()
        }
    }
}

struct ProfilSmallView_Previews: PreviewProvider {
    
    static var viewModel = OwnerViewModel()
    static let owners = Owner.fetchRequest()
    
    static var previews: some View {
        ProfilSmallView(owner: viewModel.savedOwner.first!)

        
    }
}
