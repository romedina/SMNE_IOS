//
//  TableViewCellOpenList.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit
import MaterialComponents

class TableViewCellOpenList: UITableViewCell {
    
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var openInput: MDCOutlinedTextField!
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var listInput: UIPickerView!
    
    var dataPicker: [String] = []
    
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
    
    func setInfo(openTitle: String, listTitle: String, options: [String]) {
        openLabel.text = openTitle
        listLabel.text = listTitle
        dataPicker = options
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
