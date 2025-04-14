import Foundation
import UIKit

class TestNavigationController: UINavigationController, UIAdaptivePresentationControllerDelegate {
    var onDismiss: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        let isSelfBeingDismissed = (presentingViewController != nil && presentedViewController == nil)

        super.dismiss(animated: flag) { [weak self] in
            completion?()
            if !isSelfBeingDismissed { return }
            self?.onDismiss?()
        }
    }
}
