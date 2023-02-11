//
//  ContentView.swift
//  HotProspects
//
//  Created by Denny Arfansyah on 09/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var prospects = Prospects()
    
    var body: some View {
        TabView {
            ProspectsView(fitlerType: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            ProspectsView(fitlerType: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            
            ProspectsView(fitlerType: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        .environmentObject(prospects)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
