//
//  BaseballGame.swift
//  Baseball
//
//  Created by 권순욱 on 3/10/25.
//

import Foundation

struct BaseballGame {
    let numberOfDigits = 3
    let numberRange = 0...9
    
    var tryCount = 0
    var gameRecords: [Int] = []
    
    mutating func start() {
        print("게임을 시작합니다. \(numberOfDigits)자리 숫자를 입력하세요.")
        
        let answer = makeAnswer()
        
        // 정답을 맞출 때까지 반복
        var isCorrect: Bool
        repeat {
            let input = readLine()
            isCorrect = compare(input, with: answer)
            tryCount += 1
        } while !isCorrect
        
        // 정답을 맞췄다면 기록 생성 및 트라이 횟수 초기화
        if isCorrect {
            gameRecords.append(tryCount)
            tryCount = 0
        }
    }
    
    // 정답 생성(임의 숫자 배열)
    private func makeAnswer() -> [Int] {
        var numbers: [Int] = []
        
        while numbers.count != numberOfDigits {
            let number = Int.random(in: numberRange)
            if number == 0, numbers.isEmpty { continue } // 숫자 첫 자리가 0이면 안됨
            if numbers.contains(number) { continue } // 같은 숫자가 중복되면 안됨
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
        
#if DEBUG
        print("player input: \(input)")
        print("correct answer: \(answer)")
#endif
        
        // 입력 값을 정수 배열로 변환(주의: 사용자 입력 값 1A2 -> [1, 2])
        let inputArray = Array(input).compactMap { Int(String($0)) }
        
        // 입력 값이 기준에 맞는지 검증
        let validatedResult = validateInput(inputArray)
        guard validatedResult == .valid else {
            print(validatedResult.description)
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
        case let x where x.count != numberOfDigits:
            return .notThreeDigit(numberOfDigits)
        case let x where x.contains(where: { $0 < numberRange.lowerBound || $0 > numberRange.upperBound }):
            return .notNumberFromOneToNine(numberRange)
        case let x where Set(x).count != x.count:
            return .duplicatedNumber
        default:
            return .valid
        }
    }
}
