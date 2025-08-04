import SwiftUI

struct NavigationStack_Demo: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(value: 01) {
                    Text("001")
                        .bold()
                    
                }
                NavigationLink(value: 02) {
                    Text("002")
                        .bold()
                }
            }
            .navigationTitle("Actions")
            .navigationDestination(for: Int.self) { value in
                
                switch value {
                case 1 :
                    Image(systemName: "star")
                case 2 :
                    Image(systemName: "heart")
                default :
                    EmptyView()
                    
                }
                Text("No.\(value)")
            }
        }
    }
}

#Preview("Navigation") {
    NavigationStack_Demo()
}

/// Navigation Path
struct NavigationStack_Demo2: View {
    @State private var path: [Int] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink(value: 1) {
                    Text("Show Detail 1")
                }
                
            }
            .navigationTitle("Actions")
            .navigationDestination(for: Int.self) { value in
                VStack {
                    Text("Detail View")

                    Button("Push") {
                        path.append(1)
                    }

                    if path.count >= 3 {
                        Button("Pop to root") {
                            path = []
                        }
                    }
                }
            }
        }
    }
}

#Preview("NavigationPath") {
    NavigationStack_Demo2()
}
