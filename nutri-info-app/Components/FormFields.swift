//
//  FloatingForm.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//

import SwiftUI

enum FormType {
    case weight, height
    
    var contents: (String, String, String) {
        switch self {
        case .weight:
            return ("WEIGHT", "clipboard.fill", "Your weight in kilograms 'kg'")
        case .height:
            return ("HEIGHT","figure.wave.circle.fill", "Your height in meters 'm'")
        }
    }
}


struct FormFields: View {
    
    @Binding var value: Float
    let header: String
    let sfSymbol : String
    let placeholder: String

    init(formType: FormType, value: Binding<Float>) {
        _value = value
        self.header = formType.contents.0
        self.sfSymbol = formType.contents.1
        self.placeholder = formType.contents.2
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .foregroundColor(.primary)
                .fontWeight(.semibold)
                .padding(.leading)
                
            HStack{
                ZStack{

                    Circle()
                        .fill(Color.gradientColor)
                    Image(systemName: sfSymbol)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.primary)
                        
                }
                .frame(width: 60, height: 60)
                .padding(.leading, 5)
                
                TextField(placeholder, value: $value, format: .number)
                    .foregroundColor(.secondary)
                    .padding(.leading, 10)
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.clear)
                    .frame(height:70)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .clipShape(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1))
                    }
                    .shadow(radius: 10, x: 5, y: 5)
            }
        }
    }

}


struct FloatingForm_Previews: PreviewProvider {
    static var previews: some View {
        let placeholder_binding = Binding {
            Float(0)
        } set: { Value, Transaction in
            print()
        }
        FormFields(formType: .weight, value: placeholder_binding)
        }
        
}

