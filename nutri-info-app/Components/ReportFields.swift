//
//  ReportFields.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 29/05/23.
//

import SwiftUI

struct ReportFields: View {
    let title: String
    let measurementType: String
    let value: Float?
    let valueText: String?
    
    init(type: FieldType, value: Float?, valueText: String? = nil) {
        self.title = type.content.0
        self.measurementType = type.content.1
        self.value = value
        self.valueText = valueText
    }
    
    var body: some View {
            RoundedRectangle(cornerRadius: 16)
            .fill(Color.gradientColor)
            .frame(width: 150, height: 160)
            .overlay {
                VStack(spacing: 20) {
                    Text(self.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    if let value = self.value {
                        Text(value, format: .number)
                            .font(.title)
                    } else {
                        Text(self.valueText!)
                            
                    }
                    Text(self.measurementType)
                        .fontWeight(.ultraLight)
                }
            }
            .shadow(radius: 10)
    }
}

enum FieldType {
    case weight,height,goalDescription,bmi,bmiDiagnosis,minIdealWeight,maxIdealWeight,waterRequirement,calorieRequirement
    
    var content: (String, String) {
        switch self {
        case .weight:
            return ("Weight", "Kilograms: kg")
        case .height:
            return ("Height", "Meters: m")
        case .bmi:
            return ("Body Mass Index", "kg/h**2")
        case .bmiDiagnosis:
            return ("Body Mass Index Diagnosis", "")
        case .goalDescription:
            return ("Body weight goal", "")
        case .minIdealWeight:
            return ("Min Ideal Range", "Kilograms: kg")
        case .maxIdealWeight:
            return ("Max Ideal Range", "Kilograms: kg")
        case .calorieRequirement:
            return ("Calorie Daily Requirement", "Kilocalories: Kcal")
        case .waterRequirement:
            return ("Water Daily Requirement", "Milliiters: ml")
        }
    }
}

struct ReportFields_Previews: PreviewProvider {
    static var previews: some View {
        ReportFields(type: .calorieRequirement, value: 2500, valueText: nil)
    }
}
