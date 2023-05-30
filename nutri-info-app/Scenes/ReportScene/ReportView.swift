//
//  ReportView.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 25/05/23.
//

import SwiftUI

struct ReportView: View {
    @EnvironmentObject var coordinator: Coordinator
    let report: Report
    
    init(report: Report) {
        self.report = report
    }
    
    var body: some View {

        VStack(spacing: 30) {
            Text("Nutritional Report")
                .font(.title)
                .fontWeight(.bold)
                .fontDesign(.serif)
            
            HStack(spacing: 40) {
                ReportFields(type: .weight, value: report.weight)
                ReportFields(type: .height, value: report.height)
            }
            HStack(spacing: 40) {
                ReportFields(type: .bmi, value: report.bmi)
                ReportFields(type: .bmiDiagnosis, value: nil, valueText: report.bmiDiagnosis)
            }
            HStack(spacing: 40) {
                ReportFields(type: .minIdealWeight, value: report.IdealWeightRange.minWeight)
                ReportFields(type: .maxIdealWeight, value: report.IdealWeightRange.maxWeight)
            }
            
            HStack(spacing: 40) {
                ReportFields(type: .calorieRequirement, value: Float(report.calorieIntakeRequirement))
                ReportFields(type: .waterRequirement, value: Float(report.waterRequirement))
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color.mainColor)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem (placement: .navigationBarLeading){
                Button {
                    coordinator.pop()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                   Image(systemName: "info.bubble")
                        .foregroundColor(.primary)
                }
            }
        }

    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(report: Report(name: "Jeovane", weight: 87, height: 1.75, goal: "LOSS", goalDescription: "Weight Loss", disclaimer: "lalalala", bmi: 27.6, bmiDiagnosis: "Overweight", IdealWeightRange: IdealWeightRange(minWeight: 76.5, maxWeight: 80.5), waterRequirement: 2300, calorieIntakeRequirement: 2200))
    }
}

