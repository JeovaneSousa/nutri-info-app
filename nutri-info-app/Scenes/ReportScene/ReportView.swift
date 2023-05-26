//
//  ReportView.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 25/05/23.
//

import SwiftUI

struct ReportView: View {
    let report: Report
    
    init(report: Report) {
        self.report = report
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(report: Report(name: "Jeovane", weight: 87, height: 1.75, goal: "LOSS", goalDescription: "Weight Loss", disclaimer: "lalalala", bmi: 27.6, bmiDiagnosis: "Overweight", IdealWeightRange: IdealWeightRange(minWeight: 76.5, maxWeight: 80.5), waterRequirement: 2300, calorieIntakeRequirement: 2200))
    }
}
