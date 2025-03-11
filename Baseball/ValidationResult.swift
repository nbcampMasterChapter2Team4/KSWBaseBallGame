//
//  ValidationResult.swift
//  Baseball
//
//  Created by 권순욱 on 3/10/25.
//

import Foundation

// 플레이어 입력 값 검증 기준
enum ValidationResult {
    case valid
    case notThreeDigit(Int)
    case notNumberFromOneToNine(ClosedRange<Int>)
    case duplicatedNumber
    
    var description: String {
        switch self {
        case .valid:
            return "유효한 입력 값입니다."
        case .notThreeDigit(let numberOfDigits):
            return "\(numberOfDigits)자리 정수가 아닙니다."
        case .notNumberFromOneToNine(let numberRange):
            return "\(numberRange.lowerBound)에서 \(numberRange.upperBound)까지의 숫자가 아닙니다."
        case .duplicatedNumber:
            return "중복되는 숫자가 있습니다."
        }
    }
}

extension ValidationResult: Equatable {}
