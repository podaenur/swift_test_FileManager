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
    
    //MARK: - Properties
    
    private let playground = FilesPlayground()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playground.activate()
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
    
    private func performApropriateMethod(for method: Methods) {
        switch method {
        case .accessingUserDirectories:
            playground.accessingUserDirectories()
        case .locatingSystemDirectories:
            playground.locatingSystemDirectories()
        case .locatingApplicationGroupContainerDirectories:
            playground.locatingApplicationGroupContainerDirectories()
        case .discoveringDirectoryContent:
            playground.discoveringDirectoryContent()
        case .creatingAndDeletingItems:
            playground.creatingAndDeletingItems()
        case .movingAndCopyingItems:
            playground.movingAndCopyingItems()
        case .managingICloudBasedItems:
            playground.managingICloudBasedItems()
        case .creatingSymbolicAndHardLinks:
            playground.creatingSymbolicAndHardLinks()
        case .determiningAccessToFiles:
            playground.determiningAccessToFiles()
        case .gettingAndSettingAttributes:
            playground.gettingAndSettingAttributes()
        case .gettingAndComparingFileContent:
            playground.gettingAndComparingFileContent()
        case .gettingTheRelationshipBetweenItems:
            playground.gettingTheRelationshipBetweenItems()
        case .convertingFilePathsToStrings:
            playground.convertingFilePathsToStrings()
        case .managingTheCurrentDirectory:
            playground.managingTheCurrentDirectory()
        case .constants:
            playground.constants()
        case .filePathFunctions:
            playground.filePathFunctions()
        }
    }
    
    //MARK: - Actions
    
    @IBAction func onMethodCall(_ sender: UIButton) {
        let index = self.index(for: sender)
        let method = Methods(rawValue: index)!
        
        performApropriateMethod(for: method)
        
        sender.isEnabled = false
    }
}
