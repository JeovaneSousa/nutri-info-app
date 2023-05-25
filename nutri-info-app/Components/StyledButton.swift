//
//  StyledButton.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 24/05/23.
//

import SwiftUI

struct StyledButton: View {
    let text: String
    let action: (() -> Void)
    let isEnabled: Bool
    
    init(withText text: String, isEnabled:Bool, action: @escaping (() -> Void)) {
        self.action = action
        self.isEnabled = isEnabled
        self.text = text
    }
    var body: some View {
        VStack {
            Button(action: action) {
                Text(text)
                    .foregroundColor(.primary)
                    .frame(width: UIScreen.main.bounds.width / 1.5,
                           height: 50)
                    .background(Color.actionColor)
                    .cornerRadius(12)
            }
        }
    }
}

struct StyledButton_Previews: PreviewProvider {
    static var previews: some View {
        StyledButton(withText: "Yea!",isEnabled: false) {
            
        }
    }
}
