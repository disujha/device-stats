import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(devicePlugin)
public class devicePlugin: CAPPlugin {
    @objc func getDeviceStats(_ call: CAPPluginCall) {
        let totalRAM = ProcessInfo.processInfo.physicalMemory
        let storageInfo = getStorageInfo()

        let result: [String: Any] = [
            "totalRAM": totalRAM,
            "totalStorage": storageInfo.total,
            "freeStorage": storageInfo.free
        ]
        call.resolve(result)
    }

    private func getStorageInfo() -> (total: UInt64, free: UInt64) {
        if let attributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) {
            let total = attributes[.systemSize] as? UInt64 ?? 0
            let free = attributes[.systemFreeSize] as? UInt64 ?? 0
            return (total, free)
        }
        return (0, 0)
    }
}
