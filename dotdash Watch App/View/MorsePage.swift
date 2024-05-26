//
//  morsePage.swift
//  dotdash Watch App
//
//  Created by Elizabeth Chiquithita Bunga Ariona Chriska on 20/05/24.
//

//
//  MorsePage.swift
//  dotdash Watch App
//
//  Created by Elizabeth Chiquithita Bunga Ariona Chriska on 20/05/24.
//

import SwiftUI
import WatchKit
import AVFoundation

struct MorsePage: View {
    @State private var isRecording: Bool = false
    @State private var inputText: String = ""
    @State private var showNextPage: Bool = false
    @Binding var moveToNextPage:Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    inputText = ""
                    isRecording = false
                }) {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.grayIcon)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing)
            }
            .padding(.top, -10)
            Spacer()
            Button(action: {
                isRecording.toggle()
                if isRecording {
                    startRecording()
                } else {
                    stopRecording()
                }
            })
            
            {
                Image(systemName: "mic.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundColor(.orangeIcon)
                    .scaleEffect(isRecording ? 1.2 : 1.0)
                    .animation(
                        isRecording
                        ? Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)
                        : .default
                    )
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
            Spacer()
        }
        .padding()
        .background(
            NavigationLink(
                destination: NextPage(inputText: inputText),
                isActive: $showNextPage,
                label: { }
            )
            .buttonStyle(PlainButtonStyle())
        )
    }

    func startRecording() {
        // Mulai rekaman dan konversi ke teks di sini
        // Simulasi mulai rekaman
        WKInterfaceDevice.current().play(.start)
    }

    func stopRecording() {
        // Simulasi menghentikan rekaman
        WKInterfaceDevice.current().play(.stop)

        // Misalnya kita dapatkan teks berikut setelah rekaman
        let recordedText = "Contoh teks setelah rekaman"
        inputText = recordedText
        showNextPage = true
        moveToNextPage = showNextPage
    }
}

struct MorsePage_Previews: PreviewProvider {
    static var previews: some View {
        MorsePage(moveToNextPage: .constant(false))
    }
}
