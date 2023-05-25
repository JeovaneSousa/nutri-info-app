//
//  Color.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 24/05/23.
//

import SwiftUI

extension Color {
    static var mainColor = Color.init("MainColor")
    static var subColor = Color.init("SubColor")
    static var actionColor = Color.init("ActionColor")
    static var backgroundColor = Color.init("BackgroundColor")
    static var gradientColor = LinearGradient(colors: [.mainColor,.subColor,.actionColor], startPoint: .topLeading, endPoint: .bottomTrailing)
}
