//
//  ViewControllerNPMain.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 29/01/21.
//

import UIKit
import MaterialComponents.MDCButton
import FirebaseFirestore
import Firebase

class ViewControllerNPMain: UIViewController {
    
    var pageViewCotroller: ViewControllerNPPageView!
    @IBOutlet weak var returnButton: MDCButton!
    @IBOutlet weak var nextButton: MDCButton!
    @IBOutlet weak var placeHolderButton: MDCButton!
    
    @IBOutlet weak var stepTitleLabel: UILabel!
    @IBOutlet weak var stepSubtitleLabel: UILabel!
    @IBOutlet weak var stepperView: UIView!
    
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
    
    var currentEv = 0
    
    var patientShema = PatientSchema(pId: "", age: 0, name: "", lastName: "", birthDate: nil, consultationType: .privada, country: "México", dose: "", createdAt: Timestamp(), diagnosisYear: 0, gender: .fem, height: 0.0, racialAncestry: .No, updatedAt: Timestamp(), weight: 0.0, currentEvaluation: 0, currentTreatment: .A, evaluations: [])
    var evaluationSchema: EvaluationSchema?
    var commentSchema: ObservationSchema?
    let fireclass = FirebaseViewModel()
    
    var index = 0
    
    var patientInfo: PatientInfo = PatientInfo(id: "",name: "", lastName: "", date: "", type: "", age: 0, gender: "", racial: false, diabetesDate: "", IMC: 0.0, algorithID: "", hba1c: 0.0, glucose: 0.0, filterCup: "", comment: "")
    var map = "00000"
    var algorithmID = ""
    var treatmentForDB: [TreatmentFromDB] = []
    
    var featherImage = #imageLiteral(resourceName: "feather")
    var viewColor = UIColor(red: 0.67, green: 0.86, blue: 0.96, alpha: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        returnButton.setBorderColor(.C00D9CC(), for: .normal)
        returnButton.setBorderWidth(1, for: .normal)
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        let dateIng = formatter1.string(from: today)
        
        let dateSeparated = dateIng.split(separator: "/")
        let dateMX = "\(dateSeparated[1])/\(dateSeparated[0])/\(dateSeparated[2])"
        patientInfo.date = dateMX
        
        patientInfo.id = PatientSelected.shared.patientInfo?.pId ?? fireclass.patientDoc?.documentID ?? ""
        
        initViews()
        initButtons()
        initSchemas()
        
        let S1 = pageViewCotroller.subViewControllers[0] as! TableViewControllerNewPatient_S1
        S1.patientId = patientInfo.id
        S1.delegate = self
        
        let S2 = pageViewCotroller.subViewControllers[1] as! TableViewControllerNewPatient_S2
        S2.delegate = self
        
        let S3 = pageViewCotroller.subViewControllers[2] as! TableViewControllerNewPatient_S3
        S3.delegate = self
        S3.delegateInfo = self
        
        let S4 = pageViewCotroller.subViewControllers[3] as! TableViewControllerNewPatient_S4
        S4.delegate = self
        
        
        
    }
    
    func initSchemas() {
        if PatientSelected.shared.patientInfo != nil {
            guard let pSInfo = PatientSelected.shared.patientInfo else { return }
            patientShema = PatientSelected.shared.patientInfo!
            evaluationSchema = EvaluationSchema(age: patientShema.age,
                                                cardiovascularComplications: patientShema.evaluations.last!.cardiovascularComplications,
                                                chronicKidneyDisease: patientShema.evaluations.last!.chronicKidneyDisease,
                                                consultationType: patientShema.consultationType,
                                                createdAt: patientShema.createdAt,
                                                creatinineLevels: patientShema.evaluations.last!.creatinineLevels,
                                                diagnosisYear: patientShema.diagnosisYear,
                                                dose: patientShema.evaluations.last!.dose,
                                                evaluationNumber: patientShema.evaluations.last!.evaluationNumber,
                                                estimatedGlomerularFiltrationRate: patientShema.evaluations.last!.estimatedGlomerularFiltrationRate,
                                                fastingGlucose: patientShema.evaluations.last!.fastingGlucose,
                                                gender: patientShema.gender,
                                                glycosylatedHemoglobin: patientShema.evaluations.last!.glycosylatedHemoglobin,
                                                height: patientShema.evaluations.last!.height,
                                                hypoglycemia: patientShema.evaluations.last!.hypoglycemia,
                                                imc: patientShema.evaluations.last!.imc,
                                                racialAncestry: patientShema.racialAncestry,
                                                treatment: patientShema.currentTreatment,
                                                weight: patientShema.evaluations.last!.weight,
                                                observations: [])
            patientInfo = PatientInfo(id: pSInfo.pId,
                                      name: pSInfo.name,
                                      lastName: pSInfo.lastName,
                                      date: pSInfo.birthDate?.dateToMxnString() ?? "",
                                      type: pSInfo.consultationType.rawValue,
                                      age: pSInfo.age,
                                      gender: pSInfo.gender.rawValue,
                                      racial: pSInfo.racialAncestry == .Afroamericano ? true:false,
                                      diabetesDate: "\(pSInfo.diagnosisYear)",
                                      IMC: Float(pSInfo.evaluations.last!.imc),
                                      renal: pSInfo.evaluations.last?.chronicKidneyDisease,
                                      cardio: pSInfo.evaluations.last?.cardiovascularComplications,
                                      hipo: pSInfo.evaluations.last?.hypoglycemia,
                                      algorithID: pSInfo.currentTreatment.rawValue,
                                      hba1c: pSInfo.evaluations.last!.glycosylatedHemoglobin,
                                      glucose: Float(pSInfo.evaluations.last!.fastingGlucose),
                                      filterCup: pSInfo.evaluations.last?.estimatedGlomerularFiltrationRate.rawValue ?? FiltrationEnum.na.rawValue,
                                      comment: "")
            mapAssign(index: 0, flag: patientInfo.renal!)
            mapAssign(index: 1, flag: patientInfo.cardio!)
            mapAssign(index: 2, flag: patientInfo.age > 65 ? true : false)
            mapAssign(index: 3, flag: patientInfo.hipo!)
            mapAssign(index: 4, flag: patientInfo.IMC >= 30 ? true : false)
        } else {
            patientShema = PatientSchema(pId: "", age: 0, name: "", lastName: "", birthDate: nil, consultationType: .privada, country: "México", dose: "", createdAt: Timestamp(), diagnosisYear: 0, gender: .fem, height: 0.0, racialAncestry: .No, updatedAt: Timestamp(), weight: 0.0, currentEvaluation: 0, currentTreatment: .A, evaluations: [])
            evaluationSchema = EvaluationSchema(age: 0, cardiovascularComplications: false, chronicKidneyDisease: false, consultationType: .privada, createdAt: Timestamp(), creatinineLevels: 0.0, diagnosisYear: 0, dose: "", evaluationNumber: 0, estimatedGlomerularFiltrationRate: .uno, fastingGlucose: 0.0, gender: .fem, glycosylatedHemoglobin: 0.0, height: 0.0, hypoglycemia: false, imc: 0.0, racialAncestry: .No, treatment: .A, weight: 0.0, observations: [])
        }
        commentSchema = ObservationSchema(createdAt: Timestamp(), content: "")
    }
    
    func initButtons() {
        let border = viewColor.cgColor
        s1Button.layer.cornerRadius = 11
        s1Button.layer.borderWidth = 1
        s1Button.layer.borderColor = border
        
        s2Button.layer.cornerRadius = 11
        s2Button.layer.borderWidth = 1
        s2Button.layer.borderColor = border
        
        s3Button.layer.cornerRadius = 11
        s3Button.layer.borderWidth = 1
        s3Button.layer.borderColor = border
        
        s4Button.layer.cornerRadius = 11
        s4Button.layer.borderWidth = 1
        s4Button.layer.borderColor = border
        
        s5Button.layer.cornerRadius = 11
        s5Button.layer.borderWidth = 1
        s5Button.layer.borderColor = border
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
            stepperView.backgroundColor = .CE0F5F8()
            break
        case 2:
            let info = stepThree[0] as! TitleCell
            stepTitleLabel.text = info.title
            stepSubtitleLabel.text = info.subtitle
            nextButton.isHidden = true
            placeHolderButton.isHidden = false
            stepperView.backgroundColor = .C052D6C()
            print(map)
            print(algorithmsMatch[map] as Any)
            break
        case 3:
            let info = stepFour[0] as! TitleCell
            stepTitleLabel.text = info.title
            stepSubtitleLabel.text = info.subtitle
            nextButton.isHidden = false
            placeHolderButton.isHidden = true
            stepperView.backgroundColor = .CE0F5F8()
            nextButton.setTitle("Siguiente", for: .normal)
            nextButton.setTitle(nextButton.title(for: .normal)?.capitalizingFirstLetter(), for: .normal)
            nextButton.isUppercaseTitle = false
            break
        case 4:
            let info = stepFive[0] as! TitleCell
            nextButton.setTitle("Terminar", for: .normal)
            nextButton.setTitle(nextButton.title(for: .normal)?.capitalizingFirstLetter(), for: .normal)
            nextButton.isUppercaseTitle = false
            stepTitleLabel.text = info.title
            stepSubtitleLabel.text = info.subtitle
            stepperView.backgroundColor = .C052D6C()
            break
        default:
            break
        }
    }
    
    private func prepareStepThree(){
        
        guard let algorithms = algorithmsMatch[map] else { return }
        if algorithms.count > 1 {
            stepThree = [TitleCell(title: "Con base en los datos de tu paciente existen 2 posibles alternativas", subtitle: "")]
        } else {
            stepThree = [TitleCell(title: "Con base en los datos de tu paciente, este es el algoritmo que le corresponde", subtitle: "")]
        }
        
        for index in 0...algorithms.count - 1 {
            if index % 2 == 0 {
                stepThree.append(AlgorithmCell(id: algorithms[index].ID, title: algorithms[index].title, backColor: .C0093FF(), textColor: .white))
            } else {
                stepThree.append(AlgorithmCell(id: algorithms[index].ID, title: algorithms[index].title, backColor: .C00D9CC(), textColor: .C052D6C()))
            }
        }
        let reinitClass = ReinitStepCells()
        reinitClass.reinitS3()
    }
    
    private func prepareStepFour() {
        
        stepFour = [TitleCell(title: "Tratamiento farmacológico DM2", subtitle: "Ya casi terminamos."), OpenOpenCell(title1: "Niveles de HbA1c", title2: "Glucosa de ayuno", trailing1: "%", trailing2: "mg")]
        patientInfo.meta = nil
        if algorithmID == "C" {
            stepFour.append(MultiRadioCell(title: ""))
        } else if algorithmID == "E" && patientShema.evaluations.count > 0 && PatientSelected.shared.isFromFirst != true {
            stepFour.append(DeteriorationCell(title: ""))
            patientInfo.meta = -1
        }
        stepFour.append(CommentCell(title: ""))
        let reinitClass = ReinitStepCells()
        reinitClass.reinitS4()
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
        if validationsStep1() {
            if index < 4 {
                if index == 1 {
                    if validationsStep2() {
                        prepareStepThree()
                    } else {
                        AlertToast.show(message: "Registra todo", controller: self, type: .Error) {
                        }
                        print("Llena todo")
                        return
                    }
                }
                if index == 3 {
                    if validationsStep4() {
                        let prepare5 = ModelViewStep5()
                        let algorithm = patientInfo.algorithID
                        let hba1c = patientInfo.hba1c
                        let glucose = patientInfo.glucose
                        currentEv = PatientSelected.shared.patientInfo?.currentEvaluation ?? 0
                        currentEv += 1
                        if PatientSelected.shared.isFromFirst {
                            currentEv = 1
                        }
                        evaluationSchema?.evaluationNumber = currentEv
                        let prevD = PatientSelected.shared.patientInfo?.dose ?? ""
                        let hipo = patientInfo.hipo
                        let filterCup = patientInfo.filterCup
                        if algorithmID != "C" {
                            if algorithmID == "E" {
                                self.treatmentForDB = prepare5.getOptionsFromDB(hba1c: hba1c, glucose: glucose, filter: filterCup ?? "", currentEv: currentEv, prevDose: prevD, meta: self.patientInfo.meta)
                            } else {
                                patientInfo.filterCup = nil
                                self.treatmentForDB = prepare5.getOptionsFromDB(algorithm: algorithm, hba1c: hba1c, glucose: glucose, currentEv: currentEv, prevDose: prevD, hypoglycemia: hipo)
                            }
                        } else {
                            self.treatmentForDB = prepare5.getOptionsFromDB(hba1c: hba1c, glucose: glucose, filter: filterCup!, currentEv: currentEv, prevDose: prevD)
                        }
                        if treatmentForDB.first?.name == prevD {
                            currentEv -= 1
                        }
                        if self.treatmentForDB.first!.name == TreatmentsFromDB().TDefault.first!.name {
                            AlertToast.show(message: "Los valores están fuera de rango.", controller: self, type: .Error) { }
                            return
                        } else {
                            prepare5.getStep5(options: self.treatmentForDB)
                        }
                    } else {
                        AlertToast.show(message: "Registra todo", controller: self, type: .Error) {
                        }
                        return
                    }
                }
                index += 1
                changeStepperUp()
                indexChanged()
            } else if index == 4 {
                evaluationSchema?.observations.append(commentSchema!)
                patientShema.evaluations.append(evaluationSchema!)
                let nextVC = ViewControllerPillAnimation(nibName: "ViewControllerPillAnimation", bundle: nil)
                nextVC.setAnim(type: .treatment)
                let delegate: EndPillAnimationProtocol = nextVC
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true) { [self] in
                    let dose = createDose()
                    let dict = fireclass.createDictionary(patientInfo: self.patientShema, dose: dose)
                    let _ = fireclass.setPatient(info: dict, patientId: patientInfo.id) { () in
                        delegate.endAnimationWith {
                            PatientSelected.shared.hasChanged = true
                            PatientSelected.shared.isFromFirst = false
                            PatientSelected.shared.patientInfo?.evaluations.append(self.evaluationSchema!)
                            self.dismiss(animated: true) {
                                let delegate = SingletonForDelegate.shared
                                if evaluationSchema?.treatment == .D {
                                    delegate.needToChange = true
                                }
                                delegate.delegate?.changeView()
                            }
                        }
                    }
                }
            }
        } else {
            AlertToast.show(message: "Registra todo", controller: self, type: .Error) {
            }
            print("Registra todo")
        }
        
    }
    
    func createDose() -> String {
        return self.treatmentForDB[0].name
    }
    
    func validationsStep1() -> Bool {
        if patientInfo.age != 0 && patientInfo.diabetesDate != "" && patientInfo.type != "" && patientInfo.gender != "" {
            return true
        }
        return false
    }
    
    func validationsStep2() -> Bool {
        if patientInfo.IMC != 0.0 && patientInfo.renal != nil && patientInfo.cardio != nil && patientInfo.hipo != nil {
            return true
        }
        return false
    }
    
    func validationsStep4() -> Bool {
        if evaluationSchema?.evaluationNumber == 1 {
            if patientInfo.comment != "" && (patientInfo.hba1c != 0 || patientInfo.glucose != 0) && (patientInfo.meta == nil || patientInfo.meta != -1) {
                return true
            }
        } else {
            if patientInfo.comment != "" && patientInfo.hba1c != 0 && (patientInfo.meta == nil || patientInfo.meta != -1) {
                return true
            }
        }
        return false
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
            PatientSelected.shared.isFromFirst = false
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func changeStepperDown() {
        switch index {
        case 0:
            s1Button.backgroundColor = .C0093FF()
            s1View.backgroundColor = viewColor
            s1Button.setImage(UIImage(), for: .normal)
            s1Button.setTitle("1", for: .normal)
            s2Button.backgroundColor = .white
            s2Button.setTitleColor(.C9FDDF9(), for: .normal)
            s2View.backgroundColor = .C9FDDF9()
            break
        case 1:
            s2Button.backgroundColor = .C0093FF()
            s2View.backgroundColor = viewColor
            s2Button.setImage(UIImage(), for: .normal)
            s2Button.setTitle("2", for: .normal)
            s3Button.backgroundColor = .white
            s3Button.setTitleColor(.C9FDDF9(), for: .normal)
            s3View.backgroundColor = .C9FDDF9()
            break
        case 2:
            s3Button.backgroundColor = .C0093FF()
            s3View.backgroundColor = viewColor
            s3Button.setImage(UIImage(), for: .normal)
            s3Button.setTitle("3", for: .normal)
            s4Button.backgroundColor = .white
            s4Button.setTitleColor(.C9FDDF9(), for: .normal)
            s4View.backgroundColor = .C9FDDF9()
            break
        case 3:
            s4Button.backgroundColor = .C0093FF()
            s4View.backgroundColor = viewColor
            s4Button.setImage(UIImage(), for: .normal)
            s4Button.setTitle("4", for: .normal)
            s5Button.backgroundColor = .white
            s5Button.setTitleColor(.C9FDDF9(), for: .normal)
            break
        default:
            break
        }
    }
    
    private func changeStepperUp() {
        switch index {
        case 1:
            s1Button.backgroundColor = .C00D9CC()
            s1Button.setImage(featherImage, for: .normal)
            s1Button.imageView?.tintColor = .white
            s1Button.tintColor = .white
            s1Button.setTitle("", for: .normal)
            s1View.backgroundColor = .C00D9CC()
            s1Button.setTitleColor(.white, for: .normal)
            s2Button.backgroundColor = .C0093FF()
            break
        case 2:
            s2Button.backgroundColor = .C00D9CC()
            s2Button.setImage(featherImage, for: .normal)
            s2Button.tintColor = .white
            s2Button.setTitle("", for: .normal)
            s2View.backgroundColor = .C00D9CC()
            s2Button.setTitleColor(.white, for: .normal)
            s3Button.backgroundColor = .C0093FF()
            break
        case 3:
            s3Button.backgroundColor = .C00D9CC()
            s3Button.setImage(featherImage, for: .normal)
            s3Button.tintColor = .white
            s3Button.setTitle("", for: .normal)
            s3View.backgroundColor = .C00D9CC()
            s3Button.setTitleColor(.white, for: .normal)
            s4Button.backgroundColor = .C0093FF()
            break
        case 4:
            s4Button.backgroundColor = .C00D9CC()
            s4Button.setImage(featherImage, for: .normal)
            s4Button.tintColor = .white
            s4Button.setTitle("", for: .normal)
            s4View.backgroundColor = .C00D9CC()
            s4Button.setTitleColor(.white, for: .normal)
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
    func showWarning(handler: @escaping (Bool) -> Void) {
        AlertToast.show(message: "Las condiciones del paciente cambiaron. Sugerimos realizar una valoración inicial.", controller: self, type: .Warning) { (isOk) in
            handler(isOk)
        }
    }
    
    func optionDelegate(option: Int, ID: String) {
        print(ID)
        algorithmID = ID
        if index == 2 {
            prepareStepFour()
        }
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
            evaluationSchema?.consultationType = ConsultationEnum(rawValue: info as! String)!
            break
        case "age":
            patientInfo.age = Int(info as! String) ?? 0
            mapAssign(index: 2, flag: patientInfo.age > 64 ? true : false)
            patientShema.age = Int(info as! String) ?? 0
            evaluationSchema?.age = Int(info as! String) ?? 0
            break
        case "gender":
            patientInfo.gender = info as! String
            if info as! String == "fem" {
                patientShema.gender = .fem
                evaluationSchema?.gender = .fem
            } else {
                patientShema.gender = .mas
                evaluationSchema?.gender = .mas
            }
            break
        case "racial":
            let racial =  info as! String == "Afroamericano" ? true : false
            patientInfo.racial = racial
            if info as! String == "Afroamericano" {
                patientShema.racialAncestry = .Afroamericano
                evaluationSchema?.racialAncestry = .Afroamericano
            } else {
                patientShema.racialAncestry = .No
                evaluationSchema?.racialAncestry = .No
            }
            
            break
        case "diabetes":
            patientInfo.diabetesDate = info as! String
            patientShema.diagnosisYear = Int(info as! String) ?? 0
            evaluationSchema?.diagnosisYear = Int(info as! String) ?? 0
            break
        //S2
        case "IMC":
            patientInfo.IMC = info as! Float
            evaluationSchema?.imc = Double(info as! Float)
            mapAssign(index: 4, flag: patientInfo.IMC >= 30 ? true : false)
            break
        case "renal":
            patientInfo.renal = (info as! Bool)
            evaluationSchema?.chronicKidneyDisease = info as! Bool
            mapAssign(index: 0, flag: patientInfo.renal!)
            break
        case "cardio":
            patientInfo.cardio = (info as! Bool)
            evaluationSchema?.cardiovascularComplications = info as! Bool
            mapAssign(index: 1, flag: patientInfo.cardio!)
            break
        case "hipo":
            patientInfo.hipo = (info as! Bool)
            evaluationSchema?.hypoglycemia = info as! Bool
            mapAssign(index: 3, flag: patientInfo.hipo!)
            break
        case "algorithm":
            patientInfo.algorithID = info as! String
            patientShema.currentTreatment = TreatmentEnum(rawValue: info as! String)!
            evaluationSchema?.treatment = TreatmentEnum(rawValue: info as! String)!
            break
        case "hba1c":
            patientInfo.hba1c = info as! Float
            evaluationSchema?.glycosylatedHemoglobin = info as! Float
            break
        case "glucose":
            patientInfo.glucose = info as! Float
            evaluationSchema?.fastingGlucose = Double(info as! Float)
            break
        case "filter":
            patientInfo.filterCup = info as? String
            evaluationSchema?.estimatedGlomerularFiltrationRate = FiltrationEnum(rawValue: info as! String)!
            break
        case "comment":
            patientInfo.comment = info as! String
            commentSchema?.content = info as! String
            break
        case "name":
            patientInfo.name = info as! String
            patientShema.name = info as! String
            break
        case "lastName":
            patientInfo.lastName = info as! String
            patientShema.lastName = info as! String
            break
        case "weight":
            evaluationSchema?.weight = Double(info as! Float)
            break
        case "height":
            evaluationSchema?.height = Double(info as! Float)
            break
        case "levels":
            evaluationSchema?.creatinineLevels = Double(info as! Float)
            break
        case "meta":
            patientInfo.meta = (info as! Float)
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
