//
//  ViewController.swift
//  Highlightr-iOS
//
//  Created by Aaron Vegh on 2016-06-01.
//  Copyright © 2016 Aaron Vegh. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    @IBOutlet var editorView: UITextView!
    var textStorage = CodeAttributedString()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let sampleDocPath = NSBundle(forClass: self.dynamicType).pathForResource("swift-sample", ofType: "txt") else { return }
        let codeString = try! NSString(contentsOfFile: sampleDocPath, encoding: NSUTF8StringEncoding)

        textStorage.setAttributedString(NSAttributedString(string: codeString as String))
        textStorage.language = "Swift"
        textStorage.highlightr.setTheme("dark")
        textStorage.highlightr.theme.codeFont = UIFont(name: "Hack-Regular", size: 14)

        let bgColor = textStorage.highlightr.theme.themeBackgroundColor as UIColor
        editorView.backgroundColor = bgColor
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        bgColor.getRed(&r, green: &g, blue: &b, alpha: &a)


        editorView.layoutManager.textStorage = textStorage
    }
}

