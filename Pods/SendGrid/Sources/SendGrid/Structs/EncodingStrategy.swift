//
//  EncodingStrategy.swift
//  SendGrid
//
//  Created by Scott Kawai on 9/14/17.
//

import Foundation

/// This struct houses both the date and data encoding strategies for a request.
public struct EncodingStrategy {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The encoding strategy for dates.
    public let dates: JSONEncoder.DateEncodingStrategy
    
    /// The encoding strategy for data.
    public let data: JSONEncoder.DataEncodingStrategy
    
    // MARK: - Initialization
    //=========================================================================
    
    /// Initializes the struct with a date and data strategy.
    ///
    /// - Parameters:
    ///   - dates:  The date encoding strategy.
    ///   - data:   The data encoding strategy.
    public init(dates: JSONEncoder.DateEncodingStrategy = .secondsSince1970, data: JSONEncoder.DataEncodingStrategy = .base64) {
        self.dates = dates
        self.data = data
    }
    
}

#if os(Linux)
    /// :nodoc:
    /// For some reason, on macOS we have
    /// `JSONEncoder.DataEncodingStrategy.base64` and on Linux we have
    /// `JSONEncoder.DataEncodingStrategy.base64Encode`, so this extension is to
    /// add a `.base64` option for Linux.
    ///
    /// This issue was fixed in https://github.com/apple/swift-corelibs-foundation/pull/1219,
    /// however it didn't make the 4.0 release.
    extension JSONEncoder.DataEncodingStrategy {
        public static let base64 = JSONEncoder.DataEncodingStrategy.base64Encode
    }
#endif
