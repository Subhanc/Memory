//
//  Array+Chunks.swift
//  Shopify
//
//  Created by Subhan Chaudhry on 2019-12-01.
//  Copyright © 2019 Subhan Chaudhry. All rights reserved.
//

import Foundation

extension Array {
    func chunk(into size: Int) -> [[Element]] {
        return stride(from: 0, through: self.count-1, by: size).map { element in
            var upper = element + size
            upper -= upper > self.count ? 1 : 0
            return Array(self[element..<upper])
        }
    }
}
