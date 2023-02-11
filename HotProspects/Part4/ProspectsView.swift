//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Denny Arfansyah on 11/02/23.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    @EnvironmentObject var prospects: Prospects
    let fitlerType: FilterType
    
    var title: String {
        switch fitlerType {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted People"
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    VStack (alignment: .leading) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    }
                }
            }
                .navigationTitle(title)
                .toolbar {
                    Button {
                        let prospect = Prospect()
                        prospect.name = "Denny Arfansyah"
                        prospect.emailAddress = "denny@gmail.com"
                        prospects.people.append(prospect)
                    } label: {
                        Label("Save", systemImage: "qrcode.viewfinder")
                    }
                }
        }
    }
    
    var filteredProspects: [Prospect] {
        switch fitlerType {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(fitlerType: .none)
            .environmentObject(Prospects())
    }
}
