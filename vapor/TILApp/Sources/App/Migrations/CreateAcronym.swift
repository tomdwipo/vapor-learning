//
//  File.swift
//  
//
//  Created by Tommy on 02/02/22.
//

import Foundation
import Fluent

struct CreateAcronym: Migration {

    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("acronyms")
            .id()
            .field("short", .string, .required)
            .field("long", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("acronyms").delete()
    }
}
