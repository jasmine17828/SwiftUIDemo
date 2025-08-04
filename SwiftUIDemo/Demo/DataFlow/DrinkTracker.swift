import SwiftUI
///1223
struct DrinkTracker: View {
    @State private var waterCount: Int = 0
    @State private var coffeeCount: Int = 0
    @State private var beerCount: Int = 0

    private var totalCount: Int {
        
        waterCount + coffeeCount + beerCount
    }

    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Text("Total number of drinks: \(totalCount)")
            WaterTracker(count: $waterCount)
            CoffeeTracker(count: $coffeeCount)
            BeerTracker(count: $beerCount)
        }
        .padding()
    }
}

struct WaterTracker2: View {
    @State var count: Int = 0

    var body: some View {
        HStack {
            Text("^[\(count) glass](inflect: true) of water")
            Stepper("", value: $count)
        }
        .padding()
    }
}

struct WaterTracker: View {
    @Binding var count: Int

    var body: some View {
        HStack {
            Text("^[\(count) glass](inflect: true) of water")
            Stepper("", value: $count)
        }
        .padding()
    }
}

struct CoffeeTracker: View {
    @Binding var count: Int

    var body: some View {
        HStack {
            Text("^[\(count) cup](inflect: true) of coffee")
            Stepper("", value: $count)
        }
        .padding()
    }
}

struct BeerTracker: View {
    @Binding var count: Int

    var body: some View {
        HStack {
            Text("^[\(count) glass](inflect: true) of beer")
            Stepper("", value: $count)
        }
        .padding()
    }
}

struct DrinkView: View {
    private let symbolName: String = "cup.and.saucer"

    var body: some View {
        Image(systemName: symbolName)
            .imageScale(.large)
            .font(.title)
            .foregroundStyle(.blue)
    }
}

#Preview("Drink") {
    DrinkView()
}

#Preview("Water Tracker") {
    WaterTracker2()
}

#Preview("Drink Tracker") {
    DrinkTracker()
}
