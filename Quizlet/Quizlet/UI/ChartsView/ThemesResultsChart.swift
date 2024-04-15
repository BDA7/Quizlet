//
//  ChartsView.swift
//  Quizlet
//
//  Created by Данила Бондаренко on 15.04.2024.
//

import SwiftUI
import Charts

struct ThemesResultsChart: View {
    let resultsModels: [QuestionResultModel]
    
    var body: some View {
        Chart {
            ForEach(resultsModels) { resultModel in
                BarMark(
                    x: .value("Theme Name", resultModel.themeName),
                    y: .value(resultModel.userName, resultModel.finalScore)
                )
                .foregroundStyle(resultModel.finalScore > 0.5 ? .green : .red)
                .annotation(position: .top) {
                    Text(resultModel.themeName)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                }
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartScrollPosition(initialX: 30)
        .chartLegend(position: .bottom, alignment: .leading)
        .chartYAxis(.visible)
        .foregroundStyle(.black)
    }
}

#Preview {
    ThemesResultsChart(
        resultsModels: [
            QuestionResultModel(finalScore: 0.93, themeName: "UIKit", userName: "danyxw"),
            QuestionResultModel(finalScore: 0.72, themeName: "SwiftUI", userName: "danyxw"),
            QuestionResultModel(finalScore: 0.32, themeName: "Bounds and Frame", userName: "danyxw"),
            QuestionResultModel(finalScore: 0.54, themeName: "SwiftUI lifecycle", userName: "danyxw"),
            QuestionResultModel(finalScore: 0.10, themeName: "View Controller lifecycle", userName: "danyxw"),
        ]
    )
}
