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
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(style: .default, reuseIdentifier: nil)
        
        self.contentView.addSubview(self.titleLabel)
        
        self.contentView.addConstraints([
            self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

final class MyTableViewDataSource: NSObject, UITableViewDataSource {
    private let numberOfRowsInSection: (Int) -> Int
    private let cellForRowAtIndexPath: (IndexPath) -> UITableViewCell
    
    init(numberOfRowsInSection: @escaping (Int) -> Int, cellForRowAtIndexPath: @escaping (IndexPath) -> UITableViewCell) {
        self.numberOfRowsInSection = numberOfRowsInSection
        self.cellForRowAtIndexPath = cellForRowAtIndexPath
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRowAtIndexPath(indexPath)
    }
}
