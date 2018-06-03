//
//  MyView.swift
//  Elm
//
//  Created by ShengHua Wu on 03.06.18.
//  Copyright © 2018 ShengHua Wu. All rights reserved.
//

import UIKit

final class MyTextCell: UITableViewCell {
    let titleLabel: UILabel
    
    init(titleLabel: UILabel) {
        self.titleLabel = titleLabel
        
        super.init(style: .default, reuseIdentifier: nil)
        
        self.contentView.addSubview(self.titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel.frame = self.contentView.bounds
    }
}

final class MyTableViewDataSource: NSObject, UITableViewDataSource {
    let cells: [MyTextCell]
    
    init(cells: [MyTextCell]) {
        self.cells = cells
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
}

final class MyTableViewController: UITableViewController {
    let cells: [MyTextCell]
    
    init(cells: [MyTextCell]) {
        self.cells = cells
        
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
}
