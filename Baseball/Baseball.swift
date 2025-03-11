//
//  Baseball.swift
//  Baseball
//
//  Created by 권순욱 on 3/10/25.
//

import Foundation

struct Baseball {
    let numberOfDigits = 3
    let numberRange = 1...9
    
    func start() {
        let answer = makeAnswer()
        
        // 정답을 맞출 때까지 반복
        var result: Bool
        repeat {
            let input = readLine()
            result = compare(input, with: answer)
        } while !result
    }
    
    // 정답 생성(임의 숫자 배열)
    private func makeAnswer() -> [Int] {
        var numbers: [Int] = []
        for _ in 0..<numberOfDigits {
            let number = Int.random(in: numberRange)
            numbers.append(number)
        }
        return numbers
    }
    
    // 플레이어 입력 값과 정답 비교
    private func compare(_ input: String?, with answer: [Int]) -> Bool {
        guard let input else {
            print("입력 값이 없습니다.")
            return false
        }
        
        // 입력 값을 정수 배열로 변환(주의: 사용자 입력 값 1A2 -> [1, 2])
        let inputArray = Array(input).compactMap { Int(String($0)) }
        
        // 입력 값이 기준에 맞는지 검증
        let validatedResult = validateInput(inputArray)
        guard validatedResult == .valid else {
            print(validatedResult.rawValue)
            return false
        }
        
        var ballCount = 0
        var strikeCount = 0
        
        // 입력 값이 자릿 수까지 일치하면 스트라이크, 자릿 수는 달라도 일치하는 값이 있으면 볼
        for (index, value) in inputArray.enumerated() {
            if value == answer[index] {
                strikeCount += 1
            } else {
                let count = answer.filter { $0 == value }.count
                ballCount += count
            }
        }
        
        // 결과 출력
        switch (ballCount, strikeCount) {
        case (0, 0):
            print("아웃!")
            return false
        case (0, 3):
            print("홈런!")
            return true
        case (_, 0):
            print("\(ballCount)볼")
            return false
        case (0, _):
            print("\(strikeCount)스트라이크")
            return false
        default:
            print("\(ballCount)볼 \(strikeCount)스트라이크 ")
            return false
        }
    }
    
    // 입력 값 검증 헬퍼 메서드
    private func validateInput(_ inputArray: [Int]) -> ValidationResult {
        switch inputArray {
        case let x where x.count != 3:
            return .notThreeDigit
        case let x where x.contains(where: { $0 < 1 || $0 > 9 }):
            return .notNumberFromOneToNine
        case let x where Set(x).count != x.count:
            return .duplicatedNumber
        default:
            return .valid
        }
    }
}
