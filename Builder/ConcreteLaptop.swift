//
//  ConcreteLaptop.swift
//  DesignPatterns
//
//  Created by Lia Kassardjian on 17/08/21.
//

import Foundation

public class BudgetLaptopBuilder: LaptopBuilder {
    var size = Size.thirteenInch
    var processor = Processor.i5
    var graphics = Graphics.intelUHD617
    
    init() {}
}

public class OfficeLaptopBuilder: LaptopBuilder {
    var size = Size.fifteenInch
    var processor = Processor.i7
    var graphics = Graphics.intelIrisPlus645
    
    init() {}
}

public class HighEndLaptopBuilder: LaptopBuilder {
    var size = Size.fifteenInch
    var processor = Processor.i9
    var graphics = Graphics.radeonProVega20
    
    init() {}
}
