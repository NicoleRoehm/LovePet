//
//  PetListView.swift
//  LovePet
//
//  Created by Nicole Röhm on 03.07.23.
//Bild von <a href="https://pixabay.com/de/users/openclipart-vectors-30363/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=150909">OpenClipart-Vectors</a> auf <a href="https://pixabay.com/de//?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=150909">Pixabay</a>//
//Bild von <a href="https://pixabay.com/de/users/edurs34-8516248/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=4888355">Eduardo • Subscribe to my YT Channel❤️</a> auf <a href="https://pixabay.com/de//?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=4888355">Pixabay</a>

import SwiftUI

struct PetSmallView: View {
    @StateObject var dogApiService = DogApiService()
    @StateObject var catApiService = CatApiService()
    
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: CatListView() ){
                    VStack{
                        
                        Text("Cats")
                            .foregroundColor(.blue)
                            .font(.title)
                            .padding(1)
                        Image("katzenbild")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding(15)
                    }
                }
                VStack{
                    
                    NavigationLink(destination: DogListView()){
                        VStack{
                            
                            Text("Dogs")
                                .foregroundColor(.blue)
                                .font(.title)
                                .padding(1)
                            Image("hundebild")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding(15)
                        }
                    }
                }
            }.navigationTitle("Animal breeds")
        }
    }
    }
struct PetSmallView_Previews: PreviewProvider {
    static var previews: some View {
        PetSmallView()
    }
}
