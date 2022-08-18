import UIKit

class ___VARIABLE_productName___ModuleInitializer: NSObject {
	//TODO: need create storyboard in View folder and add IBOutlet below as Module Initializer in this Storyboard
	@IBOutlet private weak var ___VARIABLE_productName___ViewController: ___VARIABLE_productName___ViewController!

	override func awakeFromNib() {
		super.awakeFromNib()
		let configurator = ___VARIABLE_productName___ModuleConfigurator()
		configurator.configureModuleForViewInput(viewInput: ___VARIABLE_productName___ViewController)
	}
}
