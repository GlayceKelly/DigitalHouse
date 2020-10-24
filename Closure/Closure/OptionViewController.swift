//
//  OptionViewController.swift
//  Closure
//
//  Created by Glayce Kelly on 24/10/20.
//  Copyright © 2020 Glayce Kelly. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var optionsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var colorsSegmentedControl: UISegmentedControl!
    
    //MARK: - Public attributeds
    
    var onCompleteOption: ((_ option: String) -> Void)?
    var onCompleteColor: ((_ color: UIColor) -> Void)?

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Public methods
    
    static func getController() -> OptionViewController? {
        if let viewController = UIStoryboard(name: "Option", bundle: nil).instantiateInitialViewController() {
            return viewController as? OptionViewController
        }
        
        return nil
    }
    
    func setOptionCompletion(onComplete: @escaping(_ option: String) -> Void) {
        self.onCompleteOption = onComplete
    }
    
    func setColorCompletion(onComplete: @escaping(_ color: UIColor) -> Void) {
        self.onCompleteColor = onComplete
    }
    
    //MARK: - Actions
    
    @IBAction func optionsSegmentedControlAction(_ sender: UISegmentedControl) {
        switch optionsSegmentedControl.selectedSegmentIndex {
        case 0:
            self.onCompleteOption?("Alugar")
        case 1:
            self.onCompleteOption?("Comprar")
        default:
            self.onCompleteOption?("Vender")
        }
    }
    
    @IBAction func colorsSegmentedControlAction(_ sender: UISegmentedControl) {
        switch colorsSegmentedControl.selectedSegmentIndex {
        case 0:
            self.onCompleteColor?(.blue)
        case 1:
            self.onCompleteColor?(.systemGreen)
        default:
            self.onCompleteColor?(.red)
        }
        
        dismiss(animated: true, completion: nil)
    }
}
