//
//  FilesPlayground.swift
//  swift_test_FileManager
//
//  Created by Evgeniy Akhmerov on 26/06/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import Foundation

class FilesPlayground: NSObject {
    
    //MARK: - Properties
    
    private var tokens = [NSObjectProtocol]()
    var manager: FileManager?
    
    //MARK: - Public
    
    func activate() {
        guard manager == nil else {
            assertionFailure("Already active")
            return
        }
        
        manager = FileManager()
//        manager?.delegate = self as FileManagerDelegate
        let token = NotificationCenter.default.addObserver(forName: .NSUbiquityIdentityDidChange, object: nil, queue: nil) {
            (_) in
            print("NSUbiquityIdentityDidChange notification received.")
        }
        
        tokens += [token]
    }
    
    deinit {
        tokens.forEach { NotificationCenter.default.removeObserver($0) }
    }
    
    func accessingUserDirectories() {
        if  #available(iOS 10.0, *) {
            let url = manager!.temporaryDirectory
            print(url)
            
        } else {
            print("iOS 10.0+ only")
        }
    }
    
    func locatingSystemDirectories() {
        
    }
    
    func locatingApplicationGroupContainerDirectories() {
        
    }
    
    func discoveringDirectoryContent() {
        
    }
    
    func creatingAndDeletingItems() {
        
    }
    
    func movingAndCopyingItems() {
        
    }
    
    func managingICloudBasedItems() {
        
    }
    
    func creatingSymbolicAndHardLinks() {
        
    }
    
    func determiningAccessToFiles() {
        
    }
    
    func gettingAndSettingAttributes() {
        
    }
    
    func gettingAndComparingFileContent() {
        
    }
    
    func gettingTheRelationshipBetweenItems() {
        
    }
    
    func convertingFilePathsToStrings() {
        
    }
    
    func managingTheCurrentDirectory() {
        
    }
    
    func constants() {
        //  ???
    }
    
    func filePathFunctions() {
        
    }
}
