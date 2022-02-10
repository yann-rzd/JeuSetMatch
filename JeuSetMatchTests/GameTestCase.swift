//
//  GameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Yann Rouzaud on 10/02/2022.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class GameTestCase: XCTestCase {
    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game()
    }

    func testGievenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {
        // When
        game.incrementScore(forPlayer: .one)

        // Then
        XCTAssertEqual(game.scores[.one]!, 15)
        XCTAssertEqual(game.scores[.two]!, 0)
    }

    func testGievenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeThirty() {
        setPlayerOneScore(15)

        game.incrementScore(forPlayer: .one)

        XCTAssertEqual(game.scores[.one]!, 30)
        XCTAssertEqual(game.scores[.two]!, 0)
    }

    func testGievenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeForty() {
        setPlayerOneScore(30)

        game.incrementScore(forPlayer: .one)

        XCTAssertEqual(game.scores[.one]!, 40)
        XCTAssertEqual(game.scores[.two]!, 0)
    }

    func testGievenScoreIsNull_WhenPlayerOneScoreIsFortyAndWinThePoint_ThenPlyerOneWinTheGame() {
        setPlayerOneScore(40)

        game.incrementScore(forPlayer: .one)

        XCTAssertEqual(game.winner, .one)
        XCTAssertTrue(game.isOver)
    }

    private func setPlayerOneScore(_ score: Int) {
        game.scores[.one] = score
    }
}
