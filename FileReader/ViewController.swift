//
//  ViewController.swift
//  FileReader
//
//  Created by Mark Meretzky on 1/7/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//
//  Print a random name each time this app is run.
//  To create this project in Xcode:
//  Pull down File -> New -> File...
//  Choose a template for your new file: iOS
//  Scroll down, select Empty, and press Next.
//  Save As: names.txt
//  Press Create.
//  You should see the new file names.txt in the Project Navigator.
//  Select names.tet in the Project Navigator.
//  Edit this file in the Standard Editor in the central Xcode window.
//

import UIKit;

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!;  //Display the random name in this label.
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        let bundle: Bundle = Bundle.main;
        guard let filename: String = bundle.path(forResource: "names", ofType: "txt") else {
            print("couldn't find file states.txt");
            return;
        }
        
        print("filename = \(filename)");
        print();
        
        do {
            let contentsOfFile: String = try String(contentsOfFile: filename, encoding: .utf8);
            var names: [String] = contentsOfFile.components(separatedBy: "\n");
            names = names.filter {!$0.isEmpty}   //Remove the empty names (e.g., the last one).
            print("Read \(names.count) non-empty names.");
            let r: Int = Int.random(in: 0 ..< names.count);
            label.text = names[r];
        } catch {
            print("couldn't read file names.txt: \(error)");
        }
    }
    
}

