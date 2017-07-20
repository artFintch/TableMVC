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

	func tableModelDidUpdated(_ model: BaseTableModel) {
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
		
		tableDatasource.model = model
		tableDelegate.model = model
		
		model.delegate = self
	}
	
}
