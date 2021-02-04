//
//  TableViewCellList.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit

protocol ListCellDelegate {
    func listChanged(id: String, info: String)
}

class TableViewCellList: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var listPicker: UIPickerView!
    var dataPicker: [String] = []
    var delegate: ListCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        listPicker.delegate = self
        listPicker.dataSource = self
    }
    
    func setInfo(title: String, options: [String]) {
        titleLabel.text = title
        dataPicker = options
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.listChanged(id: "type", info: dataPicker[row])
    }
}
