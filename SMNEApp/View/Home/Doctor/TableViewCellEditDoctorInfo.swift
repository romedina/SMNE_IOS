//
//  TableViewCellEditDoctorInfo.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 23/02/21.
//

import UIKit

class TableViewCellEditDoctorInfo: UITableViewCell {
    
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var fSurnameInput: UITextField!
    @IBOutlet weak var sSurnameInput: UITextField!
    @IBOutlet weak var genderInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var cedulaInput: UITextField!
    @IBOutlet weak var espeInput: UITextField!
    @IBOutlet weak var schoolInput: UITextField!
    @IBOutlet weak var countryInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setTextBorder(input: nameInput)
        setTextBorder(input: fSurnameInput)
        setTextBorder(input: sSurnameInput)
        setTextBorder(input: genderInput)
        setTextBorder(input: emailInput)
        setTextBorder(input: cedulaInput)
        setTextBorder(input: espeInput)
        setTextBorder(input: schoolInput)
        setTextBorder(input: countryInput)
    }
    
    func setTextBorder(input: UITextField) {
        input.layer.borderColor = UIColor.C5FD6CB().cgColor
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 10
    }

}
