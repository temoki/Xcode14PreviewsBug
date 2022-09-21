import UIKit

class Sample1: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        construct()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        construct()
    }
    
    private func construct() {
        text = "Sample1"
        /// Xcode14でのプレビュー時にこの行で以下のようなエラーが発生する。
        /// ```
        /// Sample1+Preview.swift:15:16: error: '__designTimeString(_:fallback:)' is only available in iOS 13.0 or newer
        /// text = __designTimeString("#4947.[1].[2].[0].[0]", fallback: "Sample1")
        /// ```
        textAlignment = .center
    }
}

/// Xcode14でのプレビューに失敗するケース
///
/// おそらく以下のようにPreviewProviderを含むswiftコード内にある定数すべてに、
/// iOS13以降でしか有効でない`__designTime~`が挿入されてしまうことが原因。
/// ※ ターゲットのMinimum Deployment TargetがiOS12に設定されている。
#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available (iOS 13.0, *)
struct Sample1Wrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        Sample1()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

@available (iOS 13.0, *)
struct Sample1_Previews: PreviewProvider {
    static var previews: some View {
        Sample1Wrapper()
    }
}
#endif

