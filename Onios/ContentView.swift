import SwiftUI

struct ContentView: View {
    let animals = [
        ("perro", "perro"),
        ("gato", "gato"),
        ("tigre", "tigre"),
        ("elefante", "elefante"),
        ("loro", "loro"),
        ("caballo", "caballo"),
        ("vaca", "vaca"),
        ("cerdo", "cerdo"),
        ("delfin", "delfin"),
        ("pato", "pato"),
        ("cocodrilo", "cocodrilo"),
        ("ballena", "ballena"),
        ("foca", "foca"),
        ("pavo", "pavo"),
        ("gallo", "gallo")
    ]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 4) {
                Text("OnIOS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)

                Text("by Toto")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.top, 20)

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(animals, id: \.0) { animal in
                        AnimalButton(imageName: animal.0, soundName: animal.1)
                    }
                }
                .padding()
            }
        }
        .background(Color(red: 1.0, green: 0.97, blue: 0.9))
    }
}
