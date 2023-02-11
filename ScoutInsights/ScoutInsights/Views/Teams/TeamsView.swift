//
//  RobotListView.swift
//  ScoutInsights
//
//  Created by Samuel Proulx on 2022-12-07.
//

import SwiftUI

struct TeamsView: View {
    //https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data
    let teamNums = ["3990", "3986", "3550", "3996", "3360"]
    
    @State private var searchedTeam: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { teamNum in
                    NavigationLink {
                        TeamView(teamNum: teamNum)
                    } label: {
                        Text(teamNum)
                    }
                }
            }.navigationTitle("Teams")
        }.searchable(text: $searchedTeam, prompt: "Search for a Team")
        
    }
    
    var searchResults: [String] {
        if searchedTeam.isEmpty {
            return teamNums
        } else {
            return teamNums.filter { $0.contains(searchedTeam) }
        }
    }
}

struct PitScoutingListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
