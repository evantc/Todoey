//
//  Item.swift
//  Todoey
//
//  Created by EvanC on 2018/11/30.
//  Copyright © 2018 EvanC. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    
    @objc dynamic var done: Bool = false
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
