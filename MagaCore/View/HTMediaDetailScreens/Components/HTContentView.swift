import SwiftUI
import Combine

struct HTContentView: View {

    let colors: [Color] = [.red, .blue, .green, .pink, .purple]

    var loopColors: [Color] {
        return [colors.last!] + colors + [colors.first!]
    }

    @State var dragOffset: CGFloat = .zero

    /// 当前显示的位置索引
//    @State var currentIndex: Int = 1
    @ObservedObject var state = StateModel()

    @State var isAnimation = true

    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    var body: some View {

      let width = 200.0
        let spacing: CGFloat = 10
//        let currentOffset = CGFloat(currentIndex) * (width + spacing)
        let currentOffset = CGFloat(state.currentIndex) * (width + spacing)
        let defaultPadding: CGFloat = 20

        GeometryReader { proxy in
            HStack(alignment: .center, spacing: spacing) {
                ForEach(loopColors, id: \.self) { color in
//                    let height = color.id == loopColors[currentIndex].id ? proxy.size.height : proxy.size.height * 0.8
                    let height = color.id == loopColors[state.currentIndex].id ? proxy.size.height : proxy.size.height * 0.8
                    color.frame(width: width)
                        .frame(height: height)
                        .overlay(Text("\(colors.firstIndex(of: color)!)").font(.largeTitle))
                }
            }
            .offset(x: defaultPadding + dragOffset - currentOffset)
            .gesture(dragGesture)
            .animation(isAnimation ? .spring() : .none)
            .frame(width: proxy.size.width,
                   height: proxy.size.height,
                   alignment: .leading)
            .onReceive(state.$currentIndex, perform: modifyCurrentIndex)
//            .onChange(of: currentIndex, perform: modifyCurrentIndex)
            .onReceive(timer, perform: { _ in
//                currentIndex += 1
                state.currentIndex += 1
            })
        }
        .frame(height: 200)
    }

    private func modifyCurrentIndex(_ index: Int) {
        isAnimation = true
        if index == 0 {
//            currentIndex = loopColors.count - 2
//            isAnimation.toggle()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                state.currentIndex = loopColors.count - 2
                isAnimation.toggle()
            }
        } else if index == loopColors.count - 1 {
//            currentIndex = 1
//            isAnimation.toggle()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                state.currentIndex = 1
                isAnimation.toggle()
            }
        }
    }
}

extension HTContentView {

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { changeValue in
                isAnimation = true
                dragOffset = changeValue.translation.width
            }
            .onEnded { endValue in
                dragOffset = .zero

                /// 拖动右滑，偏移量增加，显示 index 减少
                if endValue.translation.width > 50 {
//                    currentIndex -= 1
                    state.currentIndex -= 1
                }
                /// 拖动左滑，偏移量减少，显示 index 增加
                if endValue.translation.width < -50 {
//                    currentIndex += 1
                    state.currentIndex += 1
                }
                /// 防止越界
//                currentIndex = max(min(currentIndex, loopColors.count - 1), 0)
                state.currentIndex = max(min(state.currentIndex, loopColors.count - 1), 0)
            }
    }

}

class StateModel: ObservableObject {

    @Published var currentIndex: Int = 1

}

extension Color: Identifiable {
    public var id: Color {
        self
    }
}


struct HTContentView_Previews: PreviewProvider {
    static var previews: some View {
      HTContentView()
    }
}
