//
//  TableViewControllerInterface.swift
//  TableMVC
//
//  Created by Vyacheslav Khorkov on 17/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import UIKit

protocol TableViewControllerInterface: class, BaseTableModelDelegate, TableDelegateManager {
	
	associatedtype Model: BaseTableModel
	associatedtype Datasource: BaseTableDatasource
	associatedtype Delegate: BaseTableDelegate
	
	var tableView: UITableView! { get set }
	var model: Model { get set }
	var tableDatasource: Datasource { get set }
	var tableDelegate: Delegate { get set }
	
}

extension TableViewControllerInterface {

	func tableModelDidUpdated(_ model: BaseTableModel) {
		tableDatasource.cellModels = model.cellModels
		tableView.reloadData()
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

extension TableViewControllerInterface {
	
	func build() {
		tableView.dataSource = tableDatasource
		tableView.delegate = tableDelegate
		
		tableDatasource.cellModels = model.cellModels
		tableDelegate.cellModels = model.cellModels
		
		model.delegate = self
		tableDelegate.delegate = self
	}
	
}
