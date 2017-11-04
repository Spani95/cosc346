//
//  DocTable.swift
//  assignment2
//
//  Created by Nicholas Sparrow on 10/5/16.
//  Copyright © 2016 Nicholas Sparrow. All rights reserved.
//

import Cocoa
import Quartz

class DocTable: NSObject, NSTableViewDataSource,NSTableViewDelegate {
    
    @IBOutlet weak var documentTable: NSTableView!
    var pdfDocuments = [PDFDocument]()
    
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int
    {
        return pdfDocuments.count
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject?
    {
        let newButton: NSButton = NSButton()
        newButton.stringValue = extractFilename(pdfDocuments[row])
        newButton.identifier = "document"
        let newString = extractFilename(pdfDocuments[row])
        return newButton;
    }
 
    /*
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        // get the item for the row
        let document = pdfDocuments[row]
    
        // get the NSTableCellView for the column
        let result : NSTableCellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        
        if (result == nil) {
            NSTableCellView *view = [[NSTableCellView alloc]initWithFrame:[tableView frame]];
            view.identifier = [tableColumn identifier];
        }
        
        // set the string value of the text field in the NSTableCellView
        result.fileName.stringValue = extractFilename(document)
        
        // return the populated NSTableCellView
        return result
        
    }*/
    
    func extractFilename(doc: PDFDocument) -> String {
        // Break the NSURL path into its components and create a new array with those components.
        let fileURL = doc.documentURL().path!.componentsSeparatedByString("/")
        // Get the file name from the last position of the array above.
        let fileName = fileURL.last
        return fileName!
    }
    
    func getDataArray () -> NSArray{
        let dataArray:[NSDictionary] = [["FirstName": "Debasis", "LastName": "Das"],
                                        ["FirstName": "Nishant", "LastName": "Singh"],
                                        ["FirstName": "John", "LastName": "Doe"],
                                        ["FirstName": "Jane", "LastName": "Doe"]];
        return dataArray;
    }
    
}