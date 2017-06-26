//
//  ViewController.swift
//  swift_test_FileManager
//
//  Created by Evgeniy Akhmerov on 26/06/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var allButtonsStackView: UIStackView!
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Private
    
    private func index(for button: UIButton) -> Int {
        return allButtonsStackView.arrangedSubviews.index(of: button)!
    }
    
    private func setupUI() {
        let buttons = allButtonsStackView.arrangedSubviews
        for (index, button) in buttons.enumerated() {
            (button as! UIButton).setTitle(Methods(rawValue: index)!.stringValue, for: .normal)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func onMethodCall(_ sender: UIButton) {
    }
}
