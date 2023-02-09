//
//  EnvironmentObjectView.swift
//  HotProspects
//
//  Created by Denny Arfansyah on 09/02/23.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Denny Arfansyah"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct EnvironmentObjectView: View {
    @StateObject private var user = User()
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct EnvironmentObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
