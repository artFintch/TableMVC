//
//  BaseTableModel.swift
//  TableMVC
//
//  Created by Vyacheslav Khorkov on 17/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

protocol BaseTableModelDelegate: class {
	
	func tableModelDidUpdated(_ model: BaseTableModel)
	func tableModel(_ model: BaseTableModel, updatingWasFailedWithError error: Error)
}

class BaseTableModel: NSObject {
	
	weak var delegate: BaseTableModelDelegate?
	var cellModels: [CellModelInterface] = []
	
	func handleRowSelection(at indexPath: IndexPath) {}
}
