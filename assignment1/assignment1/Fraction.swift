//
//  Fraction.swift
//  prog5.2
//
//  Created by Nicholas Sparrow, Tim Riordan on 9/3/16.
//  Copyright © 2016 Nicholas Sparrow, Tim Riordan All rights reserved.
//

import Foundation

final class Fraction : CustomStringConvertible {
    
    // STORED PROPERTIES
    
    private let num: Int;  // Numerator
    private let den: Int;  // Denominator
    
    // COMPUTED PROPERTIES
    
    /**
     Converts fraction to a Float value
     
     - returns: Float Decimal value of the fraction
     */
    var decimal: Float {
        get {
            // num and den are of the type Int, therefore,
            // they need to be explicitly converted to Floats.
            return Float(self.num)/Float(self.den);
        }
    }
    
    /**
     Converts object to a string description.
     
     - returns: String representation of a fraction
     */
    var description: String {
        if (self.den == 1) {
            return "\(self.num)";
        }
        return "\(self.num)/\(self.den)";
    }
    
    //INITIALISERS
    
    /**
     Default initialiser
     
     Numerator gets set to 0 and denominator gets set to 1
     */
    convenience init() {
        self.init(num: 0,den: 1);
    }
    
    /**
     Designated initialiser
     
     Numerator and denominator values are passed in the arguments of the initialiser.
     
     - parameter num: Fraction's numerator
     - parameter den: Fraction's denominator
     */
    init(num: Int, den: Int) {
        
        // Check the denomiator, and ends program if evaluates to false.
        assert(den != 0, "Denominator cannot be zero");
        
        // Arguments are constants, redefine them
        // as variables
        var num = num;
        var den = den;
        
        if(den < 0) {
            // If the denominator is negative
            // multiply the numerator and
            // denominator by -1 - this
            // ensures the denominator is
            // always positive, and numerator
            // carries the appropriate sign
            num = -num;
            den = -den;
        }
        // Find greatest common denominator.
        for gcd in (1...den).reverse() {
            if(num%gcd == 0 && den%gcd == 0) {
                // Common denominator found,
                // divide numerator and denominator
                num /= gcd;
                den /= gcd;
                break;
            }
        }
        
        self.num = num;
        self.den = den;
    }
    
    /**
     Convenience initialiser
     
     Numerator is set to some value, denominator
     is set to 1.
     
     - parameter num: Fraction's numerator
     */
    convenience init(num: Int) {
        self.init(num: num, den: 1);
    }
    
    // METHODS
    
    /**
     Converts string to a Fraction object.  Supports string
     syntax of the following format:
     "a" - converts it to fraction a/1
     "a/b" - converts it to fraction a/b
     
     - parameter string: String to convert
     - returns: Fraction? Fraction read from string, nil if
     syntax error in the string
     */
    static func readFromString(string: String) -> Fraction? {
        // Default values for numerator
        // and denomintor
        var num: Int = 0;
        var den: Int = 1;
        
        // Break the string into tokens separated by / symbol
        var tokens = string.componentsSeparatedByString("/")
        
        // If there is at least one token, then there is
        // a numerator value
        if tokens.count > 0 {
            // Try to convert numerator string to integer -
            // if not successful, return nil
            if let n = Int(tokens[0]) {
                num = n
            } else {
                return nil
            }
        }
        
        // If there is a second token, then there is
        // a denominator value
        if tokens.count > 1 {
            // Try to convert denominator string to integer -
            // if not successful, return nil
            if let d = Int(tokens[1]) {
                den = d
            } else {
                return nil
            }
        }
        // Return new fraction initialising its
        // numerator and denominator to values
        // read from the string
        return Fraction(num: num, den: den)
    }
    
    /**
     Adds a fraction to self.
     
     - parameter f: Fraction to add to self.
     
     - returns: Fractioin the result of adding f to self.
     */
    func add(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den + self.den*f.num, den: self.den*f.den);
    }
    
    /**
     Subtracts fraction from self.
     
     - parameter f: Fraction to subtract from self
     
     - returns: Fraction the result of subtraction f from self.
     */
    func subtract(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den - self.den*f.num, den: self.den*f.den);
    }
    
    /**
     Multiplies self by a fraction.
     
     - parameter f: Fraction to multiply self by
     
     - returns: Fraction the result of multiplying self by f.
     */
    func multiply(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.num, den: self.den*f.den);
    }
    
    /**
     Divides self by a fraction.
     
     - parameter f: Fraction to divide self by
     
     - returns: Fraction the result of dividing self by f.
     */
    func divide(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den, den: self.den*f.num);
    }
    
    static func add(f1: Fraction, to f2: Fraction) -> Fraction {
        return Fraction(num: f1.num*f2.den + f1.den*f2.num, den: f1.den*f2.den);
    }
    
    static func subtract(f1: Fraction, from f2: Fraction) -> Fraction {
        return f2.subtract(f1);
    }
    
    static func multiply(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.multiply(f2);
    }
    
    static func divide(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.divide(f2);
    }
    
    func add(x: Int) -> Fraction {
        return Fraction(num: self.num + self.den*x, den: self.den);
    }
    
    func subtract(x: Int) -> Fraction {
        return Fraction(num: self.num - self.den*x, den: self.den);
    }
    
    func multiply(x: Int) -> Fraction {
        return Fraction(num: self.num*x, den:self.den);
    }
    
    func divide(x: Int) -> Fraction {
        return Fraction(num: self.num, den: self.den*x);
    }
}

func +(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.add(f2);
}

func -(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.subtract(f2);
}

func *(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.multiply(f2);
}

func /(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.divide(f2);
}

func +(f: Fraction, x: Int) -> Fraction {
    return f.add(x);
}

func -(f: Fraction, x: Int) -> Fraction {
    return f.subtract(x);
}

func *(f: Fraction, x: Int) -> Fraction {
    return f.multiply(x);
}

func /(f: Fraction, x: Int) -> Fraction {
    return f.divide(x);
}
