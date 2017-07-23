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
    
    //TODO: нужны реальные пути реального файла
    private func _copyItemAtURLToURLError() {
        /// Синхронно копирует файл по определенному URL в новое место
        
        let source = URL(string: NSTemporaryDirectory())!.appendingPathComponent("source")
        let destination = URL(string: NSTemporaryDirectory())!.appendingPathComponent("destination")
        
        do {
            try manager!.copyItem(at: source, to: destination)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужны реальные пути реального файла
    private func _copyItemAtPathToPathError() {
        /// Синхронно копирует файл по определенному пути в новое место
        
        let source = URL(string: NSTemporaryDirectory())!.appendingPathComponent("source")
        let destination = URL(string: NSTemporaryDirectory())!.appendingPathComponent("destination")
        
        do {
            try manager!.copyItem(atPath: source.absoluteString, toPath: destination.absoluteString)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужны реальные пути реального файла
    private func _moveItemAtURLToURLError() {
        /// Синхронно перемещает файл или директорию по указанному URL в новое место
        
        let source = URL(string: NSTemporaryDirectory())!.appendingPathComponent("source")
        let destination = URL(string: NSTemporaryDirectory())!.appendingPathComponent("destination")
        
        do {
            try manager!.moveItem(at: source, to: destination)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужны реальные пути реального файла
    private func _moveItemAtPathToPathError() {
        /// Синхронно перемещает файл или директорию по указанному пути в новое место
        
        let source = URL(string: NSTemporaryDirectory())!.appendingPathComponent("source")
        let destination = URL(string: NSTemporaryDirectory())!.appendingPathComponent("destination")
        
        do {
            try manager!.moveItem(atPath: source.absoluteString, toPath: destination.absoluteString)
        } catch let error {
            print(error)
        }
    }
    
    private func _ubiquityIdentityToken() {
        /// Токен, представляющий идентификатор iCloud  для текущего пользователя
        
        print(manager!.ubiquityIdentityToken ?? "Nothing to print")
    }
    
    private func _URLForUbiquityContainerIdentifier() {
        /// Вернет URL для iCloud контейнера, связанного с определенным идентефикатором и установит доступ к этому контейнеру
        
        //??? так ли это
        let identifier = manager!.ubiquityIdentityToken as! String
        
        let url = manager!.url(forUbiquityContainerIdentifier: identifier)
        print(url ?? "No ubiquity container url")
    }
    
    //TODO: нужен реальный путь реального файла
    private func _isUbiquitousItemAtURL() {
        /// Вернет булевый флаг, показывающий определен ли элемент для хранения в iCloud или нет
        
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("someTestFile.dat")
        
        if manager!.isUbiquitousItem(at: path) {
            print("Item is for iCloud storaginh")
        } else {
            print("Item is not for iCloud storaginh")
        }
    }
    
    //TODO: нужен реальный путь реального файла/директории
    private func _setUbiquitousItemAtURLDestinationURLError() {
        /// Установит должен ли элемент по определенному URL храниться в iCloud или нет
        
        let path = URL(string: NSTemporaryDirectory())!
        
        /**
         Moving a file into iCloud Specify the location in iCloud at which to store the file or directory. This URL must be constructed from a URL returned by the
         URLForUbiquityContainerIdentifier:
         method, which you use to retrieve the desired iCloud container directory. The URL you specify may contain additional subdirectories so that you can organize your files hierarchically in iCloud. However, you are responsible for creating those intermediate subdirectories (using the
         NSFileManager
         class) in your iCloud container directory.
         Moving a file out of iCloud Specify the location on the local device.
         */
        let destination = URL(string: NSTemporaryDirectory())!
        
        do {
            try manager!.setUbiquitous(true, itemAt: path, destinationURL: destination)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: Проработать реальный файл/директорию
    private func _startDownloadingUbiquitousItemAtURLError() {
        /// Начнет скачивание (если необходимо) определенного элемента в локальную систему
        
        /// Определенный URL для файла или директории в iCloud, который мы хотим скачать
        let path = URL(string: "todo")!
        
        do {
            try manager!.startDownloadingUbiquitousItem(at: path)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: Проработать реальный файл/директорию
    private func _evictUbiquitousItemAtURLError() {
        /// Удалит локальную копию определенного облачного элемента
        
        /// Определенный URL для файла или директории в iCloud, который мы хотим скачать
        let path = URL(string: "todo")!
        
        do {
            try manager!.evictUbiquitousItem(at: path)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: Проработать реальный файл/директорию
    private func _URLForPublishingUbiquitousItemAtURLExpirationDateError() {
        /// Вернет URL, который может быть отправлен через email пользователю для возможности скачать копию облачного элемента
        
        /// Определенный URL для файла или директории в iCloud, который мы хотим скачать
        let path = URL(string: "todo")!
        var expiration: NSDate?
        
        do {
            try manager!.url(forPublishingUbiquitousItemAt: path, expiration: &expiration)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужен реальный путь реального файла
    private func _createSymbolicLinkAtURLWithDestinationURLError() {
        /// Создает символьный линк на определенный URL, который указывает на элемент по заданной URL
        
        /// URL файла, на который создавать новый символьный линк. Последний компонент пути по URL издан как имя линка
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("someFile.dat")
        
        /// URL файла, который содержит элемент на который указываел линк.
        let destination = URL(string: NSTemporaryDirectory())!
        
        do {
            try manager!.createSymbolicLink(at: path, withDestinationURL: destination)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужен реальный путь реального файла
    private func _createSymbolicLinkAtPathWithDestinationPathError() {
        /// Создает символьный линк, который указывает на определенное место
        
        /// URL файла, на который создавать новый символьный линк. Последний компонент пути по URL издан как имя линка
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("someFile.dat")
        
        /// URL файла, который содержит элемент на который указываел линк.
        let destination = URL(string: NSTemporaryDirectory())!
        
        do {
            try manager!.createSymbolicLink(atPath: path.absoluteString, withDestinationPath: destination.absoluteString)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужен реальный путь реального файла
    private func _linkItemAtURLToURLError() {
        /// Создает сильный линк между элементами по заданным URL'ам
        
        /// URL файла, который определяет источник линка. URL в этом параметре не должен быть URL-ссылкой на файл; это должно определять актуальный путь к элементу. Значение в этом параметре не должно быть nil
        let source = URL(string: NSTemporaryDirectory())!.appendingPathComponent("SourceFile")
        
        /// URL файла, который определяет где ты хочешь создать сильный линк. URL в этом параметре не должен быть URL-ссылкой на файл; это должно определять актуальный путь к элементу. Значение в этом параметре не должно быть nil
        let destination = URL(string: NSTemporaryDirectory())!.appendingPathComponent("DestinationFile")
        
        do {
            try manager!.linkItem(at: source, to: destination)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужен реальный путь реального файла
    private func _linkItemAtPathToPathError() {
        /// Создает сильный линк между элементами по заданным URL'ам
        
        /// URL файла, который определяет источник линка. URL в этом параметре не должен быть URL-ссылкой на файл; это должно определять актуальный путь к элементу. Значение в этом параметре не должно быть nil
        let source = URL(string: NSTemporaryDirectory())!.appendingPathComponent("SourceFile")
        
        /// URL файла, который определяет где ты хочешь создать сильный линк. URL в этом параметре не должен быть URL-ссылкой на файл; это должно определять актуальный путь к элементу. Значение в этом параметре не должно быть nil
        let destination = URL(string: NSTemporaryDirectory())!.appendingPathComponent("DestinationFile")
        
        do {
            try manager!.linkItem(atPath: source.absoluteString, toPath: destination.absoluteString)
        } catch let error {
            print(error)
        }
    }
    
    private func _destinationOfSymbolicLinkAtPathError() {
        /// Возвращает путь элемента на который указывает символичный линк
        
        /// Путь к файлу или директории
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("SomeFile.dat")
        
        do {
            try manager!.destinationOfSymbolicLink(atPath: path.absoluteString)
        } catch let error {
            print(error)
        }
    }
    
    //TODO: нужен реальный путь реального файла
    private func _fileExistsAtPath() {
        /// Вернет булевый флаг, показывающий существует ли файл или директория по заданному пути
        
        let path = NSTemporaryDirectory()
        
        if manager!.fileExists(atPath: path) {
            print("File or directory exits")
        } else {
            print("It doesn\t exist")
        }
    }
    
    private func _fileExistsAtPathIsDirectory() {
        /// Вернет булевый флаг, показывающий существует ли файл или директория по заданному пути. Выходной isDirectory параметр показывает указывает ли путь на директорию или на обычный файл
        
        let path = NSTemporaryDirectory()
        var isDirectory: ObjCBool = false
        
        if manager!.fileExists(atPath: path, isDirectory: &isDirectory) {
            let typeString = isDirectory.boolValue ? "Directory" : "File"
            print("\(typeString) exits")
        } else {
            print("It doesn\t exist")
        }
    }
    
    //TODO: нужен реальный путь реального файла
    private func _isReadableFileAtPath() {
        /// Вернет булевый флаг, который показывает доступно ли вызываемому объекту чтение определенного файла
        
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("SomeReadableFile.dat")
        
        if manager!.isReadableFile(atPath: path.absoluteString) {
            print("File is readable")
        } else {
            print("Reading specified file is denided")
        }
    }
    
    //TODO: нужен реальный путь реального файла
    private func _isWritableFileAtPath() {
        /// Вернет булевый флаг, который показывает доступно ли вызываемому объекту запись определенного файла
        
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("SomeWritableFile.dat")
        
        if manager!.isWritableFile(atPath: path.absoluteString) {
            print("File is writable")
        } else {
            print("Writing specified file is denided")
        }
    }
    
    //TODO: нужен реальный путь реального файла
    private func _isExecutableFileAtPath() {
        /// Вернет булевый флаг, который показывает способна ли операционная система выполнять указанный файл
        
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("SomeExecutableFile.dat")
        
        if manager!.isExecutableFile(atPath: path.absoluteString) {
            print("File is executable")
        } else {
            print("Executing specified file is denided")
        }
    }
    
    //TODO: нужен реальный путь реального файла
    private func _isDeletableFileAtPath() {
        /// Вернет булевый флаг, который показывает доступно ли вызываемому объекту удаление определенного файла
        
        let path = URL(string: NSTemporaryDirectory())!.appendingPathComponent("SomeDeletableFile.dat")
        
        if manager!.isDeletableFile(atPath: path.absoluteString) {
            print("File is deletable")
        } else {
            print("Deleting specified file is denided")
        }
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
        /// Вернет строку, содержащую полное имя текущего пользователя
        
        print(NSFullUserName())
    }
    
    private func _NSHomeDirectory() {
        /// Вернет путь домашней директории либо пользователя либо приложения. Зависит от платформы
        
        print(NSHomeDirectory())
    }
    
    private func _NSHomeDirectoryForUser() {
        /// Вернет путь к домашней директории заданного пользователя
        
        let userName = "RootUser"
        
        if let directory = NSHomeDirectoryForUser(userName) {
            print(directory)
        } else {
            print("HomeDirectory doesn't exist for specified user")
        }
    }
    
    private func _NSOpenStepRootDirectory() {
        /// Вернет рут директорию пользователя системы
        
        print(NSOpenStepRootDirectory())
    }
    
    //TODO: сделать проверку всех возможных путей
    private func _NSSearchPathForDirectoriesInDomains() {
        /// Создаст список путей к директории поиска
        /// Директория, которую вернул этот метод, может не существовать. Этот метод просто отдает соответствующую локацию для запрошеной директории. В зависимости от нужд приложения, создание соответствующей директории и любых поддиректорий может быть на усмотрения разработчика
        
        let directory: FileManager.SearchPathDirectory = .cachesDirectory
        let domainMask: FileManager.SearchPathDomainMask = .userDomainMask
        let shouldExpand = true
        
        let pathes = NSSearchPathForDirectoriesInDomains(directory, domainMask, shouldExpand)
        pathes.forEach { print($0) }
    }
    
    private func _NSTemporaryDirectory() {
        /// Вернет путь к временной директории для текущего пользователя
        
        print(NSTemporaryDirectory())
    }
    
    private func _NSUserName() {
        /// Returns the logon name of the current user
        /// Вернет залогиненое имя текущего пользователя
        
        print(NSUserName())
    }
}
