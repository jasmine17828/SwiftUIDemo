import SwiftUI

struct SimpleAnimation: View {
    @State private var flag = false
    @State private var isPresented = false
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.blue)
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {
                withAnimation() {
                    flag.toggle()
                } completion: {
                    isPresented.toggle()
                }
            }
        
        Text("Done")
            .opacity(isPresented ? 1 : 0)
    }
}

#Preview("Explict") {
    SimpleAnimation()
}

struct ImplicitAnimation: View {
    @State private var flag = false

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.blue)
            .frame(width: flag ? 100 : 50, height: 50)
            .opacity(flag ? 1 : 0.5)
            // Implicit Animation
            .animation(.default, value: flag)
            .onTapGesture {
                flag.toggle()
            }
    }
}

#Preview("Implicit") {
    ImplicitAnimation()
}

struct ScopedAnimation: View {
    @State private var flag = false

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.blue)
            .frame(width: flag ? 100 : 50, height: 50)
            // Scoped Animation
            .animation(.spring(duration: 2)) {
                $0.opacity(flag ? 1 : 0.1)
            }
            .onTapGesture {
                flag.toggle()
            }
    }
}

#Preview("Scoped") {
    ScopedAnimation()
}


struct AntiAnimation: View {
    @State private var flag = false

    var body: some View {
        let rect = RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(.blue)
            .onTapGesture {
                withAnimation(.none) {
                    flag.toggle()
                }
            }

        if flag {
            rect
                .frame(width: 100, height: 50)
        } else {
            rect
                .frame(width: 50, height: 50)
        }
    }
}

#Preview("AntiAnimation") {
    AntiAnimation()
}
