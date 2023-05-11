//
//  LoggingMiddleware.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/9.
//

import Foundation
import ReSwift

func createLoggingMiddleware() -> Middleware<AppState> {
    return { _, _ in
        { next in
            { action in
                print("[dispatch]: \(action)")
                next(action)
            }
        }
    }
}
