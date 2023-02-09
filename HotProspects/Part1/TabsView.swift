//
//  TabsView.swift
//  HotProspects
//
//  Created by Denny Arfansyah on 09/02/23.
//

import SwiftUI

struct TabsView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
            
            Text("Tab 2")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
