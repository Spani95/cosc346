//
//  Matrix.swift
//  assignment1
//
//  Created by Nicholas Sparrow, Tim Riordan on 9/3/16.
//  Copyright © 2016 Nicholas Sparrow, Tim Riordan All rights reserved.
//

import Foundation

public class Matrix<T: MatrixData> : Vector<T>, BasicMatrix, MatrixToVector {
    
    private var mat: [Vector<T>]
    
    private var _rows: Int
    private var _columns: Int
    
    /**
     Returns matrix rows.
     
     - returns: rows from matrix.
     */
    public var rows: Int {
        get {
            return _rows
        }
    }
    
    /**
     Returns matrix columns.
     
     - returns: columns from matrix.
     */
    public var columns: Int {
        get {
            return _columns
        }
    }
    
    /**
     Converts the entire matrix into a Vector.
     Asserts to check that the matrix is of one row or column.
     
     - returns: column or row from matrix in form of vector.
     */
    public var vectorview: Vector<T> {
        get {
            assert(columns == 1 && rows > 1 || rows == 1 && columns > 1, "Row and column each greater than one")

            if rows > 1 {
                return self.column(0)
            } else {
                return self.row(0)
            }
        }
    }
    
    /**
     Transposes matrix values by iterating over matrix indexes in for-loop and sets new variable to them.
     
     - returns: Variable of type T containing the transposed matrix.
     */
    public var transpose: Matrix<T> {
        let temp: Matrix<T> = Matrix<T>(rows: columns, columns: rows)
        for i in 0..<columns {
            for j in 0..<rows {
                temp[i,j] = self.mat[j][i]
            }
        }
        return temp
    }
    
    /**
     Returns matrix value and sets variable to it through a get and set function.
     Asserts to check that the index given is withen the range of the matrix size.
     
     - parameter rows: Int specifying what row to return.
     - parameter columns: Int specifying what column to return.
    */
    public subscript(rows: Int, columns: Int) -> T {
        get {
            assert(rows < self.rows && columns < self.columns, "Specified index not in range")
            return mat[rows][columns]
        }
        set {
            assert(rows < self.rows && columns < self.columns, "Specified index not in range")
            mat[rows][columns] = newValue
        }
    }
    
    /**
     Prints the values of the vectors and matrices.

     - returns: Vector and matrix values.
     */
    public override var description: String {
        var result: String = ""
        for (index, value) in mat.enumerate() {
            if index == 0 {
                result += "\(value)\n"
            } else {
                result += "\(value)\n"
            }
        }
        return result
    }
    
    /**
     Initializes the rows, columns and matrix.
     Asserts to check that there is at least one row and column.
     
     - parameter rows: Int the row to initialize.
     - parameter columns: Int the column to initialize.
     */
    init(rows: Int, columns: Int) {
        assert(rows > 0 && columns > 0, "Too few rows/columns");
        self._rows = rows
        self._columns = columns
        self.mat = [Vector<T>](count: rows, repeatedValue: Vector<T>(size: columns))
        for i in 0..<rows {
            mat[i] = Vector<T>(size: columns)
        }
        super.init(size: columns) // Come back to....
    }
    
    
    /**
     Creates a copy of a matrix by iterating over the column and row indexes and copies the values to a separate variable.
     - returns: Copy of original matrix.
     */
    public override func copy() -> Matrix<T> {
        let copy: Matrix<T> = Matrix<T>(rows: rows, columns: columns)
        for i in 0..<rows {
            for j in 0..<columns {
                copy[i, j] = mat[i][j]
            }
        }
        return copy
    }
    
    /**
     Selects row vector from matrix and sets resulting vectors rowCheck flag to true.
     Asserts to check that the index given is withen the range of the matrix size.
     
     - parameter index: Int specifying what row to return.
     - returns: Vector at the location given my argument.
     */
    public func row(index: Int) -> Vector<T> {
        assert(index < self.rows, "Row out of range")
        return mat[index]
    }
    
    /**
     Selects column vector from matrix and sets resulting vectors columnCheck flag to true.
     Asserts to check that the index given is withen the range of the matrix size.
     
     - parameter index: Int specifying what column to return.
     - returns: Vector at the location given my argument.
     */
    public func column(index: Int) -> Vector<T> {
        assert(index < self.columns, "Column out of range")
        let result: Vector<T> = Vector<T>(size: self.rows)
        result.columnCheck = true
        for i in 0..<rows {
            result[i] = mat[i][index]
        }
        return result
    }
}

// Matrix and Matrix operators

/**
 * operator between two Matrices.
 
 Creates a new matrix with its row size the same as the first matrix row size and its column size
 the same as the second matrix column size. Then sets each value using nested for loops.
 
 - parameter lhs: Matrix on the left hand side of operator.
 - parameter rhs: Matrix on the right hand side of operator.
 - returns: Matrix which is result of multiplying lhs and rhs.
 */
public func *<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    assert(lhs.columns == rhs.rows, "Matrix dimensions not valid.")
    let result:Matrix<T> = Matrix<T>(rows: lhs.rows, columns: rhs.columns)
    
    for i in 0..<result.rows {
        for j in 0..<lhs.rows {
            for k in 0..<rhs.columns{
                result[i, j] = result[i, j] + (lhs[i, k] * rhs[k, j])
            }
        }
    }
    return result
}

/**
 + operator between two Matrices.
 
 Asserts to make sure the two matrices are the same size.
 Creates a new matrix the same size as lhs/rhs.
 Sets each element by adding each element in the matrices to thier corresponding element in the same index.
 
 - parameter lhs: Vector on the left hand side of operator.
 - parameter rhs: Vector on the right hand side of operator.
 - returns: Vector which is result of adding lhs and rhs.
 */
public func +<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    assert(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrix dimensions not equal.")
    let result:Matrix<T> = Matrix<T>(rows: lhs.rows, columns: rhs.columns)

    for (index, value) in lhs.mat.enumerate() {
        result.mat[index] = value + rhs.mat[index]
    }
    return result
}

/**
 - operator between two Matrices.
 
 Asserts to make sure the two matrix are the same size.
 Creates a new matrices the same size as lhs/rhs.
 Sets each element by subtracting each element in the matrix to their coresponding element in the same index.
 
 - parameter lhs: Matrix on the left hand side of operator.
 - parameter rhs: Matrix on the right hand side of operator.
 - returns: Matrix which is result of subtraction lhs by rhs.
 */
public func -<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    assert(lhs.rows == rhs.rows && lhs.columns == rhs.columns, "Matrix dimensions not equal.")
    let result:Matrix<T> = Matrix<T>(rows: lhs.rows, columns: rhs.columns)
    
    for (index, value) in lhs.mat.enumerate() {
        result.mat[index] = value - rhs.mat[index]
    }
    return result
}

// Matrix and scalar operators

/**
 + operator between Matrix and T.
 
 Creates a new Matrix the same size as lhs.
 Sets each element by adding T to each element in the lhs Matrix.
 
 - parameter lhs: Matrix on the left hand side of operator.
 - parameter rhs: T on the right hand side of operator.
 - returns: Matrix which is result of adding rhs to lhs.
 */
public func +<T: MatrixData>(lhs: Matrix<T>, rhs:T) -> Matrix<T> {
    let result:Matrix<T> = Matrix<T>(rows: lhs.rows, columns: lhs.columns)

    for (index, value) in lhs.mat.enumerate() {
        result.mat[index] = value + rhs
    }
    return result
}

/**
 - operator between Matrix and T.
 
 Creates a new Matrix the same size as lhs.
 Sets each element by subtracting T from each element in the lhs Matrix.
 
 - parameter lhs: Matrix on the left hand side of operator.
 - parameter rhs: T on the right hand side of operator.
 - returns: Matrix which is result of subtracting rhs from lhs.
 */
public func -<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    let result:Matrix<T> = Matrix<T>(rows: lhs.rows, columns: lhs.columns)

    for (index, value) in lhs.mat.enumerate() {
        result.mat[index] = value - rhs
    }
    return result
}

/**
 * operator between Matrix and T.
 
 Creates a new Matrix the same size as lhs.
 Sets each element by multiplying T to each element in the lhs Matrix.
 
 - parameter lhs: Matrix on the left hand side of operator.
 - parameter rhs: T on the right hand side of operator.
 - returns: Matrix which is result of multiplying rhs to lhs.
 */
public func *<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    let result:Matrix<T> = Matrix<T>(rows: lhs.rows, columns: lhs.columns)

    for (index, value) in lhs.mat.enumerate() {
        result.mat[index] = value * rhs
    }
    return result
}

/**
 / operator between Matrix and T.
 
 Creates a new Matrix the same size as lhs.
 Sets each element by dividing T from each element in the lhs Matrix.
 
 - parameter lhs: Matrix on the left hand side of operator.
 - parameter rhs: T on the right hand side of operator.
 - returns: Matrix which is result of dividing lhs by rhs.
 */
public func /<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    let result:Matrix<T> = Matrix<T>(rows: lhs.rows, columns: lhs.columns)

    for (index, value) in lhs.mat.enumerate() {
        result.mat[index] = value / rhs
    }
    return result
}
