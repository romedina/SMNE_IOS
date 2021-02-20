//
//  TableViewCellComment.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit
import MaterialComponents

class TableViewCellComment: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let estimatedFrame = parentView.bounds
        let textArea = MDCOutlinedTextArea(frame: estimatedFrame)
        textArea.label.text = ""
        textArea.sizeToFit()
        textArea.applyTheme(withScheme: appTheme)
        textArea.setTextColor(.C052D6C(), for: .editing)
        textArea.textView.delegate = self
        
        parentView.addSubview(textArea)
        
    }

}

extension TableViewCellComment: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        
    }
}
