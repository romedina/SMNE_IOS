//
//  TableViewCellComment.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents

class TableViewCellComment: UITableViewCell {
    
    var delegate: CellInfoChangeDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let textArea = MDCOutlinedTextArea()
        textArea.label.text = ""
        textArea.sizeToFit()
        textArea.applyTheme(withScheme: appTheme)
        textArea.setTextColor(.C052D6C(), for: .editing)
        textArea.textView.delegate = self
        textArea.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textArea)
        
        textArea.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50.0).isActive = true
        textArea.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20.0).isActive = true
        textArea.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17.0).isActive = true
        textArea.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17.0).isActive = true
        textArea.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
    }

}

extension TableViewCellComment: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        delegate?.infoChange(id: "comment", info: textView.text)
    }
}
