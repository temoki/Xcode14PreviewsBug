import UIKit

class Sample2: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        construct()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        construct()
    }
    
    private func construct() {
        text = "Sample2"
        textAlignment = .center
    }
}
