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
        _temporaryDirectory()
    }
    
    func locatingSystemDirectories() {
        _URLForDirectoryInDomainAppropriateForURLCreateError()
        print()
        _URLsForDirectoryInDomains()
    }
    
    func locatingApplicationGroupContainerDirectories() {
        _containerURLForSecurityApplicationGroupIdentifier()
    }
    
    func discoveringDirectoryContent() {
        _contentsOfDirectoryAtURLIncludingPropertiesForKeysOptionsError()
        print()
        _contentsOfDirectoryAtPathError()
        print()
        _enumeratorAtURLIncludingPropertiesForKeysOptionsErrorHandler()
        print()
        _enumeratorAtPath()
        print()
        _NSDirectoryEnumerator()
        print()
        _mountedVolumeURLsIncludingResourceValuesForKeysOptions()
        print()
        _subpathsOfDirectoryAtPathError()
        print()
        _subpathsAtPath()
    }
    
    func creatingAndDeletingItems() {
        _createDirectoryAtURLWithIntermediateDirectoriesAttributesError()
        print()
        _createDirectoryAtPathWithIntermediateDirectoriesAttributesError()
        print()
        _createFileAtPathContentsAttributes()
        print()
        _removeItemAtURLError()
        print()
        _removeItemAtPathError()
        print()
        _replaceItemAtURLWithItemAtURLBackupItemNameOptionsResultingItemURLError()
        
        if #available(iOS 11, *) {
            print()
            _trashItemAtURLResultingItemURLError()
        }
    }
    
    func movingAndCopyingItems() {
        _copyItemAtURLToURLError()
        print()
        _copyItemAtPathToPathError()
        print()
        _moveItemAtURLToURLError()
        print()
        _moveItemAtPathToPathError()
    }
    
    func managingICloudBasedItems() {
        _ubiquityIdentityToken()
        print()
        _URLForUbiquityContainerIdentifier()
        print()
        _isUbiquitousItemAtURL()
        print()
        _setUbiquitousItemAtURLDestinationURLError()
        print()
        _startDownloadingUbiquitousItemAtURLError()
        print()
        _evictUbiquitousItemAtURLError()
        print()
        _URLForPublishingUbiquitousItemAtURLExpirationDateError()
    }
    
    func creatingSymbolicAndHardLinks() {
        _createSymbolicLinkAtURLWithDestinationURLError()
        print()
        _createSymbolicLinkAtPathWithDestinationPathError()
        print()
        _linkItemAtURLToURLError()
        print()
        _linkItemAtPathToPathError()
        print()
        _destinationOfSymbolicLinkAtPathError()
    }
    
    func determiningAccessToFiles() {
        _fileExistsAtPath()
        print()
        _fileExistsAtPathIsDirectory()
        print()
        _isReadableFileAtPath()
        print()
        _isWritableFileAtPath()
        print()
        _isExecutableFileAtPath()
        print()
        _isDeletableFileAtPath()
    }
    
    func gettingAndSettingAttributes() {
        _componentsToDisplayForPath()
        print()
        _displayNameAtPath()
        print()
        _attributesOfItemAtPathError()
        print()
        _attributesOfFileSystemForPathError()
        print()
        _setAttributesOfItemAtPathError()
    }
    
    func gettingAndComparingFileContent() {
        _contentsAtPath()
        print()
        _contentsEqualAtPathAndPath()
    }
    
    func gettingTheRelationshipBetweenItems() {
        _getRelationshipOfDirectoryAtURLToItemAtURLError()
        print()
        _getRelationshipOfDirectoryInDomainToItemAtURLError()
    }
    
    func convertingFilePathsToStrings() {
        _fileSystemRepresentationWithPath()
        print()
        _stringWithFileSystemRepresentationLength()
    }
    
    func managingTheCurrentDirectory() {
        _changeCurrentDirectoryPath()
        print()
        _currentDirectoryPath()
    }
    
    func constants() {
        //  ???
    }
    
    func filePathFunctions() {
        _NSFullUserName()
        print()
        _NSHomeDirectory()
        print()
        _NSHomeDirectoryForUser()
        print()
        _NSOpenStepRootDirectory()
        print()
        _NSSearchPathForDirectoriesInDomains()
        print()
        _NSTemporaryDirectory()
        print()
        _NSUserName()
    }
    
    // MARK: - Private
    
    private func _temporaryDirectory() {
        if  #available(iOS 10.0, *) {
            let url = manager!.temporaryDirectory
            print(url)
            
        } else {
            print("iOS 10.0+ only")
        }
    }
    
    private func _URLForDirectoryInDomainAppropriateForURLCreateError() {
        do {
            let url = try manager!.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            print(url)
        } catch let error {
            print(error)
        }
    }
    
    private func _URLsForDirectoryInDomains() {
        let urls = manager!.urls(for: .applicationDirectory,
                                 in: .systemDomainMask)
        print(urls)
    }
    
    //TODO: изучить и реализовать подключение к секьюрному контейнеры
    private func _containerURLForSecurityApplicationGroupIdentifier() {
        if let url = manager!.containerURL(forSecurityApplicationGroupIdentifier: "com.apple.security.application-groups") {
            print(url)
        } else {
            print("Does nothing...")
        }
    }
    
    //TODO: сделать проверку всех возможных путей
    private func _contentsOfDirectoryAtURLIncludingPropertiesForKeysOptionsError() {
        let libInSystem = manager!.urls(for: .libraryDirectory, in: .systemDomainMask).first!
        
        do {
            let urls = try manager!.contentsOfDirectory(at: libInSystem,
                                                        includingPropertiesForKeys: nil,
                                                        options: .skipsHiddenFiles)
            print(urls)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: сделать проверку всех возможных путей
    private func _contentsOfDirectoryAtPathError() {
        let libInSystem = manager!.urls(for: .libraryDirectory, in: .systemDomainMask).first!
        
        do {
            let contents = try manager!.contentsOfDirectory(atPath: libInSystem.relativePath)
            print(contents)
        } catch let error {
            print(error)
        }
    }
    
    private func _enumeratorAtURLIncludingPropertiesForKeysOptionsErrorHandler() {
        //
    }
    
    //TODO: сделать проверку всех возможных путей
    private func _enumeratorAtPath() {
        let libInSystem = manager!.urls(for: .libraryDirectory, in: .systemDomainMask).first!
        
        var emergencyCount = 15
        let enumerator = manager!.enumerator(atPath: libInSystem.relativePath)
        while let file = enumerator?.nextObject() as? String, emergencyCount > 0 {
            emergencyCount -= 1
            print(file)
        }
    }
    
    private func _NSDirectoryEnumerator() {
        //???  what to do here?
    }
    
    private func _mountedVolumeURLsIncludingResourceValuesForKeysOptions() {
        if let urls = manager!.mountedVolumeURLs(includingResourceValuesForKeys: nil, options: .produceFileReferenceURLs) {
            print(urls)
        } else {
            print("Nothing hapened")
        }
    }
    
    //TODO: сделать проверку всех возможных путей
    private func _subpathsOfDirectoryAtPathError() {
        let libInSystem = manager!.urls(for: .libraryDirectory, in: .systemDomainMask).first!
        
        do {
            let subpathes = try manager!.subpathsOfDirectory(atPath: libInSystem.absoluteString)
            print(subpathes)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: сделать проверку всех возможных путей
    private func _subpathsAtPath() {
        let libInSystem = manager!.urls(for: .libraryDirectory, in: .systemDomainMask).first!
        
        if let subpathes = manager!.subpaths(atPath: libInSystem.absoluteString) {
            print(subpathes)
        } else {
            print("Nothing hapened")
        }
    }
    
    private func _createDirectoryAtURLWithIntermediateDirectoriesAttributesError() {
        /// Создает директорию с задаными аттрибутами по определенному пути.
        
        let timeInteravlString = Date().timeIntervalSinceNow.description
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent(timeInteravlString)
        
        do {
            try manager!.createDirectory(at: path,
                                         withIntermediateDirectories: true,
                                         attributes: nil)
        } catch let error {
            print(error)
        }
    }
    
    private func _createDirectoryAtPathWithIntermediateDirectoriesAttributesError() {
        /// Создает директорию с задаными аттрибутами по определенному пути.
        
        let timeInteravlString = Date().timeIntervalSinceNow.description
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent(timeInteravlString).absoluteString
        
        do {
            try manager!.createDirectory(atPath: path,
                                         withIntermediateDirectories: true,
                                         attributes: nil)
        } catch let error {
            print(error)
        }
    }
    
    private func _createFileAtPathContentsAttributes() {
        /// Создает файл с определенным содержимым и атрибутами в указанном месте
        
        let fileData = String.oneParagraphText.data(using: .utf8)
        let dateInterval = Date().timeIntervalSinceNow
        let fileName = "textFile\(dateInterval).dat"
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent(fileName)
        
        if manager!.createFile(atPath: path.absoluteString,
                               contents: fileData,
                               attributes: nil) {
            print("File created")
        } else {
            print("File creating failed")
        }
    }
    
    //TODO: нужно реальное создание файла и удаление
    private func _removeItemAtURLError() {
        /// Удаляет файл или директорию по указанному URL
        
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("SomethingToRemove")
        
        do {
            try manager!.removeItem(at: path)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужно реальное создание файла и удаление
    private func _removeItemAtPathError() {
        /// Удаляет файл или директорию по указанному пути
        
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("SomethingToRemove")
        
        do {
            try manager!.removeItem(atPath: path.absoluteString)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужно реальные файлы для обмена
    private func _replaceItemAtURLWithItemAtURLBackupItemNameOptionsResultingItemURLError() {
        
        let replacedPath = URL(string: "")!
        let replacingPath = URL(string: "")!
        let backUpName = replacedPath.lastPathComponent + ".old"
        
        /**
         usingNewMetadataOnly - перезатрет meta данные новыми без сохранения старых
         withoutDeletingBackupItem - оставит backup копию после успешной замены
         */
        let options = FileManager.ItemReplacementOptions.withoutDeletingBackupItem
        
        /// On input, a pointer for a URL object. When the item is replaced, this pointer is set to the URL of the new item. If no new file system object is required, the URL object in this parameter may be the same passed to the originalItemURL parameter. However, if a new file system object is required, the URL object may be different. For example, replacing an RTF document with an RTFD document requires the creation of a new file.
        var resultingItemURL: NSURL?
        
        do {
            try manager!.replaceItem(at: replacedPath,
                                     withItemAt: replacingPath,
                                     backupItemName: backUpName,
                                     options: options,
                                     resultingItemURL: &resultingItemURL)
            
            if let _resultURL = resultingItemURL {
                print(_resultURL)
            }
        } catch let error {
            print(error)
        }
    }
    
    private func _trashItemAtURLResultingItemURLError() {
        //TODO: iOS 11 only
    }
    
    
    
    
    
    private func _copyItemAtURLToURLError() {
        fatalError("Unimplemented")
    }
    
    private func _copyItemAtPathToPathError() {
        fatalError("Unimplemented")
    }
    
    private func _moveItemAtURLToURLError() {
        fatalError("Unimplemented")
    }
    
    private func _moveItemAtPathToPathError() {
        fatalError("Unimplemented")
    }
    
    
    

    
    private func _ubiquityIdentityToken() {
        fatalError("Unimplemented")
    }
    
    private func _URLForUbiquityContainerIdentifier() {
        fatalError("Unimplemented")
    }
    
    private func _isUbiquitousItemAtURL() {
        fatalError("Unimplemented")
    }
    
    private func _setUbiquitousItemAtURLDestinationURLError() {
        fatalError("Unimplemented")
    }
    
    private func _startDownloadingUbiquitousItemAtURLError() {
        fatalError("Unimplemented")
    }
    
    private func _evictUbiquitousItemAtURLError() {
        fatalError("Unimplemented")
    }
    
    private func _URLForPublishingUbiquitousItemAtURLExpirationDateError() {
        fatalError("Unimplemented")
    }
    
    private func _createSymbolicLinkAtURLWithDestinationURLError() {
        fatalError("Unimplemented")
    }
    
    private func _createSymbolicLinkAtPathWithDestinationPathError() {
        fatalError("Unimplemented")
    }
    
    private func _linkItemAtURLToURLError() {
        fatalError("Unimplemented")
    }
    
    private func _linkItemAtPathToPathError() {
        fatalError("Unimplemented")
    }
    
    private func _destinationOfSymbolicLinkAtPathError() {
        fatalError("Unimplemented")
    }
    
    private func _fileExistsAtPath() {
        fatalError("Unimplemented")
    }
    
    private func _fileExistsAtPathIsDirectory() {
        fatalError("Unimplemented")
    }
    
    private func _isReadableFileAtPath() {
        fatalError("Unimplemented")
    }
    
    private func _isWritableFileAtPath() {
        fatalError("Unimplemented")
    }
    
    private func _isExecutableFileAtPath() {
        fatalError("Unimplemented")
    }
    
    private func _isDeletableFileAtPath() {
        fatalError("Unimplemented")
    }
    
    private func _componentsToDisplayForPath() {
        fatalError("Unimplemented")
    }
    
    private func _displayNameAtPath() {
        fatalError("Unimplemented")
    }
    
    private func _attributesOfItemAtPathError() {
        fatalError("Unimplemented")
    }
    
    private func _attributesOfFileSystemForPathError() {
        fatalError("Unimplemented")
    }
    
    private func _setAttributesOfItemAtPathError() {
        fatalError("Unimplemented")
    }
    
    private func _contentsAtPath() {
        fatalError("Unimplemented")
    }
    
    private func _contentsEqualAtPathAndPath() {
        fatalError("Unimplemented")
    }
    
    private func _getRelationshipOfDirectoryAtURLToItemAtURLError() {
        fatalError("Unimplemented")
    }
    
    private func _getRelationshipOfDirectoryInDomainToItemAtURLError() {
        fatalError("Unimplemented")
    }
    
    private func _fileSystemRepresentationWithPath() {
        fatalError("Unimplemented")
    }
    
    private func _stringWithFileSystemRepresentationLength() {
        fatalError("Unimplemented")
    }
    
    private func _changeCurrentDirectoryPath() {
        fatalError("Unimplemented")
    }
    
    private func _currentDirectoryPath() {
        fatalError("Unimplemented")
    }
    
    private func _NSFullUserName() {
        fatalError("Unimplemented")
    }
    
    private func _NSHomeDirectory() {
        fatalError("Unimplemented")
    }
    
    private func _NSHomeDirectoryForUser() {
        fatalError("Unimplemented")
    }
    
    private func _NSOpenStepRootDirectory() {
        fatalError("Unimplemented")
    }
    
    private func _NSSearchPathForDirectoriesInDomains() {
        fatalError("Unimplemented")
    }
    
    private func _NSTemporaryDirectory() {
        fatalError("Unimplemented")
    }
    
    private func _NSUserName() {
        fatalError("Unimplemented")
    }
}
