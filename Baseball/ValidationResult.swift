//
//  ValidationResult.swift
//  Baseball
//
//  Created by 권순욱 on 3/10/25.
//

import Foundation

// 플레이어 입력 값 검증 기준
enum ValidationResult: String {
    case valid = "유효한 입력 값입니다."
    case notThreeDigit = "3자리 정수가 아닙니다." // 질문: 3을 하드코딩하지 않는 방법은?
    case notNumberFromOneToNine = "0에서 9까지의 숫자가 아닙니다."
    case duplicatedNumber = "중복되는 숫자가 있습니다."
}
