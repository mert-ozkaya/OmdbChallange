//
//  SplashVC.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 22.02.2021.
//

import UIKit
import FirebaseRemoteConfig

class SplashVC: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var remoteConfig: RemoteConfig!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkInternetAndSetupRemote()
    }
    
    func checkInternetAndSetupRemote() {
        if Reachability.shared.isConnectedToNetwork() {
            if let controller = self.presentedViewController, controller is UIAlertController {
                self.dismiss(animated: true) {
                    self.setupAndFetchRemoteConfig()
                }
            } else {
                setupAndFetchRemoteConfig()
            }
        } else {
            let alert = UIAlertController(title: "ConnectionError".localized, message: "ConnectionErrorDescription".localized, preferredStyle: .alert)
            
            let checkoutTime = DispatchTime.now() + 3
            if let controller = self.presentedViewController, controller is UIAlertController {
                DispatchQueue.main.asyncAfter(deadline: checkoutTime) {
                    self.checkInternetAndSetupRemote()
                }
            } else {
                self.present(alert, animated: true) {
                    DispatchQueue.main.asyncAfter(deadline: checkoutTime) {
                        self.checkInternetAndSetupRemote()
                    }
                }
            }
        }
    }
    
    func setupAndFetchRemoteConfig() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        fetchConfig()
    }
    
    func setupUI() {
        welcomeLabel.text = ""
    }
    
    func fetchConfig() {
        remoteConfig.fetch() { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activate() { (changed, error) in
                  print("Remote Activated")
                }
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            
            self.displayIntroMessage()
        }
    }
    
    func displayIntroMessage() {
        DispatchQueue.main.async {
            self.welcomeLabel.text = self.remoteConfig["splash_started"].stringValue
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("Hadi git artık")
            }
        }
    }

}
