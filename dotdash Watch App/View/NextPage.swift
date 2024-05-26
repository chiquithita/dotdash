import SwiftUI

struct NextPage: View {
    var inputText: String
    @State private var currentCharacter = Character(" ")
    @State private var currentIndex: Int = 0
    @State private var timer: Timer?
    @State private var animate = false
    
    var body: some View {
        
        ZStack {
//             Background image
            Image("background2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 8) {
                Spacer()
                Spacer()
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 50, height: 40)
                                .foregroundColor(.color1)
                                .opacity(1.0)
                            Text(String(currentCharacter))
                                .foregroundColor(.color3)
                                .bold()
                                .font(.system(size: 22))
                        }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 40)
                            .foregroundColor(.color1)
                            .opacity(1.0)
                            .overlay(
                                Text(morseCode[currentCharacter] ?? "")
                                    .foregroundColor(.color3)
                                    .bold()
                                    .font(.system(size: 22))
                                    .kerning(4.0)
                            )
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 160, height: 40)
                            .foregroundColor(.color2)
                            .opacity(0.8)
                        Text(inputText)
                    }
                }
                
                HStack {
                    Spacer()
                    Image(systemName: "repeat")
                        .font(.system(size: 24))
                        .symbolEffect(.bounce, value: animate)
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                animate.toggle()
                            }
                                restartMorseDisplay()
                            
                        }
                }
                .padding(.bottom, 30)
                .padding(.top, 20)
            }
        }
        .onAppear {
            startMorseHaptics()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    // Function to trigger haptic feedback for Morse code
    func playMorseHaptics(for text: String, callback: @escaping (String) -> Void ){
        let morse = stringToMorse(text)
        let hapticDevice = WKInterfaceDevice.current()
        let morseCharacters = Array(morse)
        
        let textArray = Array(text)
        var indexText = 0
        
        for (index, char) in morseCharacters.enumerated() {
            callback(String(textArray[indexText]))
            switch char {
            case ".":
                hapticDevice.play(.start) // Stronger haptic for dot
                usleep(750_000) // 0.75 second
            case "-":
                hapticDevice.play(.success) // Stronger haptic for dash
                usleep(750_000) // 0.75 second
            case " ":
                if index + 1 < morseCharacters.count && morseCharacters[index + 1] == " " {
                    if index + 2 < morseCharacters.count && morseCharacters[index + 2] == " " {
                        // Add a longer pause between words (3 spaces detected)
                        usleep(500_000) // 1.5 seconds
                        continue
                    }
                    // Skip additional spaces between words
                    continue
                } else {
                    // Add a pause between letters
                    usleep(500_000) // 1 second
                    indexText += 1
                }
            default:
                break
            }
        }
    }
    
    func startDisplayingCharacters() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if currentIndex < inputText.count {
                let index = inputText.index(inputText.startIndex, offsetBy: currentIndex)
                currentCharacter = inputText[index]
                currentIndex += 1
            } else {
                timer?.invalidate()
            }
        }
    }

    func startMorseHaptics() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            playMorseHaptics(for: inputText) { value in
                DispatchQueue.main.async {
                    currentCharacter = Character(value)
                }
                print("value: \(value)")
            }
        }
    }
    
    func restartMorseDisplay() {
        timer?.invalidate()
        currentIndex = 0
        startMorseHaptics()
    }
}

struct NextPage_Previews: PreviewProvider {
    static var previews: some View {
        NextPage(inputText: "Test")
    }
}
