//
//  UITableView+Reusable.swift
//  TableMVC
//
//  Created by Vyacheslav Khorkov on 16/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import UIKit

extension UITableView {
	
	final func register<T: UITableViewCell>(type: T.Type) where T: NibReusable {
		register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
	}
	
	final func register<T: UITableViewCell>(type: T.Type) where T: Reusable {
		register(type.self, forCellReuseIdentifier: type.reuseIdentifier)
	}	
}
