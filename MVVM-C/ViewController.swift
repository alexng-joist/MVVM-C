//
//  ViewController.swift
//  MVVM-C
//
//  Created by Alex on 6/4/2025.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    var navigationController: TestNavigationController

    func start() -> UIViewController {
        return UIViewController()
    }

    private override init() {
        navigationController = TestNavigationController()
    }

    static let shared = AppCoordinator()

    var childCoordinators: [Coordinator] = []
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func presentVC(_ sender: Any) {
        let coordinator = TestScreenCoordinator1(parent: AppCoordinator.shared)
        AppCoordinator.shared.childCoordinators.append(coordinator)
        self.present(coordinator.start(), animated: true)
    }
}
