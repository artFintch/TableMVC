//
//  TableViewControllerInterface.swift
//  TableMVC
//
//  Created by Vyacheslav Khorkov on 17/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import UIKit

protocol TableViewControllerInterface: class, BaseTableModelDelegate {
	
	associatedtype TableView: UITableView
	associatedtype Model: BaseTableModel
	associatedtype Datasource: BaseTableDatasource
	associatedtype Delegate: BaseTableDelegate
	
	var tableView: TableView! { get set }
	var model: Model { get }
	var tableDatasource: Datasource { get }
	var tableDelegate: Delegate { get }
	
}

extension TableViewControllerInterface {

	func tableModelDidUpdated(_ model: BaseTableModel, indexPaths: [IndexPath]) {
		for indexPath in indexPaths {
			guard let baseCell = tableView.cellForRow(at: indexPath) as? BaseCell else { continue }
			if model.cellModels.count <= indexPath.row { continue }
			let cellModel = model.cellModels[indexPath.row]
			baseCell.configure(withModel: cellModel, animated: true)
		}
	}
	
	func tableModel(_ model: BaseTableModel, updatingWasFailedWithError error: Error) {
		// Present alert with error, etc.
	}
	
}

extension TableViewControllerInterface {
	
	func tableDelegate(_ delegate: BaseTableDelegate, didSelectRowAt indexPath: IndexPath) {
		model.handleRowSelection(at: indexPath)
	}
	
}

extension TableViewControllerInterface where Self: UIViewController {
	
	func build() {
		tableView.dataSource = tableDatasource
		tableView.delegate = tableDelegate
		
		tableDatasource.model = model
		
		tableDelegate.model = model
		tableDelegate.viewController = self
		
		model.delegate = self
	}
	
}
