//
//  DocumentPreview.swift
//  assignment2
//
//  Created by Nicholas Sparrow on 10/3/16.
//  Copyright © 2016 Nicholas Sparrow. All rights reserved.
//

import Cocoa
import Quartz

class DocumentPreview: NSTableView {
    
    func extractAndBreakFilenameInComponents(fileURL: NSURL) -> (fileName: String, fileExtension: String) {
        // Break the NSURL path into its components and create a new array with those components.
        let fileURLParts = fileURL.path!.componentsSeparatedByString("/")
        
        // Get the file name from the last position of the array above.
        let fileName = fileURLParts.last
        
        // Break the file name into its components based on the period symbol (".").
        let filenameParts = fileName?.componentsSeparatedByString(".")
        
        // Return a tuple.
        return (filenameParts![0], filenameParts![1])
    }
    
//    func tableView(tableView: NSTableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> NSTableCellView {
//        let cell = tableView.cell
//        let currentFileParts = extractAndBreakFilenameInComponents(pdfDocuments[1].documentURL())
//        
//        cell.textField = currentFileParts.fileName
//        
//        return cell
//    }
    
}
