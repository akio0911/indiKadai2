//
//  ViewController.swift
//  indiKadai-2
//
//  Created by Taishi Kusunose on 2021/11/21.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var calcSegmentControll: UISegmentedControl!
    @IBOutlet private weak var resultLabel: UILabel!
    
    @IBAction private func didTapCalcButton(_ sender: Any){
        let num = calcSegmentControll.selectedSegmentIndex
        let calcOption = Option(rawValue: num) ?? .plus
        resultLabel.text = calculate(option: calcOption)
    }
    
    private func calculate(option: Option) -> String {
        guard let num1 = textField1.text.flatMap({ Double($0) }), let num2 = textField2.text.flatMap({ Double($0) }) else {
            return "エラー：数値を入力してください"
        }
        return option.calclate(with: num1, num2)
    }
}

extension ViewController {
    private enum Option: Int {
        case plus
        case minus
        case multiple
        case division
        
        func calclate(with num1: Double, _ num2: Double) -> String {
            switch self {
            case .plus:
                return "\(num1 + num2)"
            case .minus:
                return "\(num1 - num2)"
            case .multiple:
                return "\(num1 * num2)"
            case .division:
                guard num2 != 0 else {
                    return "割る数には0以外を入力してください"
                }
                return "\(num1 / num2)"
            }
        }
    }
}
