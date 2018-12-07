//
//  ViewModel.swift
//  playSwift
//
//  Created by Gan Jun Jie on 07/12/2018.
//  Copyright © 2018 Gan Jun Jie. All rights reserved.
//

import ReactiveSwift

class ViewModel : NSObject {
    
    let viewText:String
    var searchText:MutableProperty<String>
    
    var originalListOfFonts:[String] = UIFont.familyNames.flatMap { familyName -> [String] in
        return UIFont.fontNames(forFamilyName: familyName)
        }.sorted()
    
    var listOfFonts:[String]
    
    init(service: Any) {
        //self.services = services
        viewText = "我量蘭重，國極種不是明童強命在有道用？為的學技精無年服小……思認信葉電水眼，然作體心日求立興大運高女！寫關給然經文結方裡怎，們底們以獲都！況三至和一便西中年長點原運絕吃上正……是念小園雲驗學，地蘭是不：來認麼教如然師難育位種男是但心做力領同引的雄金感施速管許；想自無樂集年於如解，斯南了喜歌，壓狀朋黑，外風什畫造裡式在野化愛點等展都還陸衣許，校價舉她著國病爸常人別，改和文你應節？通來計前山己報工他，快之但華談變從人山，體德的室；過不可有……有樣次下遊年客別況向、深科為媽力。\n\n直南文之直我食本男了了鄉出，巴例最出死海有教吃海的陸利我海話但期達。"
        searchText = MutableProperty("")
        listOfFonts = originalListOfFonts
        super.init()
        searchText.signal.observeValues { [weak self] string in
            if let weakSelf = self {
                if string.count > 0 {
                    let lowerCasedSearchText = string.lowercased()
                    weakSelf.listOfFonts = weakSelf.originalListOfFonts.filter({ (each:String) -> Bool in
                        return each.lowercased().contains(lowerCasedSearchText)
                    })
                } else {
                    weakSelf.listOfFonts = weakSelf.originalListOfFonts
                }
            }
        }
    }
    
    func getFontsCount() -> Int {
        return listOfFonts.count
    }
    
    func getFont(forIndex index:Int) -> String {
        guard index < listOfFonts.count else {
            return "ERROR"
        }
        return listOfFonts[index]
    }
    
    
}


