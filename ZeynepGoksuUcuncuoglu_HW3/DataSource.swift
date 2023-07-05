//
//  DataSource.swift
//  CTIS480_Fall2223_HW3
//
//  Created by Syed Ali on 12/2/22.
//  Copyright © 2022 CTIS. All rights reserved.
//

import Foundation

class DataSource {
    var mRecordList: [Record] = []
    var categories: [String] = []
    //var mRecordList2: [Record] = []
    
    func numbeOfItemsInEachCategory(index: Int) -> Int {
        return itemsInCategory(index: index).count
    }
    
    func numberOfCategories() -> Int {
        return categories.count
    }
    
    func getCategoryLabelAtIndex(index: Int) -> String {
        return categories[index]
    }
    
    // MARK: - Populate Data from files
    func populate(type: String) {
        if type.lowercased() == "json" {
            if let mURL = URL(string: "http://syedali.bilkent.edu.tr/480/data.json") {
                if let data = try? Data(contentsOf: mURL) {
                    // https://www.dotnetperls.com/guard-swift
                    guard let json = try? JSON(data: data) else {
                        print("Error with JSON")
                        return
                    }
                    //print(json)
                    
                    for index in 0..<json["items"].count {
                        let name = json["items"][index]["name"].string!
                        let category = json["items"][index]["category"].string!
                        let description = json["items"][index]["description"].string!
                        let image = json["items"][index]["image"].string!
                        
                        let mRecord = Record(name: name, category: category, description: description, image: image)
                        mRecordList.append(mRecord)
                        
                        if !categories.contains(category) {
                            categories.append(category)
                        }
                    }
                }
                else {
                    print("Data error")
                }
            }
            else {
                
            }
        }else{
            if let rssURL = URL(string: "http://syedali.bilkent.edu.tr/480/data.xml") {
                if let xmlToParse = try? Data(contentsOf: rssURL) {
                    
                    let xml = SWXMLHash.parse(xmlToParse)
                    //print(xml)

                    for item in xml["main"]["item"].all {
                        let name = item["name"].element!.text
                        let description = item["description"].element!.text
                        let category = item["category"].element!.text
                        let image = item["image"].element!.text
                        let mRecord = Record(name: name, category: category, description: description, image: image)
                        //print(mRecord.name)
                        mRecordList.append(mRecord)
                      
                        
                        if !categories.contains(category) {
                            categories.append(category)
                        }
                        
                    }
                }
            }
        }
    }

        
        // MARK: - itemsForEachGroup
        func itemsInCategory(index: Int) -> [Record] {
            let item = categories[index]
            
            // See playground6 for Closure
            // http://locomoviles.com/uncategorized/filtering-swift-array-dictionaries-object-property/
            
            let filteredItems = mRecordList.filter { (record: Record) -> Bool in
                return record.category == item
            }
            return filteredItems
        }
    }
