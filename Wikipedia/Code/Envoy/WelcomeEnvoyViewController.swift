import WMFComponents

class WelcomeEnvoyViewController: ThemeableViewController {

    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!


    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = WMFLocalizedString("welcome-envoy-subtitle", value:"This modified version of the Wikipedia app contains Envoy, a fully automated proxy tool which helps you reach Wikipedia in constrained environments.\n\nPlease be patient, while we're trying to connect you!", comment:"Sub-title explaining how Envoy is used")

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
