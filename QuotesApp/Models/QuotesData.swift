//
//  QuotesData.swift
//  QuotesApp
//
//  Created by IME Macmini on 15/05/2021.
//

import Foundation

struct QuotesData: Codable {
    let id: Int
    let created_by: Int
    let title: String
    let description: String
    let type: Int
}
