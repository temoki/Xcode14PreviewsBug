/// Xcode14でのプレビューに成功するケース
#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available (iOS 13.0, *)
struct Sample2Wrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        Sample2()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

@available (iOS 13.0, *)
struct Sample2_Previews: PreviewProvider {
    static var previews: some View {
        Sample2Wrapper()
    }
}
#endif
