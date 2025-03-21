//
//  StopwatchView.swift
//  iosapp8
//
//  Created by Jasvir on 2025-03-20.
//

import SwiftUI

struct StopwatchView: View {
    @State private var timeElapsed: TimeInterval = 0
    @State private var timerActive = false
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Text(timeString(timeElapsed))
                .font(.largeTitle)
                .padding()
            
            HStack {
                Button(timerActive ? "Pause" : "Start") {
                    if timerActive {
                        stopTimer()
                    } else {
                        startTimer()
                    }
                }
                .buttonStyle(BorderedButtonStyle())
                
                Button("Reset") {
                    resetTimer()
                }
                .buttonStyle(BorderedButtonStyle())
            }
        }
    }

    func startTimer() {
        timerActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            timeElapsed += 1
        }
    }

    func stopTimer() {
        timerActive = false
        timer?.invalidate()
    }

    func resetTimer() {
        stopTimer()
        timeElapsed = 0
    }

    func timeString(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

