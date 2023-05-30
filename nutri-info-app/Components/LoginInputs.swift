//
//  Views.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 19/05/23.
//

import SwiftUI

struct LoginInputs: View {
    @Binding var value: String
    
    private var header: String
    private var placeHolder:String
    private var type: InputType
    
    
    init (_ type: InputType, _ valueBind: Binding<String>) {
        _value = valueBind
        self.header = type.contents.0
        self.placeHolder = type.contents.1
        self.type = type
    }

    
    var body: some View {
        VStack(alignment:.leading){
            Text(header)
                .foregroundColor(.primary)
                .fontWeight(.medium)
            
            HStack{
                TextField(placeHolder, text: $value)
                    .foregroundColor(.secondary)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
            }
            Rectangle()
                .frame(height:1)
                .foregroundColor(.secondary)
        }
    }
}

enum InputType {
    case NAME, PROFILEURI
    
    var contents: (String, String){
        switch self {
        case .NAME:
            return ("NAME *", "How do you wanna be called?")
            
        case .PROFILEURI:
            return ("PROFILE URL", "Your photo's link")
        }
    }

}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let placeHolderBinding = Binding {
            ""
        } set: { Value, Transaction in
            print()
        }

        LoginInputs(.NAME, placeHolderBinding )
    }
}
