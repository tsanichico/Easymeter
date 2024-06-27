//
//  ViewModel.swift
//  Easymeter
//
//  Created by Tsani Chico Bragi on 25/06/24.
//


//import Combine
import Foundation

class ViewModel: ObservableObject {
    @Published var input: String = ""
    @Published var conversionType: Model = .cmToM
    @Published var result: String = ""
    
    private func formatNumber(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    
    func calculateResult() {
        let commaInput = input.replacingOccurrences(of: ",", with: ".")
        
        guard let inputValue = Double(commaInput) else {
            result = "Invalid input"
            return
        }
        
        var convertedValue: Double = 0.0
        let inputUnit: String
        let outputUnit: String
        
        switch conversionType {
        case .cmToM:
            convertedValue = inputValue / 100
            inputUnit = "centimeter"
            outputUnit = "meter"
        case .mToCm:
            convertedValue = inputValue * 100
            inputUnit = "meter"
            outputUnit = "centimeter"
        }
        let formattedInputValue = formatNumber(inputValue)
        let formattedConvertedValue = formatNumber(convertedValue)
        
        result = "\(formattedInputValue) \(inputUnit) = \(formattedConvertedValue) \(outputUnit)"
        input = ""
    }
    
}
