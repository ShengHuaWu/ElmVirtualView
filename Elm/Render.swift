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
        case let .tableView(tableView):
            // TODO: Let data source to create the cells
            let uiTextCells = tableView.cells.map { render(view: .textCell($0)) } as! [MyTextCell]
            let dataSource = MyTableViewDataSource(cells: uiTextCells)
            let uiTableView = UITableView(frame: .zero, style: .plain)
            uiTableView.dataSource = dataSource
            strongReferences.append(dataSource)
            render(tableView: tableView, into: uiTableView)
            return uiTableView
        }
    }
}

extension Render {
    private func render(label: Label, into uiLabel: UILabel) {
        uiLabel.text = label.text
        uiLabel.textColor = label.textColor
    }
    
    private func render(textCell: TextCell, into uiTextCell: MyTextCell) {
        uiTextCell.backgroundColor = textCell.backgroundColor
    }
    
    private func render(tableView: TableView, into uiTableView: UITableView) {
        uiTableView.separatorStyle = tableView.separatorStyle
    }
}
