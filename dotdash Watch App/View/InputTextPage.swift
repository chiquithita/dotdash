import SwiftUI

struct InputTextPage: View {
    @State private var inputText: String = ""

    var body: some View {
        NavigationStack {
            ZStack{
                Image("background2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    TextField("Enter text", text: $inputText)
                        .padding()
                        .background(Color.gray.opacity(0))
                        .cornerRadius(8)
                        .onChange(of: inputText) { newValue in
                            handleTextChange(newValue)
                        }
                    
                    NavigationLink(destination: NextPage(inputText: inputText)) {
                        Text("Morse Code")
                            .font(.headline)
                            .padding()
                            .background(Color.color1)
                            .opacity(1.0)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
            }
        }
    }

    func handleTextChange(_ text: String) {
    }
}

struct InputTextPage_Preview: PreviewProvider {
    static var previews: some View {
        InputTextPage()
    }
}
