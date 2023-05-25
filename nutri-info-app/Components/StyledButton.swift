//
//  StyledButton.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 24/05/23.
//

import SwiftUI

struct StyledButton: View {
    
    let action: (() -> Void)
    
    init(action: @escaping (() -> Void)) {
        self.action = action
    }
    var body: some View {
        Button(action: action) {
            Text("Go in")
                .foregroundColor(.primary)
                .frame(width: UIScreen.main.bounds.width / 1.5,
                       height: 50)
                .background(Color.actionColor)
                .cornerRadius(12)
        }
    }
}

struct StyledButton_Previews: PreviewProvider {
    static var previews: some View {
        StyledButton {
            
        }
    }
}
