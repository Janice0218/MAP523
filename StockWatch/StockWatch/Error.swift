//
//  Error.swift
//  StockWatch
//
//  Created by Edmel John Ricahuerta on 2018-08-13.
//  Copyright © 2018 com.senecac.map. All rights reserved.
//

import Foundation

enum StockError : Error{
    case notFound
    case emptyStock
    case intervalError
}
