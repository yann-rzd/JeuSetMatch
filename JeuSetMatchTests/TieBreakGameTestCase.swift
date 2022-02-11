//
//  TieBreakGameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Yann Rouzaud on 11/02/2022.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class TieBreakGameTestCase: XCTestCase {
    var tieBreakGame: TieBreakGame!

    override func setUp() {
        super.setUp()
        tieBreakGame = TieBreakGame()
    }

    func testGivenScoreIs0_WhenIncrementingScore_ThenScoreIs1() {
        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 1)
    }

    func testGivenScoreIs6_WhenIncrementingScore_ThenScoreIs7AndGameIsOver() {
        tieBreakGame.scores[.one] = 6

        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 7)
        XCTAssertTrue(tieBreakGame.isOver)
    }

    func testGivenScoreIs6To6_WhenIncrementingScore_ThenScoreIs7To6AndGameIsNotOver() {
        tieBreakGame.scores[.one] = 6
        tieBreakGame.scores[.two] = 6

        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 7)
        XCTAssertEqual(tieBreakGame.scores[.two], 6)
        XCTAssertFalse(tieBreakGame.isOver)
    }
}
