//
// Created by Rick Buiten on 11/04/2017.
// Copyright (c) 2017 Sitio IT. All rights reserved.
//

import Foundation

public class Roll {
    var pins : Int
    
    init(pins: Int){
        assert(pins >= 0)
        assert(pins <= 10)
        
        self.pins = pins
    }
}
