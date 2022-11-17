//
//  NetworkingService.swift
//  23_GCD_dispatch_group
//
//  Created by Michelle Grover on 11/17/22.
//

import Foundation

final class NetworkingService {
    
    public static let shared = NetworkingService()
    private init() {}
    
    public func fetchFighters(completion:@escaping() -> ()) {
        
    }
    
}
