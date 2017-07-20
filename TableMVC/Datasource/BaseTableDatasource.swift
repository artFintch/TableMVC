//
//  BaseTableDatasource.swift
//  TableMVC
//
//  Created by Vyacheslav Khorkov on 17/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import UIKit

class BaseTableDatasource: NSObject, UITableViewDataSource {
	
	weak var model: BaseTableModel?
	
	private var cellModels: [CellModelInterface] {
		return model?.cellModels ?? []
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cellModels.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = cellModels[indexPath.row]
		
		let reuseIdentifier = model.reuseIdentifier
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? BaseCell
		cell?.configure(withModel: model)
		
		return cell!
	}
	
}
