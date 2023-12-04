import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var flutterViewController: FlutterViewController!
    var flutterChannel: FlutterMethodChannel!
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        flutterViewController = window?.rootViewController as? FlutterViewController
        flutterChannel = FlutterMethodChannel(name: "bmi_calculate_channel",
                                              binaryMessenger:flutterViewController.binaryMessenger)
        flutterChannel.setMethodCallHandler{(call: FlutterMethodCall, result:  FlutterResult)in
            switch call.method{
            case "bmi_calculate":
                let args = call.arguments as! [String: Any]
                let weight: Double = args["weight"] as! Double;
                let height: Double = args["height"] as! Double;
                let bmi  = self.calculateBmi(
                    weight:weight,
                    height:height
                )
                result(bmi)                
            default:
                print("Not implemented")
                result(false);
                
            }
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    
    func calculateBmi(weight: Double, height: Double) -> Double {
        let newHeight = height/100;
        return weight / (newHeight*newHeight);
    }
}
