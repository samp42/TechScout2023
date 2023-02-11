//
//  TeamView.swift
//  ScoutInsights
//
//  Created by Domenico Valentino on 2023-02-11.
//

import SwiftUI

struct TeamView: View {
    @State var teamNum: String
    var body: some View {
        NavigationStack{
            VStack{
                Text("More info on team: " + teamNum)
            }
            .navigationTitle("Team " + teamNum)
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(teamNum: "3990")
    }
}
