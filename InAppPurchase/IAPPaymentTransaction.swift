//  The MIT License (MIT)
//  
//  Copyright (c) 2015 Chris Davis
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//  
//  IAPPaymentTransaction.swift
//  InAppPurchase
//
//  Created by Chris Davis on 15/12/2015.
//  Email: contact@inapppurchase.com
//  Copyright © 2015 nthState. All rights reserved.
//

import Foundation
import StoreKit

// MARK: Class

internal class IAPPaymentTransaction
{
    // MARK: Methods
    
    /**
     Gets the receipt data as base 64

     - returns: A Base64 encoded string of the receipt data, if any.
     */
    internal func getReceiptDataAsBase64() -> String
    {
        let data = self.getReceiptData()
        return data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
    }
    
    /**
     Gets the receipt data as NSData

     - returns: NSData of the receipt data
     */
    internal func getReceiptData() -> NSData
    {
        if
            let receiptDataURL = receiptURL(),
            let data = NSData(contentsOfURL: receiptDataURL)
        {
            return data
        }
        return NSData()
    }
    
    /**
     Gets the receipt url
     
     - returns: NSURL? to the receipt path
     */
    internal func receiptURL() -> NSURL?
    {
        return NSBundle.mainBundle().appStoreReceiptURL
    }
}
