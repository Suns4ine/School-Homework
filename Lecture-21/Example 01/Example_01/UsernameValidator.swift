//
//  UsernameValidator.swift
//  Example_01
//
//  Created by Aleksandr Sychev on 18/11/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

struct UsernameValidator {
	func isValid(_ username: String) -> Bool {
		return username.count > 4
	}
}
