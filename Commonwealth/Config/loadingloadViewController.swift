//
//  loadingloadViewController.swift
//  netzme
//
//  Created by Sandi Permata on 26/02/19.
//  Copyright © 2019 myProject. All rights reserved.
//

import UIKit

class loadingloadViewController: UIViewController, NVActivityIndicatorViewable {
    
    static var shared = loadingloadViewController()
    
    private let presentingIndicatorTypes = {
        return NVActivityIndicatorType.allCases.filter { $0 != .blank }
    }()
    
    func starLoading(){
        // 0 - 31
        let size = CGSize(width: 30, height: 30)
        let selectedIndicatorIndex = 15
        let indicatorType = presentingIndicatorTypes[selectedIndicatorIndex]
        let showData = startAnimating()
        startAnimating(size, message: "Loading...", type: indicatorType, fadeInAnimation: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating...")
        }
    }
    
    func stopLoading(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating(nil)
        }
    }
}
