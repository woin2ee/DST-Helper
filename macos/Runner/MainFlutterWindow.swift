import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    let minimumSize = NSSize(width: 1200, height: 800)
      
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    self.minSize = minimumSize

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
