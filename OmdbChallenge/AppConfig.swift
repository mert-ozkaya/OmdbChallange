//
//  AppConfig.swift
//  OmdbChallenge
//
//  Created by mert ozkaya on 24.02.2021.
//

import Foundation

final class AppConfig {
    static var shared = AppConfig()
    
    #if DEBUG
        let APIKey = "bdee3263"
    #else //RELEASE
        let APIKey = ""
    #endif
    
    let baseDataURL = "http://www.omdbapi.com/"
    let basePosterURL = "http://img.omdbapi.com/"
}
