//
//  Menu.swift
//  Baseball
//
//  Created by 권순욱 on 3/11/25.
//

import Foundation

// 게임 실행하면 보이는 메뉴
enum Menu: String {
    case start = "1", viewRecord = "2", exit = "3"
    
    var title: String {
        switch self {
        case .start: "Start Game"
        case .viewRecord: "View Record"
        case .exit: "Exit"
        }
    }
}

extension Menu: CaseIterable {}
