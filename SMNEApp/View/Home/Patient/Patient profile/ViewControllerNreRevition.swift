//
//  ViewControllerNreRevition.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 22/03/21.
//

import UIKit
import Firebase

class ViewControllerNreRevition: UIViewController {

    @IBOutlet weak var observationInput: UITextView!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        observationInput.layer.cornerRadius = 8
        observationInput.layer.borderWidth = 1
        observationInput.layer.borderColor = UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1).cgColor
        returnButton.layer.cornerRadius = 8
        returnButton.layer.borderWidth = 1
        returnButton.layer.borderColor = UIColor(red: 0.37, green: 0.83, blue: 0.79, alpha: 1).cgColor
        
        saveButton.layer.cornerRadius = 8
        
    }
    
    @IBAction func returnButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let pId = PatientSelected.shared.patientInfo?.pId else { return }
        if observationInput.text != "" {
            returnButton.isEnabled = false
            saveButton.isEnabled = false
            let firebase = FirebaseViewModel()
            firebase.setNewComment(comment: observationInput.text, patientId: pId) { [weak self] (isError) in
                if isError {
                    AlertToast.show(message: "Hubo un error, intente nuevamente.", controller: self!, type: .Error) { }
                    self?.returnButton.isEnabled = true
                    self?.saveButton.isEnabled = true
                } else {
                    AlertToast.show(message: "Revisión guardada con éxito.", controller: self!, type: .Success) {
                        PatientSelected.shared.hasChanged = true
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        } else {
            AlertToast.show(message: "Agregar comentario para revisión.", controller: self, type: .Error) { }
        }
    }
    
}
