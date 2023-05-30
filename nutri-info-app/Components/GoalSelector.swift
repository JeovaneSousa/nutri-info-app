//
//  GoalSelector.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 24/05/23.
//

import SwiftUI

struct GoalSelector: View {
    
    @Binding var value: Goals
    
    var body: some View {
        VStack {
            Picker("Goal Selector", selection: $value) {
                ForEach(Goals.allCases, id: \.self) {
                    Text($0.text)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .fontDesign(.serif)
                }
            }
            .pickerStyle(.wheel)
            
            .overlay(alignment: .trailing){
                Image(systemName: "chevron.up.chevron.down")
                    .resizable()
                    .frame(width: 15, height: 20)
                    .padding(.trailing,20)
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .clipShape(RoundedRectangle(cornerRadius:20).stroke(lineWidth:1))
            }
            .frame(height:90)
        }
    }
}

enum Goals: String, CaseIterable {
    case LOSS
    case MAINTENANCE
    case GAIN
    
    var text: String {
        switch self {
        case .LOSS: return "Weight loss"
        case .MAINTENANCE: return "Maintain weight"
        case .GAIN: return "Weight gain"
        }
    }
}

struct GoalSelector_Previews: PreviewProvider {
    static var previews: some View {
        let placeholder_binding = Binding {
            Goals.MAINTENANCE
        } set: { Value, Transaction in
            print()
        }

        GoalSelector(value: placeholder_binding)
    }
}
