//
//  TableViewCellRevition.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 19/03/21.
//

import UIKit

class TableViewCellRevition: UITableViewCell {
    
    @IBOutlet weak var evaluationNumberLabel: UILabel!
    @IBOutlet weak var algorithmNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var evaluationBackView: UIView!
    @IBOutlet weak var evaluationFrontView: UIView!
    @IBOutlet weak var revitionsStack: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var treatmentStack: UIStackView!
    @IBOutlet weak var applyRevitionButton: UIButton!
    
    var infoForCell: EvaluationSchema?
    var observationsViews = [RevisionView]()
    
    var observations = [ObservationSchema]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        evaluationBackView.layer.cornerRadius = 27
        evaluationFrontView.layer.cornerRadius = 19
    }
    
    func setInfo(info: EvaluationSchema, isLAst: Bool) {
        applyRevitionButton.isHidden = !isLAst
        applyRevitionButton.isEnabled = isLAst
        infoForCell = info
        let dose = info.dose.split(separator: "_")
        var number = dose[1]
        let treatmentList = TreatmentsFromDB()
        for treatment in treatmentList.treatmentList {
            if treatment.first?.name == info.dose {
                titleLabel.text = treatment.first?.title
                if let descriptionsList = treatment.first?.description {
                    var descriptionCom = ""
                    for desc in descriptionsList {
                        descriptionCom.append("\(desc) \n")
                    }
                    subtitleLabel.text = descriptionCom
                }
            }
        }
        evaluationNumberLabel.text = "Evaluación \(number.popLast()!)"
        algorithmNameLabel.text = getAlgorithmName(algorithmId: String(dose[0]))
        let date = info.createdAt.dateValue()
        dateLabel.text = "\(date.dateToMxnString())"
        
        
        if revitionsStack.arrangedSubviews.count != 0 && revitionsStack.arrangedSubviews.count < info.observations.count {
            guard let newRevition = info.observations.last else { return }
            let today = newRevition.createdAt.dateValue()
            let formatter1 = DateFormatter()
            formatter1.dateStyle = .short
            let rView = UINib(nibName: "RevisionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RevisionView
            rView.setInfo(index: 0, title: formatter1.string(from: today), sub: newRevition.content)
            revitionsStack.addArrangedSubview(rView)
        } else if revitionsStack.arrangedSubviews.count == 0 {
            for newObservation in info.observations {
                let today = newObservation.createdAt.dateValue()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .short
                let rView = UINib(nibName: "RevisionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! RevisionView
                rView.setInfo(index: 0, title: formatter1.string(from: today), sub: newObservation.content)
                revitionsStack.addArrangedSubview(rView)
            }
        }
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
