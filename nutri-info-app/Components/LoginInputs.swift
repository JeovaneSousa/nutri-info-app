//
//  Views.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 19/05/23.
//

import SwiftUI

enum InputType {
    case USERNAME, PASSWORD
    
    var contents: (String, String){
        switch self {
        case .USERNAME:
            return ("USERNAME", "Your username goes in here")
            
        case .PASSWORD:
            return ("PASSWORD", "Your password goes in here")
        }
    }

}

struct LoginInputs: View {
    @Binding var value: String
    @State private var showPassword: Bool = false
    
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
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
            HStack{
                switch type {
                    
                case .USERNAME:
                    TextField(placeHolder, text: $value)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    
                case .PASSWORD:
                    if !showPassword {
                        SecureField(placeHolder, text: $value)
                    } else {
                        TextField(placeHolder, text: $value)
                    }
                    
                    Button("SHOW") {
                        showPassword.toggle()
                    }
                    .foregroundColor(.cyan)
                }
            }
            Rectangle()
                .frame(height:1)
                .foregroundColor(.secondary)
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

        LoginInputs(.USERNAME, placeHolderBinding )
    }
}
