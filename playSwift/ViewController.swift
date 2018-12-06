//
//  ViewController.swift
//  playSwift
//
//  Created by Gan Jun Jie on 06/12/2018.
//  Copyright © 2018 Gan Jun Jie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var picker: UIPickerView!
    var listOfFonts:[String] = UIFont.familyNames.sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textView.text = "你好"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return listOfFonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UIFont.fontNames(forFamilyName: listOfFonts[component]).count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UIFont.fontNames(forFamilyName: listOfFonts[component])[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let font = UIFont.fontNames(forFamilyName: listOfFonts[component])[row]
        print("Selecting component: \(component) and row: \(row) for font: \(font)")
        self.textView.font = UIFont(name: font, size: 17)
    }

}

