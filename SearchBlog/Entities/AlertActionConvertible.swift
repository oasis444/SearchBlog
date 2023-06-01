//
//  AlertActionSheet.swift
//  SearchBlog
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
