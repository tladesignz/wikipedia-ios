import Foundation
import GreatfireEnvoy

extension Notification.Name {
    static let envoyStarted = Notification.Name("envoy-started")
}

class WikiEnvoy {

    static private(set) var started = false

    class func start() async {
        print("[\(String(describing: self))] #start")

        await Envoy.shared.start(urls: [
            URL(string: "hysteria2://xeyKLqOzl8svMLEKtLhFUOq8sv2RIf6O@smcdonald.org:2443/")!])

        started = true

        print("[\(String(describing: self))] #started: \(Envoy.shared.proxy)")

        await MainActor.run {
            NotificationCenter.default.post(name: .envoyStarted, object: Envoy.shared)
        }
    }

    class func getWebView(frame: CGRect, configuration: WKWebViewConfiguration) -> EnvoyWebView {
        EnvoyWebView(frame: frame, configuration: configuration)
    }
}
