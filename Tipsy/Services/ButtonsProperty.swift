//
//  ButtonsProperty.swift
//  Tipsy
//
//  Created by Sergey on 05.02.2023.
//

import Foundation
import UIKit

struct ButtonsProperty {
    let calcButtonFrame: CGRect = CGRect(x: 0, y: 0, width: 374, height: 80)
    let calcButtonFont: UIFont = UIFont.systemFont(ofSize: 35.0, weight: .regular)
    let calcButtonColor: UIColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
    let calcButtonTextColor: UIColor = #colorLiteral(red: 0.9725490196, green: 1, blue: 0.9921568627, alpha: 1)
    
    let percentButtonFrame: CGRect = CGRect(x: 0, y: 0, width: 101, height: 54)
    let percentButtonFont: UIFont = UIFont.systemFont(ofSize: 35.0, weight: .regular)
    let percentButtonSelectedColor: UIColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
    let percentButtonNotSelectedColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    let percentButtonTextSelectedColor: UIColor = #colorLiteral(red: 0.9725490196, green: 1, blue: 0.9921568627, alpha: 1)
    let percentButtonTextNotSelectedColor: UIColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
}
