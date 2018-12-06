//
//  ViewController.swift
//  playSwift
//
//  Created by Gan Jun Jie on 06/12/2018.
//  Copyright © 2018 Gan Jun Jie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var searchBar: UISearchBar!
    var originalListOfFonts:[String] = UIFont.familyNames.flatMap { familyName -> [String] in
        return UIFont.fontNames(forFamilyName: familyName)
    }.sorted()
    
    var listOfFonts:[String] {
        get {
            if let searchText = searchBar.text, searchText.count > 0 {
                return originalListOfFonts.filter({ (each) -> Bool in
                    return each.contains(searchText)
                })
            }
            return originalListOfFonts
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textView.text = "我量蘭重，國極種不是明童強命在有道用？為的學技精無年服小……思認信葉電水眼，然作體心日求立興大運高女！寫關給然經文結方裡怎，們底們以獲都！況三至和一便西中年長點原運絕吃上正……是念小園雲驗學，地蘭是不：來認麼教如然師難育位種男是但心做力領同引的雄金感施速管許；想自無樂集年於如解，斯南了喜歌，壓狀朋黑，外風什畫造裡式在野化愛點等展都還陸衣許，校價舉她著國病爸常人別，改和文你應節？通來計前山己報工他，快之但華談變從人山，體德的室；過不可有……有樣次下遊年客別況向、深科為媽力。\n\n直南文之直我食本男了了鄉出，巴例最出死海有教吃海的陸利我海話但期達。"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfFonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfFonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let font = listOfFonts[row]
        print("Selecting component: \(component) and row: \(row) for font: \(font)")
        self.textView.font = UIFont(name: font, size: 17)
    }
    
    private func reload(){
        self.picker.reloadAllComponents()
        if listOfFonts.count>0 {
            self.picker.selectRow(0, inComponent: 0, animated: false)
            self.textView.font = UIFont(name: listOfFonts.first!, size: 17)
        }
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        self.reload()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.reload()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.reload()
    }

}

