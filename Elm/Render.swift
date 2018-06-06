//
//  Render.swift
//  Elm
//
//  Created by ShengHua Wu on 03.06.18.
//  Copyright © 2018 ShengHua Wu. All rights reserved.
//

import UIKit

final class Render {
    var strongReferences: [Any] = []
    
    func render(view: View) -> UIView {
        switch view {
        case let .label(label):
            let uiLabel = UILabel()
            render(label: label, into: uiLabel)
            return uiLabel
        case let .textCell(textCell):
            let titleLabel = render(view: .label(textCell.label)) as! UILabel
            let uiTextCell = MyTextCell(titleLabel: titleLabel)
            render(textCell: textCell, into: uiTextCell)
            return uiTextCell
        case let .button(button):
            let uiButton = UIButton(type: .custom)
            render(button: button, into: uiButton)
            return uiButton
        case let .buttonCell(buttonCell):
            let button = render(view: .button(buttonCell.button)) as! UIButton
            let uiButtonCell = MyButtonCell(button: button)
            render(buttonCell: buttonCell, into: uiButtonCell)
            return uiButtonCell
        case let .tableView(tableView):
            let dataSource = MyTableViewDataSource(numberOfRowsInSection: { _ in return tableView.cells.count }, cellForRowAtIndexPath: { [unowned self] indexPath in
                return self.render(view: .textCell(tableView.cells[indexPath.row])) as! UITableViewCell
            })
            let uiTableView = UITableView(frame: .zero, style: .plain)
            uiTableView.dataSource = dataSource
            strongReferences.append(dataSource)
            render(tableView: tableView, into: uiTableView)
            return uiTableView
        }
    }
}

extension Render {
    
    private func render(buttonCell: ButtonCell, into uiButtonCell: MyButtonCell) {
        uiButtonCell.backgroundColor = uiButtonCell.backgroundColor
    }
    
    private func render(button: Button, into uiButton: UIButton) {
        uiButton.setTitle(button.label.text, for: .normal)
        uiButton.setTitleColor(button.label.textColor, for: .normal)
    }
    
    private func render(label: Label, into uiLabel: UILabel) {
        uiLabel.text = label.text
        uiLabel.textColor = label.textColor
    }
    
    private func render(textCell: TextCell, into uiTextCell: MyTextCell) {
        uiTextCell.backgroundColor = textCell.backgroundColor
    }
    
    private func render(tableView: TableView, into uiTableView: UITableView) {
        uiTableView.separatorStyle = tableView.separatorStyle
        uiTableView.rowHeight = tableView.rowHeight
    }
}
