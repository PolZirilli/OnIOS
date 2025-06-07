import SwiftUI
import AVFoundation

struct AnimalButton: View {
    var imageName: String
    var soundName: String

    @State private var player: AVAudioPlayer?

    var body: some View {
        Button(action: {
            self.playSound()
        }) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 100, height: 100)
                .background(Color.pastel)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 4)
        }
    }

    func playSound() {
        if let url = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
                
                // Detener después de 6 segundos
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.player?.stop()
                }
            } catch {
                print("Error al reproducir el sonido: \(error.localizedDescription)")
            }
        } else {
            print("No se encontró el archivo de sonido: \(soundName).wav")
        }
    }

}

extension Color {
    static let pastel = Color(red: 0.9, green: 0.9, blue: 1.0)
}
