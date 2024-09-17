import WMFComponents

class WelcomeEnvoyViewController: ThemeableViewController {

    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!


    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = WMFLocalizedString("welcome-envoy-subtitle", value:"Please be patient, while Wiki Unblocked is trying to connect you!", comment:"Sub-title explaining how Envoy is used")

        view.wmf_configureSubviewsForDynamicType()

        activityIndicator.startAnimating()

        Task {
            await WikiEnvoy.start()

            await MainActor.run {
                activityIndicator.stopAnimating()
            }
        }
    }
}
