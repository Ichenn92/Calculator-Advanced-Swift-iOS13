//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Tristan Hörler on 24.01.21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
	
	private var number: Double?
	private var intermediateCalculation: (num1: Double, calcMethod: String)?
	
	mutating func setNumber(_ number: Double) {
		self.number = number
	}
	
	mutating func calculate (symbol: String) -> Double? {
		
		if let number = number {
		
			switch symbol {
				case "+/-":
					return number * -1
				case "AC":
					return 0
				case "%":
					return number * 0.01
				case "=":
					return performTwoNumCalculation(n2: number)
				default:
					intermediateCalculation = (num1: number, calcMethod: symbol)
			}
		}
		return nil
	}
	
	private func performTwoNumCalculation(n2: Double) -> Double? {
		if let n1 = intermediateCalculation?.num1, let operation = intermediateCalculation?.calcMethod {
			switch operation {
				case "+":
					return n1 + n2
				case "-":
					return n1 - n2
				case "×":
					return n1 * n2
				case "÷":
					return n1 / n2
				default:
					fatalError("The operation pased in does not match any of the cases")
			}
		}
		return nil
	}
	
}
