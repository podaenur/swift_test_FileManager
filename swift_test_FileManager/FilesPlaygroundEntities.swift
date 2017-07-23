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
        let sense = ["Accessing User Directories",
                     "Locating System Directories",
                     "Locating Application Group Container Directories",
                     "Discovering Directory Content",
                     "Creating And Deleting Items",
                     "Moving And Copying Items",
                     "Managing iCloud Based Items",
                     "Creating Symbolic And Hard Links",
                     "Determining Access To Files",
                     "Getting And Setting Attributes",
                     "Getting And Comparing File Content",
                     "Getting The Relationship Between Items",
                     "Converting File Paths To Strings",
                     "Managing The Current Directory",
                     "Constants",
                     "File Path Functions"]
        return sense[self.rawValue]
    }
}
