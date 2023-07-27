//
//  SettingsView.swift
//  LovePet
//
//  Created by Nicole Röhm on 25.07.23.
//

import SwiftUI

struct SettingsView: View {
    
    @State var notification : Bool = false
      @State var darkMode : Bool = false
      @State var brightness: Float = 0
    
    var body: some View {
        NavigationStack{
            Form(){
                Section(header: Text("Settings").font(.title).foregroundColor(.black)){}
                
                Section(header: Text("NOTIFICATIONS"))
                {
                    Toggle("Enable Notifications", isOn: $notification)
                }
                Section(header: Text("APPEARANCE")){
                    Toggle("Dark Mode", isOn: $darkMode)
                    Slider(value:$brightness, in: 0...100){
                        Text("Slider")
                    }minimumValueLabel: {
                        Text("Brightness")
                    }maximumValueLabel: {
                        Text("")
                    }
                    
                    
                }
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
