//
//  Model.swift
//  Easymeter
//
//  Created by Tsani Chico Bragi on 25/06/24.
//

import Foundation

enum Model: String, CaseIterable, Identifiable {
    case cmToM = "cm to m"
    case mToCm = "m to cm"
    
    var id: String { self.rawValue }
}

struct Conversion {
    let input: Double
    let conversionType: Model
    
    var output: Double {
        switch conversionType {
        case .cmToM:
            return input / 100
        case .mToCm:
            return input * 100
        }
    }
}

