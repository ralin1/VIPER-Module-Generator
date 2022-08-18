import UIKit

class ___VARIABLE_productName___ModuleConfigurator {
	func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
		if let viewController = viewInput as? ___VARIABLE_productName___ViewController {
			configure(viewController: viewController)
		}
	}

	private func configure(viewController: ___VARIABLE_productName___ViewController) {
		let router = ___VARIABLE_productName___Router()
		router.handler = viewController

		let presenter = ___VARIABLE_productName___Presenter()
		presenter.view = viewController
		presenter.router = router

		let interactor = ___VARIABLE_productName___Interactor()
		interactor.output = presenter

		presenter.interactor = interactor
		viewController.output = presenter
	}
}
