//
//  HomeView.swift
//  LovePet
//
//  Created by Nicole Röhm on 26.06.23.
//

import SwiftUI


struct HomeView: View {
    
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
                    }
                }
                
                .toolbar {
                    ToolbarItem {
                            Button(
                                action: {NavigationLink("Settings", destination: SettingsView())},
                                label: {Label ("Settings",
                                               systemImage: "gearshape")
                                }
                            )
                        
                    }
                    ToolbarItem{
                        Button(
                            action:{authService.signOut()},
                        label: {Label("LogOut",
                                      systemImage: "rectangle.portrait.and.arrow.right")})
                    }
                }
                
                            
            }
            .navigationTitle("Profile")
                
                
            }
      
            
        }
    }


struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        //HomeView()
        HomeView().environmentObject(OwnerViewModel())
                  .environmentObject(FirebaseAuthService())
    }
}
