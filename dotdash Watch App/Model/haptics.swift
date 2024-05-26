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
    
    if text.count == 5 {
        playHaptic(.success)
    }
}
