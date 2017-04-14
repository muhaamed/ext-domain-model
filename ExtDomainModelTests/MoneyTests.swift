//
//  MoneyTests.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import ExtDomainModel

//////////////////
// MoneyTests
//
class MoneyTests: XCTestCase {
  
  let tenUSD = Money(amount: 10, currency: "USD")
  let twelveUSD = Money(amount: 12, currency: "USD")
  let fiveGBP = Money(amount: 5, currency: "GBP")
  let fifteenEUR = Money(amount: 15, currency: "EUR")
  let fifteenCAN = Money(amount: 15, currency: "CAN")
  
  func testCanICreateMoney() {
    let oneUSD = Money(amount: 1, currency: "USD")
    XCTAssert(oneUSD.amount == 1)
    XCTAssert(oneUSD.currency == "USD")
    
    let tenGBP = Money(amount: 10, currency: "GBP")
    XCTAssert(tenGBP.amount == 10)
    XCTAssert(tenGBP.currency == "GBP")
  }
  
  func testUSDtoGBP() {
    let gbp = tenUSD.convert("GBP")
    XCTAssert(gbp.currency == "GBP")
    XCTAssert(gbp.amount == 5)
  }
  func testUSDtoEUR() {
    let eur = tenUSD.convert("EUR")
    XCTAssert(eur.currency == "EUR")
    XCTAssert(eur.amount == 15)
  }
  func testUSDtoCAN() {
    let can = twelveUSD.convert("CAN")
    XCTAssert(can.currency == "CAN")
    XCTAssert(can.amount == 15)
  }
  func testGBPtoUSD() {
    let usd = fiveGBP.convert("USD")
    XCTAssert(usd.currency == "USD")
    XCTAssert(usd.amount == 10)
  }
  func testEURtoUSD() {
    let usd = fifteenEUR.convert("USD")
    XCTAssert(usd.currency == "USD")
    XCTAssert(usd.amount == 10)
  }
  func testCANtoUSD() {
    let usd = fifteenCAN.convert("USD")
    XCTAssert(usd.currency == "USD")
    XCTAssert(usd.amount == 12)
  }
  
  func testUSDtoEURtoUSD() {
    let eur = tenUSD.convert("EUR")
    let usd = eur.convert("USD")
    XCTAssert(tenUSD.amount == usd.amount)
    XCTAssert(tenUSD.currency == usd.currency)
  }
  func testUSDtoGBPtoUSD() {
    let gbp = tenUSD.convert("GBP")
    let usd = gbp.convert("USD")
    XCTAssert(tenUSD.amount == usd.amount)
    XCTAssert(tenUSD.currency == usd.currency)
  }
  func testUSDtoCANtoUSD() {
    let can = twelveUSD.convert("CAN")
    let usd = can.convert("USD")
    XCTAssert(twelveUSD.amount == usd.amount)
    XCTAssert(twelveUSD.currency == usd.currency)
  }
  
  func testAddUSDtoUSD() {
    let total = tenUSD.add(tenUSD)
    XCTAssert(total.amount == 20)
    XCTAssert(total.currency == "USD")
  }
  
  func testAddUSDtoGBP() {
    let total = tenUSD.add(fiveGBP)
    XCTAssert(total.amount == 10)
    XCTAssert(total.currency == "GBP")
  }
  
    func testMoneyDescription() {
        XCTAssert(tenUSD.description == "USD10")
    }
    
    func testUSDtoCANtoUSDDescription() {
        let can = twelveUSD.convert("CAN")
        let usd = can.convert("USD")
        XCTAssert(twelveUSD.amount == usd.amount)
        XCTAssert(twelveUSD.currency == usd.currency)
        XCTAssert(usd.description == "USD12")
    }
    func testProtocolAdd() {
        let changeUSD = Money(amount: 10, currency: "USD")
        let changeGBP = Money(amount: 10, currency: "GBP")
        let addedMoney = changeGBP.addProc(value: changeUSD)
        XCTAssert( addedMoney.description == "USD30")
    }

    func testProtocolSubtract() {
        let changeUSD = Money(amount: 10, currency: "USD")
        let changeGBP = Money(amount: 10, currency: "GBP")
        let subMoney = changeGBP.subProc(value: changeUSD)
        XCTAssert( subMoney.description == "USD10")
    }
    func testUsdDoubleExtension() {
        let ten = 10.0
        let newTen = ten.USD
        XCTAssert( newTen.amount == 10)
        XCTAssert( newTen.currency == "USD")
        XCTAssert( newTen.description == "USD10")
    }
    func testEurDoubleExtension() {
        let five = 5.0
        let newFive = five.EUR
        XCTAssert( newFive.amount == 5)
        XCTAssert( newFive.currency == "EUR")
        XCTAssert( newFive.description == "EUR5")
    }

}

