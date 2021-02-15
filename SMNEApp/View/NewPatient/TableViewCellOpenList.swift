//
//  TableViewCellOpenList.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/01/21.
//

import UIKit
import MaterialComponents

protocol OpenListCellDelegate {
    func openChanged(id: String, info: String)
    func listChange(id: String, info: String)
}

class TableViewCellOpenList: UITableViewCell {
    
    var delegate: OpenListCellDelegate?
    
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
        
        openInput.setOutlineColor(.C00D9CC(), for: .normal)
        openInput.setTextColor(.C052D6C(), for: .normal)
        openInput.setOutlineColor(.C00D9CC(), for: .editing)
        openInput.setTextColor(.C052D6C(), for: .editing)
        
        listInput.delegate = self
        listInput.dataSource = self
    }
    
    func setInfo(openTitle: String, listTitle: String, options: [String]) {
        openLabel.text = openTitle
        listLabel.text = listTitle
        dataPicker = options
    }
    
    @IBAction func openChanged(_ sender: MDCOutlinedTextField) {
        delegate?.openChanged(id: "age", info: sender.text ?? "")
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.listChange(id: "gender", info: dataPicker[row])
    }
    
}
