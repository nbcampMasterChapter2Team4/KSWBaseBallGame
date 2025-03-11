//
//  main.swift
//  Baseball
//
//  Created by 권순욱 on 3/10/25.
//

import Foundation

play()

func play() {
    var game = BaseballGame()
    var input: String?
    
    // 플레이어가 Exit를 선택하기 전까지 게임 반복
    while input != Menu.exit.rawValue {
        showHomeScreen()
        
        input = readLine()
        
        switch input {
        case Menu.start.rawValue:
            game.start()
        case Menu.viewRecord.rawValue:
            showRecord(records: game.gameRecords) // 질문: BaseballGame에서 gameRecords를 가져오는 시점은? 답: 함수 호출 시점
        case Menu.exit.rawValue:
            print("See you next time!")
            game.gameRecords = [] // 게임 기록 초기화
        default:
            print("Invalid input. Please try again.")
        }
    }
}

private func showHomeScreen() {
    print("Hello, Baseball! Do you want to play game?")
    for menu in Menu.allCases {
        print("\(menu.rawValue). \(menu.title)", terminator: "  ")
    }
}

private func showRecord(records: [Int]) {
    if records.isEmpty {
        print("게임 기록이 없습니다.")
    } else {
        print("<게임 기록 보기>")
        for (index, record) in records.enumerated() {
            print("\(index + 1)번째 게임: 시도 횟수 - \(record)")
        }
    }
}
