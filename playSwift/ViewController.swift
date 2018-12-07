//
//  ViewController.swift
//  playSwift
//
//  Created by Gan Jun Jie on 06/12/2018.
//  Copyright © 2018 Gan Jun Jie. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift
import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel : ViewModel = ViewModel(service: "")
    
    private func bindViewModel() {
        textView.text = viewModel.viewText
        viewModel.searchText <~ searchBar.reactive.continuousTextValues.skipNil().skipRepeats()
        viewModel.searchText.signal.observeValues { [weak self] string in
            if let weakSelf = self {
                weakSelf.picker.reloadAllComponents()
                if weakSelf.viewModel.getFontsCount() > 0 {
                    weakSelf.picker.selectRow(0, inComponent: 0, animated: false)
                    weakSelf.textView.font = UIFont(name: weakSelf.viewModel.getFont(forIndex: 0), size: 17)
                }
            }
        }
        picker.reactive.selections.observeValues { [weak self] (row: Int, component: Int) in
            if let weakSelf = self {
                let font = weakSelf.viewModel.getFont(forIndex: row)
                weakSelf.textView.font = UIFont(name: font, size: 17)
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bindViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.getFontsCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.getFont(forIndex: row)
    }
    
    private func reload(){
    }
    
}

