//
//  main.swift
//  Baseball
//
//  Created by 권순욱 on 3/10/25.
//

import Foundation

print("Hello, Baseball! Do you want to play game?")
print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")

let input = readLine()
if input == "1" {
    let baseball = Baseball()
    baseball.start()
}
