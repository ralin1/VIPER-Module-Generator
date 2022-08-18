import Foundation

let templateName = "Viper module.xctemplate"
let destinationRelativePath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"

func printInConsole(_ message:Any){
	print("\(message)")
}

func moveTemplate(){

	let fileManager = FileManager.default
	let destinationPath = destinationRelativePath
	
	do {
		if !fileManager.fileExists(atPath:"\(destinationPath)/\(templateName)"){

			try fileManager.copyItem(atPath: templateName, toPath: "\(destinationPath)/\(templateName)")

			printInConsole("Template installed succesfully.")

		} else{
			try _ = fileManager.replaceItemAt(URL(fileURLWithPath:"\(destinationPath)/\(templateName)"), withItemAt: URL(fileURLWithPath:templateName))

			printInConsole("Template already exists. So has been replaced succesfully")
		}
	}
	catch let error as NSError {
		printInConsole("Something went wrong, error: \(error.localizedFailureReason!)")
	}
}

func shell(launchPath: String, arguments: [String]) -> String
{
	let task = Process()
	task.launchPath = launchPath
	task.arguments = arguments

	let pipe = Pipe()
	task.standardOutput = pipe
	task.launch()

	let data = pipe.fileHandleForReading.readDataToEndOfFile()
	let output = String(data: data, encoding: String.Encoding.utf8)!
	if output.count > 0 {
		let lastIndex = output.index(before: output.endIndex)
		return String(output[output.startIndex ..< lastIndex])
	}
	return output
}

func bash(command: String, arguments: [String]) -> String {
	let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
	return shell(launchPath: whichPathForCommand, arguments: arguments)
}

moveTemplate()

