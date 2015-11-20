//
//  TodoItemList.swift
//  ToDoList
//
//  Created by Pepijn Looije on 20/11/15.
//  Copyright © 2015 Pepijn Looije. All rights reserved.
//

import Foundation

class TodoItemList {
    static let sharedInstance = TodoItemList()
    private let defaultsKey = "todo_items"

    var todoItems: [TodoItem] {
        var tempItems = [TodoItem]()
        for itemText in todoItemTexts() {
            let item = TodoItem.init(text: itemText)
            tempItems.append(item)
        }
        return tempItems
    }

    func todoItemTexts() -> [String] {
        let items = NSUserDefaults.standardUserDefaults().valueForKey(defaultsKey)
        if items == nil {
            let items = [String]()
            setItemTexts(items)
            return items
        }
        return items as! [String]
    }

    func setItemTexts(itemTexts: [String]) {
        NSUserDefaults.standardUserDefaults().setObject(itemTexts, forKey: defaultsKey)
    }

    func addItem(item: TodoItem) {
        var items = todoItemTexts()
        items.insert(item.text, atIndex: 0)
        setItemTexts(items)
    }

    func removeItem(item: TodoItem) {
        var items = todoItemTexts()
        items.removeAtIndex(items.indexOf(item.text)!)
        setItemTexts(items)
    }
}