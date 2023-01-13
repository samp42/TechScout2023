//
//  RobotListView.swift
//  ScoutInsights
//
//  Created by Samuel Proulx on 2022-12-07.
//

import SwiftUI

struct TeamsView: View {
    @State private var searchedTeam: String = ""
    
    var body: some View {
        VStack {
            TextField("Search for a team", text: $searchedTeam)
            
            Text("Teams List")
        }
    }
}

struct PitScoutingListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
