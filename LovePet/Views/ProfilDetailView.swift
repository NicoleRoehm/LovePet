//
//  ProfilView.swift
//  LovePet
//
//  Created by Nicole Röhm on 14.07.23.
//

import SwiftUI

struct ProfilDetailView: View {
    @StateObject var viewModel2 = OwnerViewModel()
    @Binding var isDrawerOpen: Bool
    @State var name :String
    @State var race :String
    @State var age :String
    @State var gender :String
    @State var descriptions :String
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.blue.opacity(0.7)
                VStack{
                    
                    
                    ForEach(viewModel2.savedOwner, id:\.self){ owner in
                        
                        VStack{
                            HStack(alignment: .center){
                                
                                
                                Image(owner.image!)
                                    .resizable()
                                    .frame(width: 125, height: 125)
                                Text(owner.name!)
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .bold()
                            }
                        }
                    }
                    
                    VStack{
                        Form{
                            Section("Pets"){
                                ForEach(viewModel2.savedPets){ pet in
                                    
                                    NavigationLink{
                                        PetsView()
                                    }label: {
                                        CatAndDogSmallView(pet: pet)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}



struct ProfilDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilDetailView(isDrawerOpen: .constant(true), name: "", race: "", age: "", gender: "", descriptions: "")
    }
}
