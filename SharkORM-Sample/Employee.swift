//
//  Employee.swift
//  SharkORM-Sample
//
//  Created by Gopala Krishna Kammela on 26/04/18.
//  Copyright © 2018 RapidBizApps. All rights reserved.
//

import Foundation
import SharkORM

class Employee: SRKObject {
    @objc dynamic var name : String!
    @objc dynamic var age : NSNumber!
}
