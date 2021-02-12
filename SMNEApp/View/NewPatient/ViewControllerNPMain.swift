//
//  ViewControllerNPMain.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 29/01/21.
//

import UIKit
import MaterialComponents.MDCButton

class ViewControllerNPMain: UIViewController {
    
    var pageViewCotroller: ViewControllerNPPageView!
    @IBOutlet weak var returnButton: MDCButton!
    @IBOutlet weak var nextButton: MDCButton!
    @IBOutlet weak var placeHolderButton: MDCButton!
    
    @IBOutlet weak var stepTitleLabel: UILabel!
    @IBOutlet weak var stepSubtitleLabel: UILabel!
    
    @IBOutlet weak var s1Button: UIButton!
    @IBOutlet weak var s1View: UIView!
    @IBOutlet weak var s2Button: UIButton!
    @IBOutlet weak var s2View: UIView!
    @IBOutlet weak var s3Button: UIButton!
    @IBOutlet weak var s3View: UIView!
    @IBOutlet weak var s4Button: UIButton!
    @IBOutlet weak var s4View: UIView!
    @IBOutlet weak var s5Button: UIButton!
    
    @IBOutlet weak var exitFlowButton: UIButton!
    
    var index = 0
    
    var patientInfo: PatientInfo = PatientInfo(id: "", date: "", type: "", age: 0, gender: "", racial: false, diabetesDate: "", IMC: 0, renal: false, cardio: false, hipo: false)
    var map = "00000"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        returnButton.setBorderColor(.C2(), for: .normal)
        returnButton.setBorderWidth(1, for: .normal)
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        let dateIng = formatter1.string(from: today)
        
        let dateSeparated = dateIng.split(separator: "/")
        let dateMX = "\(dateSeparated[1])/\(dateSeparated[0])/\(dateSeparated[2])"
        patientInfo.date = dateMX
        
        let S1 = pageViewCotroller.subViewControllers[0] as! TableViewControllerNewPatient_S1
        S1.delegate = self
        
        let S2 = pageViewCotroller.subViewControllers[1] as! TableViewControllerNewPatient_S2
        S2.delegate = self
        
        let S3 = pageViewCotroller.subViewControllers[2] as! TableViewControllerNewPatient_S3
        S3.delegate = self
        
        initViews()
        
    }
    
    func initViews() {
        switch index {
        case 0:
            let info = stepOne[0] as! TitleCell
            stepTitleLabel.text = info.title
            stepSubtitleLabel.text = info.subtitle
            placeHolderButton.isHidden = false
            exitFlowButton.isHidden = false
            returnButton.isHidden = true
            break
        case 1:
            let info = stepTwo[0] as! TitleCell
            stepTitleLabel.text = info.title
            stepSubtitleLabel.text = info.subtitle
            exitFlowButton.isHidden = true
            returnButton.isHidden = false
            nextButton.isHidden = false
            placeHolderButton.isHidden = true
            break
        case 2:
            let info = stepThree[0] as! TitleCell
            stepTitleLabel.text = info.title
            stepSubtitleLabel.text = info.subtitle
            nextButton.isHidden = true
            placeHolderButton.isHidden = false
            print(map)
            print(algorithmsMatch[map])
            break
        case 3:
            let info = stepFour[0] as! TitleCell
            stepTitleLabel.text = info.title
            stepSubtitleLabel.text = info.subtitle
            nextButton.isHidden = false
            placeHolderButton.isHidden = true
            break
        case 4:
            let info = stepFive[0] as! TitleCell
            stepTitleLabel.text = info.title
            stepSubtitleLabel.text = info.subtitle
            break
        default:
            break
        }
    }
    
    private func prepareStepThree(){
        
        guard let algorithms = algorithmsMatch[map] else { return }
        if algorithms.count > 1 {
            stepThree = [TitleCell(title: "Con base en los datos de tu paciente existen 2 posibles alternativas", subtitle: ""), StepperCell(page: 3)]
        } else {
            stepThree = [TitleCell(title: "Con base en los datos de tu paciente, este es el algoritmo que le corresponde", subtitle: ""), StepperCell(page: 3)]
        }
        
        for index in 0...algorithms.count - 1 {
            if index % 2 == 0 {
                stepThree.append(AlgorithmCell(title: algorithms[index].title, backColor: .C1(), textColor: .white))
            } else {
                stepThree.append(AlgorithmCell(title: algorithms[index].title, backColor: .C2(), textColor: .C3()))
            }
        }
        let reinitClass = ReinitStepCells()
        reinitClass.reinitS3()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PVCMainSegue" {
            if segue.destination.isKind(of: ViewControllerNPPageView.self) {
                pageViewCotroller = (segue.destination as! ViewControllerNPPageView)
            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: MDCButton) {
        print(patientInfo)
        if patientInfo.age != 0 && patientInfo.diabetesDate != "" {
            if index < 4 {
                if index == 1 {
                    prepareStepThree()
                }
                index += 1
                changeStepperUp()
                indexChanged()
            }
        } else {
            print("Registra todo")
        }
        
    }
    
    @IBAction func returnButtonTapped(_ sender: MDCButton) {
        if index > 0 {
            index -= 1
            changeStepperDown()
            indexChanged()
        }
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        if index == 0 {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func changeStepperDown() {
        switch index {
        case 0:
            s1Button.backgroundColor = .C1()
            s1View.backgroundColor = .C1()
            s2Button.backgroundColor = .white
            s2Button.setTitleColor(.C4(), for: .normal)
            s2View.backgroundColor = .C4()
            break
        case 1:
            s2Button.backgroundColor = .C1()
            s2View.backgroundColor = .C1()
            s3Button.backgroundColor = .white
            s3Button.setTitleColor(.C4(), for: .normal)
            s3View.backgroundColor = .C4()
            break
        case 2:
            s3Button.backgroundColor = .C1()
            s3View.backgroundColor = .C1()
            s4Button.backgroundColor = .white
            s4Button.setTitleColor(.C4(), for: .normal)
            s4View.backgroundColor = .C4()
            break
        case 3:
            s4Button.backgroundColor = .C1()
            s4View.backgroundColor = .C1()
            s5Button.backgroundColor = .white
            s5Button.setTitleColor(.C4(), for: .normal)
            break
        default:
            break
        }
    }
    
    private func changeStepperUp() {
        switch index {
        case 1:
            s1Button.backgroundColor = .C2()
            s1View.backgroundColor = .C2()
            s1Button.setTitleColor(.white, for: .normal)
            s2Button.backgroundColor = .C1()
            s2View.backgroundColor = .C1()
            break
        case 2:
            s2Button.backgroundColor = .C2()
            s2View.backgroundColor = .C2()
            s2Button.setTitleColor(.white, for: .normal)
            s3Button.backgroundColor = .C1()
            s3View.backgroundColor = .C1()
            break
        case 3:
            s3Button.backgroundColor = .C2()
            s3View.backgroundColor = .C2()
            s3Button.setTitleColor(.white, for: .normal)
            s4Button.backgroundColor = .C1()
            s4View.backgroundColor = .C1()
            break
        case 4:
            s4Button.backgroundColor = .C2()
            s4View.backgroundColor = .C2()
            s4Button.setTitleColor(.white, for: .normal)
            s5Button.backgroundColor = .C1()
            break
        default:
            break
        }
    }
    
    private func indexChanged() {
        initViews()
        pageViewCotroller.setViewControllerFromIndex(index: index)
    }
}

extension ViewControllerNPMain: InfoChangedDelegate, OptionSelectedDelegate {
    func optionDelegate(option: Int) {
        index += 1
        changeStepperUp()
        indexChanged()
    }
    
    func infoChanged(id: String, info: Any) {
        print(id)
        print(info)
        switch id {
        //S1
        case "type":
            patientInfo.type = info as! String
            break
        case "age":
            patientInfo.age = Int(info as! String) ?? 0
            mapAssign(index: 2, flag: patientInfo.age > 65 ? true : false)
            break
        case "gender":
            patientInfo.gender = info as! String
            break
        case "racial":
            let racial =  info as! String == "Afroamericano" ? true : false
            patientInfo.racial = racial
            break
        case "diabetes":
            patientInfo.diabetesDate = info as! String
            break
        //S2
        case "IMC":
            patientInfo.IMC = info as! Float
            mapAssign(index: 4, flag: patientInfo.IMC >= 30 ? true : false)
            break
        case "renal":
            patientInfo.renal = info as! Bool
            mapAssign(index: 0, flag: patientInfo.renal)
            break
        case "cardio":
            patientInfo.cardio = info as! Bool
            mapAssign(index: 1, flag: patientInfo.cardio)
            break
        case "hipo":
            patientInfo.hipo = info as! Bool
            mapAssign(index: 3, flag: patientInfo.hipo)
            break
        default:
            break
        }
    }
    
    func mapAssign(index: Int, flag: Bool) {
        var mapArray = ArraySlice(map)
        mapArray[index] = flag == true ? "1" : "0"
        map = ""
        for i in mapArray {
            map.append(i)
        }
    }
}
