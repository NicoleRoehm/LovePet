//
//  AddPetView.swift
//  LovePet
//
//  Created by Nicole Röhm on 03.07.23.
//

import SwiftUI

struct AddPetView: View {
    @StateObject var viewModel1 = DogApiService()
    @StateObject var viewModel2 = CatApiService()
    @State var name :String
    @State var race :String
    @State var age :String
    @State var gender :String
    @State var description :String
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Name")){
                    TextField("Name", text: $name)
                }
                Section(header: Text("Race")){
                    TextField("Race", text: $race)
                    
                }
                Section(header: Text("Age")){
                    TextField("Age", text: $age)}
                Section(header: Text("Gender")){
                    TextField("Gender", text: $gender)}
                Section(header: Text("description")){
                    TextField("Description", text:$description)}
                  
            }
        }
    }
}


struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView(name: "", race: "", age: "", gender: "", description: "")
    }
}
