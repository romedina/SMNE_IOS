//
//  TableViewCellOpenOpen.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 15/02/21.
//

import UIKit
import MaterialComponents

class TableViewCellOpenOpen: UITableViewCell {
    
    @IBOutlet weak var title1Label: UILabel!
    @IBOutlet weak var open1Input: MDCTextField!
    @IBOutlet weak var title2Label: UILabel!
    @IBOutlet weak var open2Input: MDCTextField!
    
    var input1Controller: MDCTextInputControllerOutlined?
    var input2Controller: MDCTextInputControllerOutlined?
    
    var delegate: CellInfoChangeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        input1Controller = MDCTextInputControllerOutlined(textInput: open1Input)
        input2Controller = MDCTextInputControllerOutlined(textInput: open2Input)
        
        input1Controller?.applyTheme(withScheme: appTheme)
        input1Controller?.textInput?.textColor = .C052D6C()
        input2Controller?.applyTheme(withScheme: appTheme)
        input2Controller?.textInput?.textColor = .C052D6C()
        
    }
    
    func setInfo(t1: String, t2: String, tr1: String, tr2: String) {
        title1Label.text = t1
        title2Label.text = t2
        
        let color: UIColor = UIColor(red: 0.4, green: 0.29, blue: 0.49, alpha: 1.0)
        let label = UILabel()
        label.text = tr1
        label.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label.textColor = color
        open1Input.trailingViewMode = .always
        open1Input.trailingView = label
        
        let label1 = UILabel()
        label1.text = tr2
        label1.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        label1.textColor = color
        open2Input.trailingViewMode = .always
        open2Input.trailingView = label1
    }

    @IBAction func open1(_ sender: MDCTextField) {
        let text = sender.text ?? "0"
        let myFloat = (text as NSString).floatValue
        delegate?.infoChange(id: "hba1c", info: myFloat)
    }
    
    @IBAction func open2(_ sender: MDCTextField) {
        let text = sender.text ?? "0"
        let myFloat = (text as NSString).floatValue
        delegate?.infoChange(id: "glucose", info: myFloat)
    }
}
