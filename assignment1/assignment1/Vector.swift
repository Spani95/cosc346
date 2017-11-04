//
//  Vector.swift
//  assignment1
//
//  Created by Nicholas Sparrow, Tim Riordan on 9/3/16.
//  Copyright © 2016 Nicholas Sparrow, Tim Riordan All rights reserved.
//

import Foundation

public class Vector<T: MatrixData> : BasicVector, VectorToMatrix{
    
    private var vec: [T]
    
    public var columnCheck: Bool = false  // A flag to represent if the vector is seen as a column or a row by a matrix.
    
    private var _size: Int
    // Returns the size of the vector
    public var size: Int {
        get{return _size}
    }
    
    /**
     Matrixview shows the vector as a matrix, if the column check is
     set to true the vector will be displayed as a column in the matrix.
     */
    public var matrixview: Matrix<T> {
        get {
            let result: Matrix<T>
            if self.columnCheck == false {
                result = Matrix<T>(rows: 1, columns: self.size)
                for i in 0..<self.size {
                    result[0, i] = self.vec[i]
                }
            } else {
                result = Matrix<T>(rows: self.size, columns: 1)
                for i in 0..<self.size {
                    result[i, 0] = self.vec[i]
                }
            }
            return result
        }
    }
    
    /**
     Returns/sets the element value at the given index.
     */
    public subscript(index: Int) -> T {
        get {
            if index >= self.size {
                print("Specified index not in range") // Change assert
            }
            return self.vec[index]
        }
        set {
            if index >= self.size {
                print("Specified index not in range")  // Change assert
            }
            else{self.vec[index] = newValue}
        }
    }
    
    /**
     Displays the vector array of type T as "[T1, T2,...., Tn-1, Tn]"
     */
    public var description: String {
        var result: String = "["
        for (index, value) in vec.enumerate() {
            if index == 0 {
                result += "\(value)"
            } else {
                result += ", \(value)"
            }
        }
        result += "]"
        return result
    }
    
    // INITIALISERS
    /**
     Designated initialiser
     
     Initialises vector array size by the argument passed in and sets all values to be type T's default e.g. 0, 0.0, 0/1,...
     
     - parameter size: Vectors size.
     */
    init(size: Int) {
        self._size = size
        self.vec = [T](count: size, repeatedValue: T())
        
    }
    
    //METHODS
    /**
     Computes the dot product of the vector with another vector.
     
     - parameter v: Vector to dot with.
     - returns: T.
     */
    public func dot(v: Vector<T>) -> T {
        assert(self.size == v.size, "Vectors not of the same size")
        var result: T = T()
        for (index, value) in self.vec.enumerate() {
            result = result + (value * v[index])
        }
        return result
    }
    
    /**
     Returns a new object instance that is a copy of the current vector.
     
     - returns: Vector that is the same as the original.
     */
    public func copy() -> Vector<T> {
        let copy: Vector<T> = Vector<T>(size: self.size)
        for (index, value) in vec.enumerate() {
            copy[index] = value
        }
        return copy
    }
    
}

// Vector and Vector operators

/**
 * operator between two Vectors.
 
 Is the same as getting the dot of two vectors therefore used the dot method again.
 
 - parameter lhs: Vector on the left hand side of operator.
 - parameter rhs: Vector on the right hand side of operator.
 - returns: T which is result of dot product between lhs and rhs.
*/
public func *<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> T {
    return lhs.dot(rhs)
}

/**
 + operator between two Vectors.
 
 Asserts to make sure the two vectors are the same size.
 Creates a new Vector the same size as lhs/rhs.
 Sets each element by adding each element in the vectors to thier coresponding element in the same index.
 
 - parameter lhs: Vector on the left hand side of operator.
 - parameter rhs: Vector on the right hand side of operator.
 - returns: Vector which is result of adding lhs and rhs.
*/
public func +<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T> {
    assert(lhs.size == rhs.size, "Vectors not of the same size")
    let result: Vector<T> = Vector<T>(size: lhs.size)
    for (index, value) in lhs.vec.enumerate() {
        result[index] = value + rhs[index]
    }
    return result
}

/**
 - operator between two Vectors.
 
 Asserts to make sure the two vectors are the same size.
 Creates a new Vector the same size as lhs/rhs.
 Sets each element by subtracting each element in the vectors to thier coresponding element in the same index.
 
 - parameter lhs: Vector on the left hand side of operator.
 - parameter rhs: Vector on the right hand side of operator.
 - returns: Vector which is result of subtraction lhs by rhs.
*/
public func -<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T> {
    assert(lhs.size == rhs.size, "Vectors not of the same size")
    let result: Vector<T> = Vector<T>(size: lhs.size)
    for (index, value) in lhs.vec.enumerate() {
        result[index] = value - rhs[index]
    }
    return result
}

// Vector and scalar operators

/**
 + operator between Vector and T.
 
 Creates a new Vector the same size as lhs.
 Sets each element by adding T to each element in the lhs vector.
 
 - parameter lhs: Vector on the left hand side of operator.
 - parameter rhs: T on the right hand side of operator.
 - returns: Vector which is result of adding rhs to lhs.
*/
public func +<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T> {
    let result: Vector<T> = Vector<T>(size: lhs.size)
    for (index, value) in lhs.vec.enumerate() {
        result[index] = value + rhs
    }
    return result
}

/**
 - operator between Vector and T.
 
 Creates a new Vector the same size as lhs.
 Sets each element by subtracting T from each element in the lhs vector.
 
 - parameter lhs: Vector on the left hand side of operator.
 - parameter rhs: T on the right hand side of operator.
 - returns: Vector which is result of subtracting lhs by rhs.
 */
public func -<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T> {
    let result: Vector<T> = Vector<T>(size: lhs.size)
    for (index, value) in lhs.vec.enumerate() {
        result[index] = value - rhs
    }
    return result
}

/**
 * operator between Vector and T.
 
 Creates a new Vector the same size as lhs.
 Sets each element by multiplying T to each element in the lhs vector.
 
 - parameter lhs: Vector on the left hand side of operator.
 - parameter rhs: T on the right hand side of operator.
 - returns: Vector which is result of multiplying lhs by rhs.
 */
public func *<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T> {
    let result: Vector<T> = Vector<T>(size: lhs.size)
    for (index, value) in lhs.vec.enumerate() {
        result[index] = value * rhs
    }
    return result
}

/**
 / operator between Vector and T.
 
 Creates a new Vector the same size as lhs.
 Dividing each element in the vector by T.
 
 - parameter lhs: Vector on the left hand side of operator.
 - parameter rhs: T on the right hand side of operator.
 - returns: Vector which is result of dividing lhs by rhs.
*/
public func /<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T> {
    let result: Vector<T> = Vector<T>(size: lhs.size)
    for (index, value) in lhs.vec.enumerate() {
        result[index] = value / rhs
    }
    return result
}