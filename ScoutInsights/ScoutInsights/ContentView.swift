//
//  ContentView.swift
//  ScoutInsights
//
//  Created by Samuel Proulx on 2022-12-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TeamsView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Teams")
                }
            ScheduleView()
                .tabItem {
                    Image(systemName: "calendar.day.timeline.left")
                    Text("Schedule")
                }
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Statistics")
                }
            PickListView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Pick List")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro")
        
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
            .previewDevice("iPad Pro (11-inch) (4th generation)")
        
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
    }
}
