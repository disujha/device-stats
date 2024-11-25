import Foundation

@objc public class device: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
