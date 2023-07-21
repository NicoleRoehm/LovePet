//
//  HomeView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var viewModel2 = OwnerViewModel()
    @State private var isDrawerOpen = false
    @EnvironmentObject var authService :
    FirebaseAuthService
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(viewModel2.savedOwner, id:\ .self){ owner in
                        NavigationLink{
                            ProfilDetailView(owner: owner)
                        }label: {
                            ProfilSmallView(owner: owner)
                        }
                    }
                    
                }
                .toolbar {
                    ToolbarItem {
                        Button(
                            action: {},
                            label: {Label ("Menu",
                                           systemImage: "gearshape") }
                        )
                    }
                }
            }
                .navigationTitle("Profile")
                
                
            }
      
            
        }
    }


struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        //HomeView().environmentObject(FirebaseAuthService())
        HomeView(viewModel2: OwnerViewModel())
    
    }
}
