//
//  FilesPlaygroundEntities.swift
//  swift_test_FileManager
//
//  Created by Evgeniy Akhmerov on 26/06/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import Foundation

enum Methods: Int, RawRepresentable {
    case accessingUserDirectories = 0
    case locatingSystemDirectories
    case locatingApplicationGroupContainerDirectories
    case discoveringDirectoryContent
    case creatingAndDeletingItems
    case movingAndCopyingItems
    case managingICloudBasedItems
    case creatingSymbolicAndHardLinks
    case determiningAccessToFiles
    case gettingAndSettingAttributes
    case gettingAndComparingFileContent
    case gettingTheRelationshipBetweenItems
    case convertingFilePathsToStrings
    case managingTheCurrentDirectory
    case constants
    case filePathFunctions
    
    //MARK: - RawRepresentable
    
    typealias RawValue = String
    
    init?(rawValue: String) {
        switch rawValue {
        case "Accessing User Directories":                          self = .accessingUserDirectories
        case "Locating System Directories":                         self = .locatingSystemDirectories
        case "Locating Application Group Container Directories":    self = .locatingApplicationGroupContainerDirectories
        case "Discovering Directory Content":                       self = .discoveringDirectoryContent
        case "Creating And Deleting Items":                         self = .creatingAndDeletingItems
        case "Moving And Copying Items":                            self = .movingAndCopyingItems
        case "Managing iCloud Based Items":                         self = .managingICloudBasedItems
        case "Creating Symbolic And Hard Links":                    self = .creatingSymbolicAndHardLinks
        case "Determining Access To Files":                         self = .determiningAccessToFiles
        case "Getting And Setting Attributes":                      self = .gettingAndSettingAttributes
        case "Getting And Comparing File Content":                  self = .gettingAndComparingFileContent
        case "Getting The Relationship Between Items":              self = .gettingTheRelationshipBetweenItems
        case "Converting File Paths To Strings":                    self = .convertingFilePathsToStrings
        case "Managing The Current Directory":                      self = .managingTheCurrentDirectory
        case "Constants":                                           self = .constants
        case "File Path Functions":                                 self = .filePathFunctions
        default: return nil
        }
    }
    
    var rawValue: String {
        switch self {
        case .accessingUserDirectories:                     return "Accessing User Directories"
        case .locatingSystemDirectories:                    return "Locating System Directories"
        case .locatingApplicationGroupContainerDirectories: return "Locating Application Group Container Directories"
        case .discoveringDirectoryContent:                  return "Discovering Directory Content"
        case .creatingAndDeletingItems:                     return "Creating And Deleting Items"
        case .movingAndCopyingItems:                        return "Moving And Copying Items"
        case .managingICloudBasedItems:                     return "Managing iCloud Based Items"
        case .creatingSymbolicAndHardLinks:                 return "Creating Symbolic And Hard Links"
        case .determiningAccessToFiles:                     return "Determining Access To Files"
        case .gettingAndSettingAttributes:                  return "Getting And Setting Attributes"
        case .gettingAndComparingFileContent:               return "Getting And Comparing File Content"
        case .gettingTheRelationshipBetweenItems:           return "Getting The Relationship Between Items"
        case .convertingFilePathsToStrings:                 return "Converting File Paths To Strings"
        case .managingTheCurrentDirectory:                  return "Managing The Current Directory"
        case .constants:                                    return "Constants"
        case .filePathFunctions:                            return "File Path Functions"
        }
    }
}
