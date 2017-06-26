//
//  FilesPlaygroundEntities.swift
//  swift_test_FileManager
//
//  Created by Evgeniy Akhmerov on 26/06/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import Foundation

enum Methods: Int {
    //  16 cases
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
    
    var stringValue: String {
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
