//
//  TableViewCellRevition.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 19/03/21.
//

import UIKit

protocol RevitionToListDelegate {
    func revitionToList(date: String, comment: String)
}
protocol ListToControllerDelegate {
    func listToController(date: String, comment: String)
}

class TableViewCellRevition: UITableViewCell {
    
    @IBOutlet weak var evaluationNumberLabel: UILabel!
    @IBOutlet weak var algorithmNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var evaluationBackView: UIView!
    @IBOutlet weak var revitionsStack: UIStackView!
    @IBOutlet weak var treatmentImageView: UIImageView!
    @IBOutlet weak var applyRevitionButton: UIButton!
    
    var infoForCell: EvaluationSchema?
    var observationsViews = [RevisionView]()
    
    var observations = [ObservationSchema]()
    var delegate: ListToControllerDelegate?
    
    private var info: EvaluationSchema?
    private var isLast = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        evaluationBackView.layer.cornerRadius = 27
    }
    
    func setInfo(info: EvaluationSchema, isLAst: Bool) {
        self.info = info
        self.isLast = isLAst
        applyRevitionButton.isHidden = !isLAst
        applyRevitionButton.isEnabled = isLAst
        infoForCell = info
        let dose = info.dose.split(separator: "_")
        if let image = UIImage(named: info.dose) {
            treatmentImageView.image = image
            
        }
        
        evaluationNumberLabel.text = "Evaluación \(info.evaluationNumber)"
        algorithmNameLabel.text = getAlgorithmName(algorithmId: String(dose[0]))
        let date = info.createdAt.dateValue()
        dateLabel.text = "\(date.dateToMxnString2())"
        
        for view in revitionsStack.arrangedSubviews {
            revitionsStack.removeArrangedSubview(view)
        }
        
        if revitionsStack.arrangedSubviews.count != 0 && revitionsStack.arrangedSubviews.count < info.observations.count {
            guard let newRevition = info.observations.last else { return }
            let today = newRevition.createdAt.dateValue()
            let formatter1 = DateFormatter()
            formatter1.dateStyle = .short
            let rView = UINib(nibName: "RevisionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RevisionView
            rView.delegate = self
            rView.setInfo(index: 0, title: formatter1.string(from: today), sub: newRevition.content)
            revitionsStack.addArrangedSubview(rView)
        } else if revitionsStack.arrangedSubviews.count == 0 {
            for newObservation in info.observations {
                let today = newObservation.createdAt.dateValue()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let rView = UINib(nibName: "RevisionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RevisionView
                rView.setInfo(index: 0, title: formatter1.string(from: today), sub: newObservation.content)
                rView.delegate = self
                revitionsStack.addArrangedSubview(rView)
            }
        }
    }
    
    override func prepareForReuse() {
        guard let infoForCell = info else { return }
        setInfo(info: infoForCell, isLAst: isLast)
    }
    
    func getAlgorithmName(algorithmId: String) -> String {
        var alg = algorithmId
        switch alg.popLast() {
        case "A":
            return A.title
        case "B":
            return B.title
        case "C":
            return C.title
        case "D":
            return D.title
        case "E":
            return E.title
        case "F":
            return F.title
        default:
            return ""
        }
    }

}

extension TableViewCellRevition: RevitionToListDelegate {
    func revitionToList(date: String, comment: String) {
        delegate?.listToController(date: date, comment: comment)
    }
}
