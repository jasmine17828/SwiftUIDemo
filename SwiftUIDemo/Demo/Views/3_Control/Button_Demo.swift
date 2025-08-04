import SwiftUI

struct Button_Demo: View {
    @State private var isPressed=false
    var body: some View {
        Button {
            isPressed.toggle()
            // save book to favorites
        } label: {
            Label("Add to Favorites", systemImage: isPressed ? "heart.fill" : "heart")
                .foregroundColor(isPressed ? .yellow : .red)
                .padding()
                .background(.black, in: Capsule())
        }
    }
}

struct CustomButton: View {
    @State private var isPressed=false
    var body: some View {
        Button {
            print("button tapped")
            isPressed.toggle()
        } label: {
            Text("Tap me")
                .foregroundStyle(isPressed ? .red : .green)
        }
    }
}

#Preview {
    Button_Demo()
}
