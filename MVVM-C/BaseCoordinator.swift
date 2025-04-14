import Foundation
import UIKit

protocol Coordinator: NSObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: TestNavigationController { get set }

    @discardableResult
    func start() -> UIViewController
}

extension Coordinator {
    func didChildCoordinatorFinish(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
}
class BaseCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] =  []
    var navigationController: TestNavigationController
    weak var parent: Coordinator?

    init(navigationController: TestNavigationController, parent: Coordinator?) {
        self.navigationController = navigationController
        self.parent = parent
        super.init()
        
        self.navigationController.delegate = self
        self.navigationController.onDismiss = { [weak self] in
            guard let self else { return }
            self.parent?.didChildCoordinatorFinish(self)
        }

        print("init :", self)
    }

    func start() -> UIViewController {
        fatalError("Subclasses must override start()")
    }

    deinit {
        print("deinit :", self)
    }
}

extension BaseCoordinator: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if !navigationController.viewControllers.contains(fromVC) {
            parent?.didChildCoordinatorFinish(self)
        }
    }
}

extension BaseCoordinator: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {

        parent?.didChildCoordinatorFinish(self)
    }
}
