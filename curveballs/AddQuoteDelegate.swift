//
//  addQuoteDelegate.swift
//  curveballs
//
//  Created by Omar Ihmoda on 1/25/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import Foundation

protocol AddQuoteDelegate: class {
    func addQuote(by: AddQuoteViewController, data: NewQuote)
}
