//
//  TableViewCellOpenList.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit
import MaterialComponents

class TableViewCellOpenList: UITableViewCell {
    
    @IBOutlet weak var openInput: MDCOutlinedTextField!
    @IBOutlet weak var listInput: UIPickerView!
    
    let dataPicker = ["Prefiero omitir", "Femenino", "Masculino"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        openInput.keyboardType = .decimalPad
        openInput.returnKeyType = .done
        
        openInput.setOutlineColor(.C2(), for: .normal)
        openInput.setTextColor(.C3(), for: .normal)
        openInput.setOutlineColor(.C2(), for: .editing)
        openInput.setTextColor(.C3(), for: .editing)
        
        listInput.delegate = self
        listInput.dataSource = self
    }

}

extension TableViewCellOpenList: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataPicker[row]
    }
    
    
}
