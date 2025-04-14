import Foundation

class TestScreenViewMode: ObservableObject {
    init() {
        print("init: ", self )
    }

    deinit {
        print("deinit: ", self)
    }
}

class TestScreenViewModel1: TestScreenViewMode {
//    private var coordinator: TestScreenCoordinator1?
    private weak var coordinator: TestScreenCoordinator1?

    init(coordinator: TestScreenCoordinator1) {
        self.coordinator = coordinator
    }

    func pushTapped() {
        coordinator?.pushToNext()
    }

    func setRootTapped() {
        coordinator?.setRootWithNext()
    }

    func presentTapped() {
        coordinator?.presentNext()
    }

    func dismissTapped() {
        coordinator?.dismiss()
    }
}

class TestScreenViewModel2: TestScreenViewMode {
    private weak var coordinator: TestScreenCoordinator2?

    init(coordinator: TestScreenCoordinator2) {
        self.coordinator = coordinator
    }

    func pushTapped() {
        coordinator?.pushToNext()
    }

    func setRootTapped() {
        coordinator?.setRootWithNext()
    }

    func dismissTapped() {
        coordinator?.dismiss()
    }
}

class TestScreenViewModel3: TestScreenViewMode {
    private weak var coordinator: TestScreenCoordinator3?

    init(coordinator: TestScreenCoordinator3) {
        self.coordinator = coordinator
    }

    func dismissTapped() {
        coordinator?.dismiss()
    }
}
