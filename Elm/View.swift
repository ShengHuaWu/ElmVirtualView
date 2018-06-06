//
//  View.swift
//  Elm
//
//  Created by ShengHua Wu on 03.06.18.
//  Copyright © 2018 ShengHua Wu. All rights reserved.
//

import UIKit

enum View {
    case tableView(TableView)
    case textCell(TextCell)
    case label(Label)
    case button(Button)
    case buttonCell(ButtonCell)
}

struct Button {
    let label: Label
    let backgroundColor: UIColor
    
    init(label: Label, backgroundColor: UIColor = .gray) {
        self.label = label
        self.backgroundColor = backgroundColor
    }
}

struct Label {
    let text: String
    let textColor: UIColor
    
    init(text: String, textColor: UIColor = .black
        ) {
        self.text = text
        self.textColor = textColor
    }
}

class ButtonCell: TextCell {
    let button: Button
//    let backgroundColor: UIColor
    
    init(button: Button, backgroundColor: UIColor = .white) {
        self.button = button
        super.init(label: Label.init(text: ""), backgroundColor: backgroundColor)
    }
}

class TextCell {
    let label: Label
    let backgroundColor: UIColor
    
    init(label: Label, backgroundColor: UIColor = .white) {
        self.label = label
        self.backgroundColor = backgroundColor
    }
}

struct TableView {
    let cells: [TextCell]
    let separatorStyle: UITableViewCellSeparatorStyle
    let rowHeight: CGFloat
    
    init(cells: [TextCell], separatorStyle: UITableViewCellSeparatorStyle = .singleLine, rowHeight: CGFloat = 44) {
        self.cells = cells
        self.separatorStyle = separatorStyle
        self.rowHeight = 44
    }
}
