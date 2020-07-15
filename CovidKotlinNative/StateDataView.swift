//
//  StateDataView.swift
//  CovidKotlinNative
//
//  Created by ajthom90 on 7/14/20.
//

import SwiftUI
import CovidTrackingShared

struct StateDataView: View {
    var state: StateData
    
    var body: some View {
        List(state.dailyData, id: \.date) { daily in
            NavigationLink(destination: StateDailyDataView(state: state, daily: daily)) {
                Text("\(daily.formattedDate())")
            }
        }.navigationBarTitle(stateNameMap[state.state] ?? state.state)
        .navigationTitle(stateNameMap[state.state] ?? state.state)
    }
}

struct StateDataView_Previews: PreviewProvider {
    static var previews: some View {
        StateDataView(state: StateData(state: "MN", dailyData: []))
    }
}
