

//
//  TestMatrixVector.swift
//  assignment1
//
//  Created by Nicholas Sparrow, Tim Riordan on 9/3/16.
//  Copyright © 2016 Nicholas Sparrow, Tim Riordan All rights reserved.
//

import Foundation

class TestMatrixVector {
    
    var passCounter: Int = 0
    var testCounter: Int = 0
    
    /**
     Test method performs its desired vector copy function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testVectorCopy()-> String {
        let x: Vector<Int> = Vector<Int>(size: 1)
        let targetValue: Vector<Int> = x.copy()
        targetValue[0] = 1
        testCounter += 1
        if x[0] != targetValue[0] {
            passCounter += 1
            return "testVectorCopy ------------------ PASSED"
            
        } else {
            //print("False")
            return "testVectorCopy ------------------ FAILED"
        }
    }
    
    /**
     Test method performs its desired matrix copy function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixCopy()-> String {
        let x: Matrix<Int> = Matrix<Int>(rows: 1, columns: 1)
        let targetValue: Matrix<Int> = x.copy()
        targetValue[0, 0] = 1
        testCounter += 1
        if x[0, 0] != targetValue[0, 0] {
            passCounter += 1
            return "testMatrixCopy ------------------ PASSED"
        } else {
            return "testMatrixCopy ------------------ FAILED"
        }
    }
    
    /**
     Test method performs its desired matrix transposition function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixTranspose()-> String {
        testCounter += 1
        var x: Matrix<Int> = Matrix<Int>(rows: 3, columns: 2)
        x[0,0] = 1
        x[0,1] = 1
        x[1,0] = 2
        x[1,1] = 2
        x[2,0] = 3
        x[2,1] = 3
        x = x.transpose
        let targetValue: Matrix<Int> = Matrix<Int>(rows: 2, columns: 3)
        targetValue[0,0] = 1
        targetValue[0,1] = 2
        targetValue[0,2] = 3
        targetValue[1,0] = 1
        targetValue[1,1] = 2
        targetValue[1,2] = 3
        for i in 0..<x.rows {
            for j in 0..<x.columns {
                if x[i, j] != targetValue[i, j] {
                    return "testMatrixTranspose ------------- FAILED"
                }
            }
        }
        passCounter += 1
        return "testMatrixTranspose ------------- PASSED"
    }
    
    /**
     Test method performs its desired matrix addition function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixAddition()-> String {
        testCounter += 1
        var x: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        x[0,0] = 1
        x[0,1] = 1
        x[1,0] = 2
        x[1,1] = 2
        
        let y: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        y[0,0] = 1
        y[0,1] = 1
        y[1,0] = 2
        y[1,1] = 2
        
        x = x + y
        
        let targetValue: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        targetValue[0,0] = 2
        targetValue[0,1] = 2
        targetValue[1,0] = 4
        targetValue[1,1] = 4
        
        for i in 0..<x.rows {
            for j in 0..<x.columns {
                if x[i, j] != targetValue[i, j] {
                    return "testMatrixAddition -------------- FAILED"
                }
            }
        }
        passCounter += 1
        return "testMatrixAddition -------------- PASSED"
    }
    
    /**
     Test method performs its desired matrix subtraction function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixSubtraction()-> String {
        testCounter += 1
        var x: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        x[0,0] = 1
        x[0,1] = 1
        x[1,0] = 2
        x[1,1] = 2
        
        let y: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        y[0,0] = 1
        y[0,1] = 1
        y[1,0] = 2
        y[1,1] = 2
        
        x = x - y
        
        let targetValue: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        targetValue[0,0] = 0
        targetValue[0,1] = 0
        targetValue[1,0] = 0
        targetValue[1,1] = 0
        
        for i in 0..<x.rows {
            for j in 0..<x.columns {
                if x[i, j] != targetValue[i, j] {
                    return "testMatrixSubtraction ----------- FAILED"
                }
            }
        }
        passCounter += 1
        return "testMatrixSubtraction ----------- PASSED"
    }
    
    /**
     Test method performs its desired matrix multiplication function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixMultiplication()-> String {
        testCounter += 1
        var x: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        x[0,0] = 1
        x[0,1] = 1
        x[1,0] = 2
        x[1,1] = 2
        
        let y: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        y[0,0] = 1
        y[0,1] = 1
        y[1,0] = 2
        y[1,1] = 2
        
        x = x * y
        
        let targetValue: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        targetValue[0,0] = 3
        targetValue[0,1] = 3
        targetValue[1,0] = 6
        targetValue[1,1] = 6
        
        for i in 0..<x.rows {
            for j in 0..<x.columns {
                if x[i, j] != targetValue[i, j] {
                    return "testMatrixMultiplication -------- FAILED"
                }
            }
        }
        passCounter += 1
        return "testMatrixMultiplication -------- PASSED"
    }
    
    /**
     Test method performs its desired matrix scalar addition function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixScalarAddition()-> String {
        testCounter += 1
        var x: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        x[0,0] = 1
        x[0,1] = 1
        x[1,0] = 2
        x[1,1] = 2
        
        x = x + 2
        
        let targetValue: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        targetValue[0,0] = 3
        targetValue[0,1] = 3
        targetValue[1,0] = 4
        targetValue[1,1] = 4
        
        for i in 0..<x.rows {
            for j in 0..<x.columns {
                if x[i, j] != targetValue[i, j] {
                    return "testMatrixScalarAddition -------- FAILED"
                }
            }
        }
        passCounter += 1
        return "testMatrixScalarAddition -------- PASSED"
    }
    
    /**
     Test method performs its desired matrix scalar subtraction function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixScalarSubtraction()-> String {
        testCounter += 1
        var x: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        x[0,0] = 1
        x[0,1] = 1
        x[1,0] = 2
        x[1,1] = 2
        
        x = x - 2
        
        let targetValue: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        targetValue[0,0] = -1
        targetValue[0,1] = -1
        targetValue[1,0] = 0
        targetValue[1,1] = 0
        
        for i in 0..<x.rows {
            for j in 0..<x.columns {
                if x[i, j] != targetValue[i, j] {
                    return "testMatrixScalarSubtraction ----- FAILED"
                }
            }
        }
        passCounter += 1
        return "testMatrixScalarSubtraction ----- PASSED"
    }
    
    /**
     Test method performs its desired matrix scalar division function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixScalarDivision()-> String {
        testCounter += 1
        var x: Matrix<Double> = Matrix<Double>(rows: 2, columns: 2)
        x[0,0] = 1
        x[0,1] = 1
        x[1,0] = 2
        x[1,1] = 2
        
        x = x / 2
        
        let targetValue: Matrix<Double> = Matrix<Double>(rows: 2, columns: 2)
        targetValue[0,0] = 0.5
        targetValue[0,1] = 0.5
        targetValue[1,0] = 1
        targetValue[1,1] = 1
        
        for i in 0..<x.rows {
            for j in 0..<x.columns {
                if x[i, j] != targetValue[i, j] {
                    return "testMatrixScalarDivision -------- FAILED"
                }
            }
        }
        passCounter += 1
        return "testMatrixScalarDivision -------- PASSED"
    }
    
    /**
     Test method performs its desired matrix scalar multiplication function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixScalarMultiplication()-> String {
        testCounter += 1
        var x: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        x[0,0] = 1
        x[0,1] = 1
        x[1,0] = 2
        x[1,1] = 2
        
        x = x * 2
        
        let targetValue: Matrix<Int> = Matrix<Int>(rows: 2, columns: 2)
        targetValue[0,0] = 2
        targetValue[0,1] = 2
        targetValue[1,0] = 4
        targetValue[1,1] = 4
        
        for i in 0..<x.rows {
            for j in 0..<x.columns {
                if x[i, j] != targetValue[i, j] {
                    return "testMatrixScalarMultiplication -- FAILED"
                }
            }
        }
        passCounter += 1
        return "testMatrixScalarMultiplication -- PASSED"
    }
    
    /**
     Test method performs its desired vector scalar addition function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testVectorAddition()-> String {
        testCounter += 1
        var x: Vector<Int> = Vector<Int>(size: 2)
        x[0] = 1
        x[1] = 1
        
        let y: Vector<Int> = Vector<Int>(size: 2)
        y[0] = 1
        y[1] = 1
        
        x = x + y
        
        let targetValue: Vector<Int> = Vector<Int>(size: 2)
        targetValue[0] = 2
        targetValue[1] = 2
        
        for i in 0..<x.size {
            if x[i] != targetValue[i] {
                return "testVectorAddition -------------- FAILED"
            }
        }
        passCounter += 1
        return "testVectorAddition -------------- PASSED"
    }
    
    /**
     Test method performs its desired vector subtraction function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testVectorSubtraction()-> String {
        testCounter += 1
        var x: Vector<Int> = Vector<Int>(size: 2)
        x[0] = 1
        x[1] = 1
        
        let y: Vector<Int> = Vector<Int>(size: 2)
        y[0] = 1
        y[1] = 1
        
        x = x - y
        
        let targetValue: Vector<Int> = Vector<Int>(size: 2)
        targetValue[0] = 0
        targetValue[1] = 0
        
        for i in 0..<x.size {
            if x[i] != targetValue[i] {
                return "testVectorSubtraction ----------- FAILED"
            }
        }
        passCounter += 1
        return "testVectorSubtraction ----------- PASSED"
    }
    
    /**
     Test method performs its desired vector multiplication function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testVectorMultiplication()-> String {
        testCounter += 1
        let x: Vector<Int> = Vector<Int>(size: 2)
        x[0] = 1
        x[1] = 1
        
        let y: Vector<Int> = Vector<Int>(size: 2)
        y[0] = 1
        y[1] = 1
        
        let z: Int = x * y
        
        let targetValue: Int = 2
        
        if z != targetValue {
            return "testVectorMultiplication -------- FAILED"
        }
        passCounter += 1
        return "testVectorMultiplication -------- PASSED"
    }
    
    /**
     Test method performs its desired vector scalar addition function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testVectorScalarAddition()-> String {
        testCounter += 1
        var x: Vector<Int> = Vector<Int>(size: 2)
        x[0] = 1
        x[1] = 1
        
        x = x + 2
        
        let targetValue: Int = 3
        
        for i in 0..<x.size {
            if x[i] != targetValue {
                return "testVectorScalarAddition -------- FAILED"
            }
        }
        passCounter += 1
        return "testVectorScalarAddition -------- PASSED"
    }
    
    /**
     Test method performs its desired vector scalar subtraction function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testVectorScalarSubtraction()-> String {
        testCounter += 1
        var x: Vector<Int> = Vector<Int>(size: 2)
        x[0] = 1
        x[1] = 1
        
        x = x - 2
        
        let targetValue: Int = -1
        
        for i in 0..<x.size {
            if x[i] != targetValue {
                return "testVectorScalarSubtraction ----- FAILED"
            }
        }
        passCounter += 1
        return "testVectorScalarSubtraction ----- PASSED"
    }
    
    /**
     Test method performs its desired vector scalar division function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testVectorScalarDivision()-> String {
        testCounter += 1
        var x: Vector<Double> = Vector<Double>(size: 2)
        x[0] = 1
        x[1] = 1
        
        x = x / 2
        
        let targetValue: Double = 0.5
        
        for i in 0..<x.size {
            if x[i] != targetValue {
                return "testVectorScalarDivision -------- FAILED"
            }
        }
        passCounter += 1
        return "testVectorScalarDivision -------- PASSED"
    }
    
    /**
     Test method performs its desired vector scalar multiplication function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testVectorScalarMultiplication()-> String {
        testCounter += 1
        var x: Vector<Int> = Vector<Int>(size: 2)
        x[0] = 1
        x[1] = 1
        
        x = x * 2
        
        let targetValue: Int = 2
        
        for i in 0..<x.size {
            if x[i] != targetValue {
                return "testVectorScalarMultiplication -- FAILED"
            }
        }
        passCounter += 1
        return "testVectorScalarMultiplication -- PASSED"
    }
    
    /**
     Test method performs its desired function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testVectorview()-> String {
        testCounter += 1
        let x: Matrix<Int> = Matrix<Int>(rows: 1, columns: 2)
        x[0, 0] = 1
        x[0, 1] = 1
        
        let targetValue = x.vectorview
        
        for i in 0..<x.columns {
            if x[0, i] != targetValue[i] {
                return "testVectorview ------------------ FAILED"
            }
        }
        passCounter += 1
        return "testVectorview ------------------ PASSED"
    }
    
    /**
     Test method performs its desired function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testRow()-> String {
        testCounter += 1
        let x: Matrix<Int> = Matrix<Int>(rows: 1, columns: 2)
        x[0, 0] = 1
        x[0, 1] = 2
        
        let targetValue = x.row(0)
        
        for i in 0..<x.columns {
            if x[0, i] != targetValue[i] {
                return "testRow ------------------------- FAILED"
            }
        }
        passCounter += 1
        return "testRow ------------------------- PASSED"
    }
    
    /**
     Test method performs its desired function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testColumn()-> String {
        testCounter += 1
        let x: Matrix<Int> = Matrix<Int>(rows: 2, columns: 1)
        x[0, 0] = 1
        x[1, 0] = 2
        
        let targetValue = x.column(0)
        
        for i in 0..<x.columns {
            if x[i, 0] != targetValue[i] {
                return "testColumn ---------------------- FAILED"
            }
        }
        passCounter += 1
        return "testColumn ---------------------- PASSED"
    }
    
    /**
     Test method performs its desired column conversion function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testColumnToMatrix()-> String {
        testCounter += 1
        let x: Matrix<Int> = Matrix<Int>(rows: 2, columns: 1)
        x[0, 0] = 1
        x[1, 0] = 2
        
        let y = x.column(0)
        let targetValue = y.matrixview
        for i in 0..<x.columns {
            if x[i, 0] != targetValue[i, 0] {
                return "testColumnToMatrix -------------- FAILED"
            }
        }
        passCounter += 1
        return "testColumnToMatrix -------------- PASSED"
    }
    
    /**
     Test method performs its desired function. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testMatrixview()-> String {
        testCounter += 1
        let x: Vector<Int> = Vector<Int>(size: 2)
        x[0] = 1
        x[1] = 2
        
        let targetValue = x.matrixview
        
        for i in 0..<x.size {
            if x[i] != targetValue[0, i] {
                return "testMatrixview ------------------ FAILED"
            }
        }
        passCounter += 1
        return "testMatrixview ------------------ PASSED"
    }
    
    /**
     Test method performs its desired fraction functions. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testFraction()-> String {
        testCounter += 1
        
        let x: Vector<Fraction> = Vector<Fraction>(size: 2)
        x[0] = Fraction(num: 1, den: 2)
        x[1] = Fraction(num: 1, den: 2)
        
        let y: Vector<Fraction> = Vector<Fraction>(size: 2)
        y[0] = Fraction(num: 1, den: 2)
        y[1] = Fraction(num: 1, den: 2)
        
        let fractionAddition = x + y
        let fractionAdditionTargetValue: Vector<Fraction> = Vector<Fraction>(size: 2)
        fractionAdditionTargetValue[0] = Fraction(num: 1, den: 1)
        fractionAdditionTargetValue[1] = Fraction(num: 1, den: 1)
        
        let fractionSubtraction = x - y
        
        let fractionSubtractionTargetValue: Vector<Fraction> = Vector<Fraction>(size: 2)
        fractionSubtractionTargetValue[0] = Fraction(num: 0, den: 1)
        fractionSubtractionTargetValue[1] = Fraction(num: 0, den: 1)
        
        
        let fractionMultiplication = x * y
        let fractionMultiplicationTargetValue: Fraction = Fraction(num: 1, den: 2)
        
        let fractionAdditionScalar = x + Fraction(num: 2)
        
        let fractionAdditionScalarTargetValue: Vector<Fraction> = Vector<Fraction>(size: 2)
        fractionAdditionScalarTargetValue[0] = Fraction(num: 5, den: 2)
        fractionAdditionScalarTargetValue[1] = Fraction(num: 5, den: 2)
        
        let fractionSubtractionScalar = x - Fraction(num: 2)
        
        let fractionSubtractionScalarTargetValue: Vector<Fraction> = Vector<Fraction>(size: 2)
        fractionSubtractionScalarTargetValue[0] = Fraction(num: -3, den: 2)
        fractionSubtractionScalarTargetValue[1] = Fraction(num: -3, den: 2)
        
        let fractionMultiplicationScalar = x * Fraction(num: 2)
        
        let fractionMultiplicationScalarTargetValue: Vector<Fraction> = Vector<Fraction>(size: 2)
        fractionMultiplicationScalarTargetValue[0] = Fraction(num: 1, den: 1)
        fractionMultiplicationScalarTargetValue[1] = Fraction(num: 1, den: 1)
        
        let fractionDivisionScalar = x / Fraction(num: 2)
        
        let fractionDivisionScalarTargetValue: Vector<Fraction> = Vector<Fraction>(size: 2)
        fractionDivisionScalarTargetValue[0] = Fraction(num: 1, den: 4)
        fractionDivisionScalarTargetValue[1] = Fraction(num: 1, den: 4)
        
        for i in 0..<x.size {
            if fractionAddition[i].decimal != fractionAdditionTargetValue[i].decimal ||
                fractionSubtraction[i].decimal != fractionSubtractionTargetValue[i].decimal ||
                fractionMultiplication.decimal != fractionMultiplicationTargetValue.decimal ||
                fractionAdditionScalar[i].decimal != fractionAdditionScalarTargetValue[i].decimal ||
                fractionSubtractionScalar[i].decimal != fractionSubtractionScalarTargetValue[i].decimal ||
                fractionMultiplicationScalar[i].decimal != fractionMultiplicationScalarTargetValue[i].decimal ||
                fractionDivisionScalar[i].decimal != fractionDivisionScalarTargetValue[i].decimal {
                return "testFraction -------------------- FAILED"
            }
        }
        
        let z: Matrix<Fraction> = Matrix<Fraction>(rows: 2, columns: 2)
        z[0, 0] = Fraction(num: 1, den: 2)
        z[0, 1] = Fraction(num: 1, den: 2)
        z[1, 0] = Fraction(num: 1, den: 2)
        z[1, 1] = Fraction(num: 1, den: 2)
        
        let v: Matrix<Fraction> = Matrix<Fraction>(rows: 2, columns: 2)
        v[0, 0] = Fraction(num: 1, den: 2)
        v[0, 1] = Fraction(num: 1, den: 2)
        v[1, 0] = Fraction(num: 1, den: 2)
        v[1, 1] = Fraction(num: 1, den: 2)
        
        let matrixAddition = z + v
        
        let matrixAdditionTargetValue: Matrix<Fraction> = Matrix<Fraction>(rows: 2, columns: 2)
        matrixAdditionTargetValue[0, 0] = Fraction(num: 1, den: 1)
        matrixAdditionTargetValue[0, 1] = Fraction(num: 1, den: 1)
        matrixAdditionTargetValue[1, 0] = Fraction(num: 1, den: 1)
        matrixAdditionTargetValue[1, 1] = Fraction(num: 1, den: 1)
        
        let matrixSubtraction = z - v
        
        let matrixSubtractionTargetValue: Matrix<Fraction> = Matrix<Fraction>(rows: 2, columns: 2)
        matrixSubtractionTargetValue[0, 0] = Fraction(num: 0, den: 1)
        matrixSubtractionTargetValue[0, 1] = Fraction(num: 0, den: 1)
        matrixSubtractionTargetValue[1, 0] = Fraction(num: 0, den: 1)
        matrixSubtractionTargetValue[1, 1] = Fraction(num: 0, den: 1)
        
        let matrixMultiplication = z * v
        let matrixMultiplicationTargetValue: Matrix<Fraction> = Matrix<Fraction>(rows: 2, columns: 2)
        matrixMultiplicationTargetValue[0, 0] = Fraction(num: 1, den: 2)
        matrixMultiplicationTargetValue[0, 1] = Fraction(num: 1, den: 2)
        matrixMultiplicationTargetValue[1, 0] = Fraction(num: 1, den: 2)
        matrixMultiplicationTargetValue[1, 1] = Fraction(num: 1, den: 2)
        
        let matrixAdditionScalar = z + Fraction(num: 2)
        
        let matrixAdditionScalarTargetValue: Matrix<Fraction> = Matrix<Fraction>(rows: 2, columns: 2)
        matrixAdditionScalarTargetValue[0, 0] = Fraction(num: 5, den: 2)
        matrixAdditionScalarTargetValue[0, 1] = Fraction(num: 5, den: 2)
        matrixAdditionScalarTargetValue[1, 0] = Fraction(num: 5, den: 2)
        matrixAdditionScalarTargetValue[1, 1] = Fraction(num: 5, den: 2)
        
        let matrixSubtractionScalar = z - Fraction(num: 2)
        
        let matrixSubtractionScalarTargetValue: Matrix<Fraction> = Matrix<Fraction>(rows: 2, columns: 2)
        matrixSubtractionScalarTargetValue[0, 0] = Fraction(num: -3, den: 2)
        matrixSubtractionScalarTargetValue[0, 1] = Fraction(num: -3, den: 2)
        matrixSubtractionScalarTargetValue[1, 0] = Fraction(num: -3, den: 2)
        matrixSubtractionScalarTargetValue[1, 1] = Fraction(num: -3, den: 2)
        
        let matrixMultiplicationScalar = z * Fraction(num: 2)
        
        let matrixMultiplicationScalarTargetValue: Matrix<Fraction> = Matrix<Fraction>(rows: 2, columns: 2)
        matrixMultiplicationScalarTargetValue[0, 0] = Fraction(num: 1, den: 1)
        matrixMultiplicationScalarTargetValue[0, 1] = Fraction(num: 1, den: 1)
        matrixMultiplicationScalarTargetValue[1, 0] = Fraction(num: 1, den: 1)
        matrixMultiplicationScalarTargetValue[1, 1] = Fraction(num: 1, den: 1)
        
        let matrixDivisionScalar = z / Fraction(num: 2)
        
        let matrixDivisionScalarTargetValue: Matrix<Fraction> = Matrix<Fraction>(rows: 2, columns: 2)
        matrixDivisionScalarTargetValue[0, 0] = Fraction(num: 1, den: 4)
        matrixDivisionScalarTargetValue[0, 1] = Fraction(num: 1, den: 4)
        matrixDivisionScalarTargetValue[1, 0] = Fraction(num: 1, den: 4)
        matrixDivisionScalarTargetValue[1, 1] = Fraction(num: 1, den: 4)
        
        for i in 0..<z.rows {
            for j in 0..<z.columns {
                if matrixAddition[i, j].decimal != matrixAdditionTargetValue[i, j].decimal ||
                    matrixSubtraction[i, j].decimal != matrixSubtractionTargetValue[i, j].decimal ||
                    matrixMultiplication[i, j].decimal != matrixMultiplicationTargetValue[i, j].decimal ||
                    matrixAdditionScalar[i, j].decimal != matrixAdditionScalarTargetValue[i, j].decimal ||
                    matrixSubtractionScalar[i, j].decimal != matrixSubtractionScalarTargetValue[i, j].decimal ||
                    matrixMultiplicationScalar[i, j].decimal != matrixMultiplicationScalarTargetValue[i, j].decimal ||
                    matrixDivisionScalar[i, j].decimal != matrixDivisionScalarTargetValue[i, j].decimal {
                    return "testFraction -------------------- FAILED"
                }
            }
        }
        passCounter += 1
        return "testFraction -------------------- PASSED"
    }
    
    /**
     Test method performs its desired complex functions. The result is stored in a test variable and compared to the expected result.
     
     - returns: String test result statement.
     */
    func testComplex()-> String {
        testCounter += 1
        
        let x: Vector<Complex> = Vector<Complex>(size: 2)
        x[0] = Complex(real: 1, imag: 2)
        x[1] = Complex(real: 1, imag: 2)
        
        let y: Vector<Complex> = Vector<Complex>(size: 2)
        y[0] = Complex(real: 1, imag: 2)
        y[1] = Complex(real: 1, imag: 2)
        
        let ComplexAddition = x + y
        
        let ComplexAdditionTargetValue: Vector<Complex> = Vector<Complex>(size: 2)
        ComplexAdditionTargetValue[0] = Complex(real: 2, imag: 4)
        ComplexAdditionTargetValue[1] = Complex(real: 2, imag: 4)
        
        let ComplexSubtraction = x - y
        
        let ComplexSubtractionTargetValue: Vector<Complex> = Vector<Complex>(size: 2)
        ComplexSubtractionTargetValue[0] = Complex(real: 0, imag: 0)
        ComplexSubtractionTargetValue[1] = Complex(real: 0, imag: 0)
        
        let ComplexMultiplication = x * y
        let ComplexMultiplicationTargetValue: Complex = Complex(real: -6, imag: 8)
        
        let ComplexAdditionScalar = x + Complex(real: 2, imag: 0)
        
        let ComplexAdditionScalarTargetValue: Vector<Complex> = Vector<Complex>(size: 2)
        ComplexAdditionScalarTargetValue[0] = Complex(real: 3, imag: 2)
        ComplexAdditionScalarTargetValue[1] = Complex(real: 3, imag: 2)
        
        let ComplexSubtractionScalar = x - Complex(real: 2, imag: 0)
        
        let ComplexSubtractionScalarTargetValue: Vector<Complex> = Vector<Complex>(size: 2)
        ComplexSubtractionScalarTargetValue[0] = Complex(real: -1, imag: 2)
        ComplexSubtractionScalarTargetValue[1] = Complex(real: -1, imag: 2)
        
        let ComplexMultiplicationScalar = x * Complex(real: 2, imag: 0)
        
        let ComplexMultiplicationScalarTargetValue: Vector<Complex> = Vector<Complex>(size: 2)
        ComplexMultiplicationScalarTargetValue[0] = Complex(real: 2, imag: 4)
        ComplexMultiplicationScalarTargetValue[1] = Complex(real: 2, imag: 4)
        
        let ComplexDivisionScalar = x / Complex(real: 2, imag: 0)
        
        let ComplexDivisionScalarTargetValue: Vector<Complex> = Vector<Complex>(size: 2)
        ComplexDivisionScalarTargetValue[0] = Complex(real: 0.5, imag: 1)
        ComplexDivisionScalarTargetValue[1] = Complex(real: 0.5, imag: 1)
        
        for i in 0..<x.size {
            if ComplexAddition[i].description != ComplexAdditionTargetValue[i].description ||
                ComplexSubtraction[i].description != ComplexSubtractionTargetValue[i].description ||
                ComplexMultiplication.description != ComplexMultiplicationTargetValue.description ||
                ComplexAdditionScalar[i].description != ComplexAdditionScalarTargetValue[i].description ||
                ComplexSubtractionScalar[i].description != ComplexSubtractionScalarTargetValue[i].description ||
                ComplexMultiplicationScalar[i].description != ComplexMultiplicationScalarTargetValue[i].description ||
                ComplexDivisionScalar[i].description != ComplexDivisionScalarTargetValue[i].description {
                return "testComplex --------------------- FAILED"
            }
        }
        
        let z: Matrix<Complex> = Matrix<Complex>(rows: 2, columns: 2)
        z[0, 0] = Complex(real: 1, imag: 2)
        z[0, 1] = Complex(real: 1, imag: 2)
        z[1, 0] = Complex(real: 1, imag: 2)
        z[1, 1] = Complex(real: 1, imag: 2)
        
        let v: Matrix<Complex> = Matrix<Complex>(rows: 2, columns: 2)
        v[0, 0] = Complex(real: 1, imag: 2)
        v[0, 1] = Complex(real: 1, imag: 2)
        v[1, 0] = Complex(real: 1, imag: 2)
        v[1, 1] = Complex(real: 1, imag: 2)
        
        let matrixAddition = z + v
        
        let matrixAdditionTargetValue: Matrix<Complex> = Matrix<Complex>(rows: 2, columns: 2)
        matrixAdditionTargetValue[0, 0] = Complex(real: 2, imag: 4)
        matrixAdditionTargetValue[0, 1] = Complex(real: 2, imag: 4)
        matrixAdditionTargetValue[1, 0] = Complex(real: 2, imag: 4)
        matrixAdditionTargetValue[1, 1] = Complex(real: 2, imag: 4)
        
        let matrixSubtraction = z - v
        
        let matrixSubtractionTargetValue: Matrix<Complex> = Matrix<Complex>(rows: 2, columns: 2)
        matrixSubtractionTargetValue[0, 0] = Complex(real: 0, imag: 0)
        matrixSubtractionTargetValue[0, 1] = Complex(real: 0, imag: 0)
        matrixSubtractionTargetValue[1, 0] = Complex(real: 0, imag: 0)
        matrixSubtractionTargetValue[1, 1] = Complex(real: 0, imag: 0)
        
        let matrixMultiplication = z * v
        let matrixMultiplicationTargetValue: Matrix<Complex> = Matrix<Complex>(rows: 2, columns: 2)
        matrixMultiplicationTargetValue[0, 0] = Complex(real: -6, imag: 8)
        matrixMultiplicationTargetValue[0, 1] = Complex(real: -6, imag: 8)
        matrixMultiplicationTargetValue[1, 0] = Complex(real: -6, imag: 8)
        matrixMultiplicationTargetValue[1, 1] = Complex(real: -6, imag: 8)
        
        let matrixAdditionScalar = z + Complex(real: 2, imag: 0)
        
        let matrixAdditionScalarTargetValue: Matrix<Complex> = Matrix<Complex>(rows: 2, columns: 2)
        matrixAdditionScalarTargetValue[0, 0] = Complex(real: 3, imag: 2)
        matrixAdditionScalarTargetValue[0, 1] = Complex(real: 3, imag: 2)
        matrixAdditionScalarTargetValue[1, 0] = Complex(real: 3, imag: 2)
        matrixAdditionScalarTargetValue[1, 1] = Complex(real: 3, imag: 2)
        
        let matrixSubtractionScalar = z - Complex(real: 2, imag: 0)
        
        let matrixSubtractionScalarTargetValue: Matrix<Complex> = Matrix<Complex>(rows: 2, columns: 2)
        matrixSubtractionScalarTargetValue[0, 0] = Complex(real: -1, imag: 2)
        matrixSubtractionScalarTargetValue[0, 1] = Complex(real: -1, imag: 2)
        matrixSubtractionScalarTargetValue[1, 0] = Complex(real: -1, imag: 2)
        matrixSubtractionScalarTargetValue[1, 1] = Complex(real: -1, imag: 2)
        
        let matrixMultiplicationScalar = z * Complex(real: 2, imag: 0)
        
        let matrixMultiplicationScalarTargetValue: Matrix<Complex> = Matrix<Complex>(rows: 2, columns: 2)
        matrixMultiplicationScalarTargetValue[0, 0] = Complex(real: 2, imag: 4)
        matrixMultiplicationScalarTargetValue[0, 1] = Complex(real: 2, imag: 4)
        matrixMultiplicationScalarTargetValue[1, 0] = Complex(real: 2, imag: 4)
        matrixMultiplicationScalarTargetValue[1, 1] = Complex(real: 2, imag: 4)
        
        let matrixDivisionScalar = z / Complex(real: 2, imag: 0)
        
        let matrixDivisionScalarTargetValue: Matrix<Complex> = Matrix<Complex>(rows: 2, columns: 2)
        matrixDivisionScalarTargetValue[0, 0] = Complex(real: 0.5, imag: 1)
        matrixDivisionScalarTargetValue[0, 1] = Complex(real: 0.5, imag: 1)
        matrixDivisionScalarTargetValue[1, 0] = Complex(real: 0.5, imag: 1)
        matrixDivisionScalarTargetValue[1, 1] = Complex(real: 0.5, imag: 1)
        
        for i in 0..<z.rows {
            for j in 0..<z.columns {
                if matrixAddition[i, j].description != matrixAdditionTargetValue[i, j].description ||
                    matrixSubtraction[i, j].description != matrixSubtractionTargetValue[i, j].description ||
                    matrixMultiplication[i, j].description != matrixMultiplicationTargetValue[i, j].description ||
                    matrixAdditionScalar[i, j].description != matrixAdditionScalarTargetValue[i, j].description ||
                    matrixSubtractionScalar[i, j].description != matrixSubtractionScalarTargetValue[i, j].description ||
                    matrixMultiplicationScalar[i, j].description != matrixMultiplicationScalarTargetValue[i, j].description ||
                    matrixDivisionScalar[i, j].description != matrixDivisionScalarTargetValue[i, j].description {
                    return "testComplex --------------------- FAILED"
                }
            }
        }
        passCounter += 1
        return "testComplex --------------------- PASSED"
    }

    /**
     Method calls all test functions.

     */
    func testAll() {
        
        let test = TestMatrixVector()
        print(test.testVectorCopy())
        print(test.testMatrixCopy()+"\n")
        
        print(test.testMatrixTranspose()+"\n")
        
        print(test.testMatrixAddition())
        print(test.testMatrixSubtraction())
        print(test.testMatrixMultiplication())
        
        print(test.testMatrixScalarAddition())
        print(test.testMatrixScalarSubtraction())
        print(test.testMatrixScalarDivision())
        print(test.testMatrixScalarMultiplication()+"\n")
        
        print(test.testVectorAddition())
        print(test.testVectorSubtraction())
        print(test.testVectorMultiplication())
        
        print(test.testVectorScalarAddition())
        print(test.testVectorScalarSubtraction())
        print(test.testVectorScalarDivision())
        print(test.testVectorScalarMultiplication()+"\n")
        
        print(test.testVectorview())
        print(test.testRow())
        print(test.testColumn())
        print(test.testColumnToMatrix())
        print(test.testMatrixview()+"\n")
        
        print(test.testFraction())
        print(test.testComplex())

        print("\nTests passed: \(test.passCounter)/\(test.testCounter)\n")
    }
}
