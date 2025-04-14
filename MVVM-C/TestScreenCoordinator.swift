import Foundation
import SwiftUI
import UIKit

class TestScreenCoordinator1: BaseCoordinator {

    init(parent: Coordinator?) {
        super.init(navigationController: .init(), parent: parent)
    }

    override func start() -> UIViewController {
        let viewModel = TestScreenViewModel1(coordinator: self)
        let vc = UIHostingController(rootView: TestScreen1(viewModel: viewModel))
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }

    func pushToNext() {
        let coordinator = TestScreenCoordinator2(navigationController: navigationController, parent: self)
        childCoordinators.append(coordinator)
        navigationController.pushViewController(coordinator.start(), animated: true)
    }

    func setRootWithNext() {
        let coordinator = TestScreenCoordinator2(navigationController: navigationController, parent: self)
        childCoordinators.append(coordinator)
        navigationController.setViewControllers([coordinator.start()], animated: true)
    }

    func presentNext() {
        let coordinator = TestScreenCoordinator1(parent: self)
        childCoordinators.append(coordinator)
        navigationController.topViewController?.present(coordinator.start(), animated: true)
    }

    func dismiss() {
        navigationController.dismiss(animated: true)
    }
}

class TestScreenCoordinator2: BaseCoordinator {
    override func start() -> UIViewController {
        navigationController.delegate = self
        let viewModel = TestScreenViewModel2(coordinator: self)
        return UIHostingController(rootView: TestScreen2(viewModel: viewModel))
    }

    func pushToNext() {
        let coordinator = TestScreenCoordinator3(navigationController: navigationController, parent: self)
        childCoordinators.append(coordinator)
        navigationController.pushViewController(coordinator.start(), animated: true)
    }

    func setRootWithNext() {
        let coordinator = TestScreenCoordinator3(navigationController: navigationController, parent: self)
        childCoordinators.append(coordinator)
        navigationController.setViewControllers([coordinator.start()], animated: true)
    }

    func dismiss() {
        navigationController.dismiss(animated: true)
    }
}

class TestScreenCoordinator3: BaseCoordinator {

    override func start() -> UIViewController {
        let viewModel = TestScreenViewModel3(coordinator: self)
        return UIHostingController(rootView: TestScreen3(viewModel: viewModel))
    }

    func dismiss() {
        navigationController.dismiss(animated: true)
    }
}
