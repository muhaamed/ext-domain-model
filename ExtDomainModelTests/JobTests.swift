//
//  JobTests.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import ExtDomainModel

class JobTests: XCTestCase {
  
  func testCreateSalaryJob() {
    let job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
    XCTAssert(job.calculateIncome(50) == 1000)
  }

  func testCreateHourlyJob() {
    let job = Job(title: "Janitor", type: Job.JobType.Hourly(15.0))
    XCTAssert(job.calculateIncome(10) == 150)
  }
  
  func testSalariedRaise() {
    let job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
    XCTAssert(job.calculateIncome(50) == 1000)
    
    job.raise(1000)
    XCTAssert(job.calculateIncome(50) == 2000)
  }
  
  func testHourlyRaise() {
    let job = Job(title: "Janitor", type: Job.JobType.Hourly(15.0))
    XCTAssert(job.calculateIncome(10) == 150)
    
    job.raise(1.0)
    XCTAssert(job.calculateIncome(10) == 160)
  }
    
  func testHourlyDescription() {
        let job = Job(title: "TA", type: Job.JobType.Hourly(15.0))
        XCTAssert(job.description == "TA 15.0/hr")
    }
    
  func testSalaryDescription() {
        let job = Job(title: "Professor", type: Job.JobType.Salary(10000))
        XCTAssert(job.description == "Professor 10000")
    }
}
