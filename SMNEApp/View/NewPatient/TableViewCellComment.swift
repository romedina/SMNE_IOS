//
//  TableViewCellComment.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 27/01/21.
//

import UIKit

class TableViewCellComment: UITableViewCell {
    
    var delegate: CellInfoChangeDelegate?
    @IBOutlet weak var commentInput: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        commentInput.delegate = self
        commentInput.layer.cornerRadius = 8
        commentInput.layer.borderWidth = 1
        commentInput.layer.borderColor = UIColor.C5FD6CB().cgColor
        commentInput.textColor = UIColor.C052D6C()
        
    }

}

extension TableViewCellComment: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        delegate?.infoChange(id: "comment", info: textView.text)
    }
}
