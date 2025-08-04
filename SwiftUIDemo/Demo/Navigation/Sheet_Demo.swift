import SwiftUI

struct Sheet_Demo: View {
    @State private var isShowing = false

    var body: some View {
        /// Refer to the examples in ``VStack_Demo``
        VStack {
            Button {
                isShowing = true
            } label: {
                Text("Show Sheet")
            }
        }
        .sheet(isPresented: $isShowing) {
            Text("Detail")
                .presentationDetents([.medium, .fraction(0.33)])
                .presentationDragIndicator(.visible)
                
        }
    }
}

#Preview {
    Sheet_Demo()
}
