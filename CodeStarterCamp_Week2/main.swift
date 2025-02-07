//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// STEP 2
/*
func compareLotto(by myLottoNumbers: [Int]) {
    let lottoNumbers: Set<Int> = generateLottoNumbers()
    let matchedLottoNumbers: Set<Int> = lottoNumbers.intersection(myLottoNumbers)
    
    printLottoResult(by: matchedLottoNumbers)
}

func generateLottoNumbers() -> Set<Int> {
    var lottoNumbers: Set<Int> = []
    
    while lottoNumbers.count < 6 {
        lottoNumbers.insert(Int.random(in: (1...45)))
    }
    
    return lottoNumbers
}

func printLottoResult(by matchedLottoNumbers: Set<Int>) {
    if matchedLottoNumbers.count > 0 {
        let matchNumbersString = matchedLottoNumbers
            .sorted()
            .map{ String($0) }
            .joined(separator: ", ")
        print("축하합니다! 겹치는 번호는 \(matchNumbersString) 입니다!")
    } else {
        print("아쉽지만 겹치는 번호가 없습니다.")
    }
}

let myLottoNumbers: [Int] = [1, 2, 3, 4, 5, 6]
compareLotto(by: myLottoNumbers)
*/

// STEP 3
var lottoResults: [String: [Int]] = [:]

func generateLottoRound() {
    for round in 1...5 {
        let lottoResult = generateLottoNumbers().sorted()
        saveLotto(of: round, winningNumbers: lottoResult)
    }
}

func generateLottoNumbers() -> Set<Int> {
    var lottoNumbers: Set<Int> = []
    
    while lottoNumbers.count < 6 {
        lottoNumbers.insert(Int.random(in: (1...45)))
    }
    
    return lottoNumbers
}

func saveLotto(of round: Int, winningNumbers lottoResult: [Int]) {
    lottoResults["\(round)회차"] = lottoResult
}

func printLottoRound(of round: Int) {
    let lottoNumbers = lottoResults["\(round)회차"]
    if let numbers: [Int] = lottoNumbers {
        let formattedNumbers = numbers.map { String($0) }.joined(separator: ", ")
        print("\(round)회차의 로또 당첨 번호는 \(formattedNumbers) 입니다.")
    } else {
        print("해당하는 회차가 없습니다.")
    }
}

generateLottoRound()
printLottoRound(of: 3)
