//
//  TipsyController.swift
//  Tipsy
//
//  Created by Sergey on 07.02.2023.
//

import Foundation


struct TipsyController {

    
    func calculateBill(parameter: Result) -> Result {
        let result = parameter.bill * (1.0 + Double(parameter.percentage)/100) / Double(parameter.split)
        return Result(bill: result, split: parameter.split, percentage: parameter.percentage)
    }
    
    
}
