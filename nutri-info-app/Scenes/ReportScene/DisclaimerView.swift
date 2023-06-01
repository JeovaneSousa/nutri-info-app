//
//  DisclaimerView.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 31/05/23.
//

import SwiftUI

struct DisclaimerView: View {
    let report: Report
    
    var body: some View {
        VStack (spacing: 30){
            Text(report.disclaimer)
                .font(.headline)
                .fontDesign(.serif)
                .fontWeight(.semibold)
            
            HStack{
                Spacer()
                Text("'Your favorite Dev Nutri.'")
                    .fontWeight(.ultraLight)
                    .fontDesign(.serif)
            }
        }
        .padding(30)
        .background(Color.mainColor)
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView(report: Report(name: "Jeovane", weight: 87, height: 1.75, goal: "LOSS", goalDescription: "Weight Loss", disclaimer: "The water requirement may change due to temperature, sweat rate, umidity, amongst other factors.\nThere is a need to consider other factors for the calorie requirement such as daily activities and exercise routines.\nThe calorie restriction or surplus should not go above 600kcal a day.\nThe BMI and ideal weight should be analyzed with caution. Remember, BMI does not take into consideration what is muscle mass and what is fat, only body weight as a whole.\nThis API was created for study purpose only, although it uses real nutrition calculation formulas, it shouldn`t be used in a clinic setting or for treatment without a supervising professional.", bmi: 27.6, bmiDiagnosis: "Overweight", IdealWeightRange: IdealWeightRange(minWeight: 76.5, maxWeight: 80.5), waterRequirement: 2300, calorieIntakeRequirement: 2200))
    }
}
