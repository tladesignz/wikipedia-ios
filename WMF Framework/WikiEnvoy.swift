import Foundation
import GreatfireEnvoy

extension Notification.Name {
    public static let envoyStarted = Notification.Name("envoy-started")
}

@objc
extension NSNotification {
    public static let envoyStarted = Notification.Name.envoyStarted
}

public class WikiEnvoy {

    public static private(set) var started = false

    public class func start() async {
        print("[\(String(describing: self))] #start")

        await Envoy.shared.start(
            urls: [
            ],
            testDirect: true)

        started = true

        print("[\(String(describing: self))] #started: \(Envoy.shared.proxy)")

        await MainActor.run {
            NotificationCenter.default.post(name: .envoyStarted, object: Envoy.shared)
        }
    }

    public class func getWebView(frame: CGRect, configuration: WKWebViewConfiguration) -> EnvoyWebView {
        EnvoyWebView(frame: frame, configuration: configuration)
    }

    public class func getUrlSessionConf() -> URLSessionConfiguration {
        let conf = URLSessionConfiguration.default

        if #available(iOS 17.0, *) {
            if let config = Envoy.shared.getProxyConfig() {
                conf.proxyConfigurations.append(config)
            }
        } else {
            conf.connectionProxyDictionary = Envoy.shared.getProxyDict()
        }

        return conf
    }
}
