//
//  ViewController.swift
//  Elm
//
//  Created by ShengHua Wu on 02.06.18.
//  Copyright © 2018 ShengHua Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let r = Render() // Keep the reference of table view data source
    let subview = View.tableView(TableView(cells: [
        TextCell(label: Label(text: "1")),
        TextCell(label: Label(text: "2")),
        TextCell(label: Label(text: "3")),
        TextCell(label: Label(text: "4")),
        TextCell(label: Label(text: "5"))
        ]))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = r.render(view: subview)
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
}

