//
//  ColorSettingsView.swift
//  iosapp8
//
//  Created by Jasvir on 2025-03-20.
//

import SwiftUI

struct ColorSettingsView: View {
    @AppStorage("themeColor") private var themeColorHex: String = "#0000FF" // Default Blue

    var body: some View {
        VStack {
            Text("Select Theme Color")
                .font(.headline)
                .padding()

            HStack {
                ColorButton(color: .blue, hex: "#0000FF")
                ColorButton(color: .green, hex: "#00FF00")
                ColorButton(color: .red, hex: "#FF0000")
                ColorButton(color: .yellow, hex: "#FFFF00")
            }
        }
    }
}

struct ColorButton: View {
    var color: Color
    var hex: String
    @AppStorage("themeColor") private var themeColorHex: String = "#0000FF"

    var body: some View {
        Button(action: {
            themeColorHex = hex
        }) {
            Circle()
                .fill(color)
                .frame(width: 40, height: 40)
                .overlay(
                    Circle().stroke(Color.white, lineWidth: themeColorHex == hex ? 3 : 0)
                )
        }
    }
}

// Helper function to convert HEX to Color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}

// Apply the saved color
extension View {
    func themedBackground() -> some View {
        let storedColor = Color(hex: UserDefaults.standard.string(forKey: "themeColor") ?? "#0000FF")
        return self.background(storedColor)
    }
}

