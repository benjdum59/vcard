//
//  String+Utils.swift
//  vcard
//
//  Created by Benjamin Dumont on 12/12/2016.
//  Copyright © 2016 bccompany. All rights reserved.
//

import Foundation

extension String {
    mutating func appendReturnCarriage() {
        self = self + "\n"
    }
    func isEmpty()->Bool {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces).characters.count == 0
    }
}
