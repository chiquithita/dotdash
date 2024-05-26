//
//  haptics.swift
//  dotdash Watch App
//
//  Created by Elizabeth Chiquithita Bunga Ariona Chriska on 20/05/24.
//

import SwiftUI
import WatchKit

func playHaptic(_ type: WKHapticType) {
    WKInterfaceDevice.current().play(type)
}

func handleTextChange(_ text: String) {
    // Trigger haptic feedback when text length is exactly 5 characters
    if text.count == 5 {
        playHaptic(.success)
    }
}
