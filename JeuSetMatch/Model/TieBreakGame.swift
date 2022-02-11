//
//  TieBreakGame.swift
//  JeuSetMatch
//
//  Created by Yann Rouzaud on 11/02/2022.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import Foundation

class TieBreakGame: Game {
    private static let scoreToReach = 7
    private var isTwoPointsAhead: Bool {
        return abs(scores[.one]! - scores[.two]!) >= 2
    }

    override func incrementScore(forPlayer player: Player) {
        scores[player]! += 1
        if scores[player]! >= TieBreakGame.scoreToReach && isTwoPointsAhead {
            end(withWinner: player)
        }
    }
}
