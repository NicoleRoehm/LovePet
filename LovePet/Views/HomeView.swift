//
//  HomeView.swift
//  LovePet
//
//  Created by Nicole Röhm on 07.08.23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel : OwnerViewModel
    @State var name = ""
    var body: some View {
        Text("Welcome")
        
        Button("Person"){
            viewModel.savedOwner.first!.id!
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
