//
//  AddPetView.swift
//  LovePet
//
//  Created by Nicole Röhm on 03.07.23.
//

import SwiftUI

struct AddPetView: View {
    @StateObject var viewModel1 = DogApiViewModel()
    @StateObject var viewModel2 = CatApiViewModel()
    @State var name = ""
    @State var race = ""
    @State var age = ""
    @State var gender = ""
    @State var description = ""
    
    var body: some View {
        VStack{
            
                TextField("Name", text: $name)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                TextField("Race", text: $race)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                TextField("Age", text: $age)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                TextField("Gender", text: $gender)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                TextField("Description", text:$description)
                    .padding()
                    .textFieldStyle(.roundedBorder)
            
            
        }
        
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView()
    }
}
