//
//  AppDelegate.swift
//  assignment2
//
//  Created by Nicholas Sparrow on 9/28/16.
//  Copyright © 2016 Nicholas Sparrow. All rights reserved.
//

import Cocoa
import Quartz

@NSApplicationMain
class AppDelegate: DocTable, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var numPages: NSTextField!
    @IBOutlet weak var currentPage: NSTextFieldCell!
    @IBOutlet weak var documents: NSView!
    
    @IBOutlet weak var expandConstraint: NSLayoutConstraint!    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let c = NSNotificationCenter.defaultCenter()
        c.addObserverForName(PDFViewPageChangedNotification, object: pdfView, queue: nil) { notification in
            self.currentPage.stringValue = "\(self.pdfView.document().indexForPage(self.pdfView.currentPage()) + 1)"
        }
        c.addObserverForName(NSControlTextDidChangeNotification, object: currentPage, queue: nil) { notification in
            let object = notification.object as! NSTextField
            if (object.integerValue > 0 && object.integerValue < self.numPages.integerValue) {
                self.pdfView.goToPage(self.pdfView.document().pageAtIndex(object.integerValue - 1))
            }
        }
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func showPDF(sender: NSMenuItem) {
        let panel = NSOpenPanel()
        panel.beginSheetModalForWindow(pdfView.window!, completionHandler: { (returnCode)-> Void in
            if returnCode == NSModalResponseOK {
                let pdfDoc: PDFDocument = PDFDocument(URL: panel.URL!)
                self.pdfView.setDocument(pdfDoc)
                if (!super.pdfDocuments.contains(pdfDoc)) {
                    super.pdfDocuments.append(pdfDoc)
                }
                self.numPages.stringValue = " of \(pdfDoc.pageCount())"
                let newBut = NSButton(frame: NSRect(x: 5, y: 5, width: 195, height: 30))
                //self.y -= 30
                newBut.title = pdfDoc.documentURL().lastPathComponent!
                self.documents.addSubview(newBut)
                //super.documentTable.reloadData()
            } } )
        
    }
    
    
    @IBAction func expandingView(sender: NSButton) {
        if (expandConstraint.constant > 0){
            expandConstraint.constant = 0
        }
        else{
            expandConstraint.constant = 90
        }
        
    }
    
    @IBAction func zoomIn(sender: NSButton) {
        pdfView.zoomIn(sender)
    }
    
    @IBAction func zoomOut(sender: NSButton) {
        pdfView.zoomOut(sender)
    }    
}

