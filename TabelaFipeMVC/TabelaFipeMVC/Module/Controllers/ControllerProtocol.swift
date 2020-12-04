//
//  ControllerProtocol.swift
//  TabelaFipeMVC
//
//  Created by Glayce Kelly on 20/11/20.
//

import Foundation
import UIKit

protocol ControllerProtocol {
    func loadData(onComplete: @escaping (_ success: Bool) -> Void)
    
    func getNumberOfRow() -> Int
    
    func getNextController(index: Int) -> UIViewController
    
    func getViewTitle() -> String
    
    func getTitleForCell(at index: Int) -> String
    
    func getValueForCell(at index: Int) -> String
    
    func getPlaceholderForSearchBar() -> String
    
    func getItemsList() -> [General]?
    
    var general: [General]? { get set }
}
