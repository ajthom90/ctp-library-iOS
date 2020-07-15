//
//  ContentView.swift
//  CovidKotlinNative
//
//  Created by ajthom90 on 7/14/20.
//

import SwiftUI
import CovidTrackingShared

struct StateListView: View {
    var fetcher = DailyDataFetcher()
    @State var data: [StateData] = []
    @State var dataLoaded = false
    
    var body: some View {
        NavigationView {
            List {
                if (!dataLoaded) {
                    Text("Loading...")
                }
                else {
                    ForEach(data, id: \.state) { state in
                        NavigationLink(
                            destination: StateDataView(state: state),
                            label: {
                                HStack {
                                    Text(stateNameMap[state.state] ?? state.state)
                                    Spacer()
                                    Text("\(state.dailyData[0].positive ?? 0)")
                                }
                            })
                    }
                }
            }.navigationBarTitle("States")
        }.onAppear {
            fetcher.getDailyData { (data) in
                DispatchQueue.main.async {
                    self.data = data
                    self.dataLoaded = true
                }
            }
        }
    }
}

struct StateListView_Previews: PreviewProvider {
    static var previews: some View {
        StateListView()
    }
}

let stateNameMap = ["MN": "Minnesota", "AK": "Alaska", "AL": "Alabama", "AR": "Arkansas", "AS": "American Samoa", "AZ": "Arizona", "CA": "California",
                    "CO": "Colorado", "CT": "Connecticut", "DC": "District of Columbia", "DE": "Delaware", "FL": "Florida", "GA": "Georgia",
                    "GU": "Guam", "HI": "Hawaii", "IA": "Iowa", "ID": "Idaho", "IL": "Illinois", "IN": "Indiana", "KS": "Kansas", "KY": "Kentucky",
                    "LA": "Louisiana", "MA": "Massachusetts", "MD": "Maryland", "ME": "Maine", "MI": "Michigan", "MO": "Missouri", "MP": "Northern Mariana Islands",
                    "MS": "Mississippi", "MT": "Montana", "NC": "North Carolina", "ND": "North Dakota", "NE": "Nebraska", "NH": "New Hampshire", "NJ": "New Jersey",
                    "NM": "New Mexico", "NV": "Nevada", "NY": "New York", "OH": "Ohio", "OK": "Oklahoma", "OR": "Oregon", "PA": "Pennsylvania",
                    "PR": "Puerto Rico", "RI": "Rhode Island", "SC": "South Carolina", "SD": "South Dakota", "TN": "Tennessee", "TX": "Texas", "UT": "Utah",
                    "VA": "Virginia", "VI": "Virgin Islands", "VT": "Vermont", "WA": "Washington", "WI": "Wisconsin", "WV": "West Virginia", "WY": "Wyoming"]
                                    
