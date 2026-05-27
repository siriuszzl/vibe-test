import SwiftUI

struct ContentView: View {
    @State private var now = Date()

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private var timeText: String {
        now.formatted(date: .omitted, time: .standard)
    }

    private var dateText: String {
        now.formatted(date: .complete, time: .omitted)
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.08, green: 0.11, blue: 0.18), Color(red: 0.14, green: 0.27, blue: 0.32)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 18) {
                Text(dateText)
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.72))

                Text(timeText)
                    .font(.system(size: 64, weight: .semibold, design: .rounded))
                    .monospacedDigit()
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.55)
                    .lineLimit(1)
                    .accessibilityLabel("Current time \(timeText)")
            }
            .padding(28)
        }
        .onReceive(timer) { value in
            now = value
        }
    }
}

#Preview {
    ContentView()
}
