//
//  HomeView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//

import SwiftUI


struct ProfilListView: View {
    
    @EnvironmentObject var viewModel : OwnerViewModel
    @State private var isDrawerOpen = false
    @EnvironmentObject var authService :
    FirebaseAuthService
    
    
    var body: some View {
            NavigationStack{
            
                    VStack{
                        List{
                            ForEach(viewModel.savedOwner, id:\ .self){ owner in
                                NavigationLink{
                                    ProfilDetailView(owner: owner)
                                }label: {
                                    ProfilSmallView(owner: owner)
                                }
                            }.onDelete{ indexSet in
                                viewModel.deleteOwner(owner: viewModel.savedOwner[indexSet.first!])
                                    
                            }
                        }
                    }
                    .navigationTitle("Profile")
            }
        }
    }
struct ProfilListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfilListView().environmentObject(OwnerViewModel())
                  .environmentObject(FirebaseAuthService())
    }
}
