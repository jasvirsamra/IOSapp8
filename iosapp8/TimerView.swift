//
//  TimerView.swift
//  iosapp8
//
//  Created by Jasvir on 2025-03-20.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 60
    @State private var timerActive = false
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Text("\(timeRemaining) sec")
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
        if timeRemaining > 0 {
            timerActive = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    stopTimer()
                }
            }
        }
    }

    func stopTimer() {
        timerActive = false
        timer?.invalidate()
    }

    func resetTimer() {
        stopTimer()
        timeRemaining = 60
    }
}

