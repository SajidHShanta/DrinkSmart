//
//  ViewController.swift
//  DrinkSmart
//
//  Created by Sajid Shanta on 31/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var amountSlider: UISlider!
    @IBOutlet weak var recordLabel: UILabel!
    
    // 0: amount; 1: type
    var recordArray: [String] = ["", ""] {
        didSet {
            recordLabel.text = recordArray[0] + "ml " + recordArray[1]
        }
    }
    
    var drinkType: [String] = ["Water", "Tea", "Cofee", "Soft Drink", "Others"] {
        didSet {
            typePicker.reloadAllComponents()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    private func setupViews() {
        amountSlider.value = 0
        amountSlider.minimumValue = 0
        amountSlider.minimumValue = 1000
//        amountSlider.addTarget(self, action: #selector(amountSliderValueChanged(_:)), for: .valueChanged)
        
        amountSlider.isUserInteractionEnabled = true

        recordLabel.text = "- -"
    }
    
    @IBAction func amountSliderValueChanged(_ sender: UISlider) {
        print("nbjb")
        recordArray[0] = String(sender.value)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        drinkType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        NSAttributedString(string: drinkType[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.forgroundAccent])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        recordArray[1] = drinkType[row]
    }
}
