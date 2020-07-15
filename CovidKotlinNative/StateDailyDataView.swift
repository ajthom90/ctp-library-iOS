//
//  StateDailyDataView.swift
//  CovidKotlinNative
//
//  Created by ajthom90 on 7/14/20.
//

import SwiftUI
import CovidTrackingShared

struct StateDailyDataView: View {
    var state: StateData
    var daily: StateDailyData
    
    var body: some View {
        VStack {
            HStack {
                Text("Postive Cases")
                Spacer()
                Text("\(daily.positive ?? 0)")
            }.padding([.trailing, .leading], 10)
            Spacer()
        }.navigationBarTitle("\(state.state) – \(daily.formattedDate())")
    }
}

struct StateDailyDataView_Previews: PreviewProvider {
    static var previews: some View {
        StateDailyDataView(state: StateData(state: "MN", dailyData: []), daily: StateDailyData(date: "20200714", state: "MN", positive: 2, negative: 4, pending: 4, hospitalizedCurrently: nil, hospitalizedCumulative: nil, inIcuCurrently: nil, inIcuCumulative: nil, onVentilatorCurrently: nil, onVentilatorCumulative: nil, recovered: nil, dataQualityGrade: nil, lastUpdateEt: nil, dateModified: nil, checkTimeEt: nil, death: nil, hospitalized: nil, dateChecked: nil, totalTestsViral: nil, positiveTestsViral: nil, negativeTestsViral: nil, positiveCasesViral: nil, deathConfirmed: nil, deathProbable: nil, fips: "27", positiveIncrease: 7, negativeIncrease: 4, total: 11, totalTestResults: 23, totalTestResultsIncrease: 32, posNeg: 107, deathIncrease: 42, hospitalizedIncrease: nil, hash: "hash", commercialScore: 12, negativeRegularScore: 12, negativeScore: 12, positiveScore: 2, score: 7, grade: ""))
    }
}
