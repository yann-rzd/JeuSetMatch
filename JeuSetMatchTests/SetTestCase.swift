//
//  SetTestCase.swift
//  JeuSetMatchTests
//
//  Created by Yann Rouzaud on 10/02/2022.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class SetTestCase: XCTestCase {
    var set = Set()

    override func setUp() {
        super.setUp()
        set = Set()
    }

    func createManyGames(_ count: Int, wonByPlayer player: Player) {
        for _ in 1...count {
            let game = Game()
            game.winner = player
            set.games.append(game)
        }
    }

    func testGivenPlayerWinsByThreeGamesToTwo_WhenGettingScoreFromSet_ThenScoreShouldBeThreeToTwo() {
        createManyGames(2, wonByPlayer: .one)
        createManyGames(3, wonByPlayer: .two)

        XCTAssertEqual(set.scores[.one], 2)
        XCTAssertEqual(set.scores[.two], 3)
    }

    func testGivenSetIsNotOver_WhenGettingWinner_ThenWinnerShouldBeNil() {
        XCTAssertNil(set.winner)
    }

    func testGivenPlayerOneHasWonSixGames_WhenGettingWinner_ThenWinnerShouldBePlayerOne() {
        createManyGames(6, wonByPlayer: .one)

        XCTAssertEqual(set.winner, .one)
        XCTAssertEqual(set.isOver, true)
    }
}
