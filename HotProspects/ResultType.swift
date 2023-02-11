//
//  ResultType.swift
//  HotProspects
//
//  Created by Denny Arfansyah on 10/02/23.
//

import SwiftUI

struct ResultType: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReading()
            }
    }
    
    func fetchReading() async {
        let fetchRequst = Task{() -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchRequst.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let err):
            output = err.localizedDescription
        }
    }
}

struct ResultType_Previews: PreviewProvider {
    static var previews: some View {
        ResultType()
    }
}
