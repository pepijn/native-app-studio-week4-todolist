//
//  ViewController.swift
//  ToDoList
//
//  Created by Pepijn Looije on 20/11/15.
//  Copyright © 2015 Pepijn Looije. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var todoInput: UITextField!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("unfinishedTodoItem")!
        cell.textLabel!.text = TodoItemList.sharedInstance.todoItems[indexPath.row].text
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoItemList.sharedInstance.todoItems.count
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let item = TodoItemList.sharedInstance.todoItems[indexPath.row]
        TodoItemList.sharedInstance.removeItem(item)
        tableView.reloadData()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let newItem = TodoItem.init(text: todoInput.text!)
        TodoItemList.sharedInstance.addItem(newItem)
        tableView.reloadData()
        todoInput.text! = ""
        return true
    }
}