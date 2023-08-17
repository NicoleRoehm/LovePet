//
//  ProfilView.swift
//  LovePet
//
//  Created by Nicole Röhm on 14.07.23.
//
// 

import SwiftUI

struct ProfilDetailView: View {
    @EnvironmentObject var viewModel : OwnerViewModel
    var owner: Owner
    @State var isDrawerOpen = false
    @AppStorage("UserId") var userId = ""
    
    var body: some View {
            NavigationStack{
                ZStack{
                    Color.mint.opacity(0.2)
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
                        VStack{
                            Form{
                                Section("Pets"){
                                }
                            }
                            
                        }
                                
                        }
                    }
                    .navigationTitle("Profil")
                }
            }
        }

struct ProfilDetailView_Previews: PreviewProvider {
    static var viewModel = OwnerViewModel()
    static var previews: some View {
        ProfilDetailView(owner: viewModel.savedOwner.first!)
                        .environmentObject(OwnerViewModel())
                        .environmentObject(FirebaseAuthService())
    }
}
  
