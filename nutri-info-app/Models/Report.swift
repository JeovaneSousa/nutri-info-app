//
//  Report.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 25/05/23.
//


struct Report: Codable, Hashable {
    
    let name: String
    let weight: Float
    let height: Float
    let goal: String
    let goalDescription: String
    let disclaimer: String
    let bmi: Float
    let bmiDiagnosis: String
    let IdealWeightRange: IdealWeightRange
    let waterRequirement: Int
    let calorieIntakeRequirement: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case weight
        case height
        case goal
        case disclaimer
        case bmi
        case goalDescription = "goal_description"
        case bmiDiagnosis = "bmi_diagnosis"
        case IdealWeightRange = "ideal_weight_range"
        case waterRequirement = "water_requirement"
        case calorieIntakeRequirement = "calorie_intake_requirement"
    }

}

struct IdealWeightRange:  Codable, Hashable {
    let minWeight: Float
    let maxWeight: Float
    
    enum CodingKeys: String, CodingKey {
        case minWeight = "min_weight"
        case maxWeight = "max_weight"
    }
}
