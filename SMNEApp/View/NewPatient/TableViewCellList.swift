//
//  TableViewCellList.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit

class TableViewCellList: UITableViewCell {
    
    @IBOutlet weak var listPicker: UIPickerView!
    let dataPicker = ["Privada", "Pública"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        listPicker.delegate = self
        listPicker.dataSource = self
    }
    
    func setInfo() {
        
    }

}

extension TableViewCellList: UIPickerViewDelegate, UIPickerViewDataSource {
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
