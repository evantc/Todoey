//
//  Category.swift
//  Todoey
//
//  Created by EvanC on 2018/11/30.
//  Copyright © 2018 EvanC. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""

    let items = List<Item>()
}
