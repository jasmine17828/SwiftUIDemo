import SwiftUI

struct Tap_Demo: View {
    @State private var isTapped: Bool = false
    @State private var isLongPressed: Bool = false

    var body: some View {
        Image("pencake")
            .resizable()
            .scaledToFit()
            .frame(width: isTapped ? 300 : 200)
            .animation(.default, value: isTapped)
            .onTapGesture(count: 2) {
                    isTapped.toggle()
                }
            .onLongPressGesture {
                print("long")
                isLongPressed.toggle()
                let _ = Self._printChanges()
            }
    }
}

#Preview("Tap to zoom") {
    Tap_Demo()
}

#Preview("Zoomable") {
    Image("pencake")
        .resizable()
        .scaledToFit()
        .rounded()
        .frame(width: 200)
        .zoomable()
}
