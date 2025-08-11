import SwiftUI
import Observation

struct Counter: View {
    @Binding var count: Int

    var body: some View {
        
        Text("Counter: \(count)")
        Button("Reset") {
            count = 23
        }
    }
}

struct ModelCounter: View {
    var model: Model
    
    var body: some View {
        @Bindable var model = model
        Button("Set to 100") {
            model.count = 100
        }
        TextField(text: $model.name){
            Text("Enter name")
        }
        .background(.red)
    }
}


struct CounterView: View {
    @State var model = Model()

    var body: some View {
        Button("Increment \(model.count)") {
            model.count += 3
        }
        Text("Name: \(model.name)")

        Divider()

        Counter(count: $model.count)

        Divider()

        ModelCounter(model: model)
        
        Divider()
    }
}

@Observable
class Model {
    var count: Int = 0
    var name: String = ""
}

#Preview {
    CounterView()
        .font(.largeTitle)
}
