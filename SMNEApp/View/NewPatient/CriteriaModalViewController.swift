//
//  CriteriaModalViewController.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 17/02/22.
//

import UIKit

class CriteriaModalViewController: UIViewController {
    
    let parentView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let firstText: UILabel = {
        let view = UILabel()
        view.text = "● Uso de insulina o secretagogos (SU, meglitinidas)"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondText: UILabel = {
        let view = UILabel()
        view.text = "● Alteración de la función renal (TGFe < 30 ml/min) y/o hepática (Child B o C)"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thirdText: UILabel = {
        let view = UILabel()
        view.text = "● Diabetes > 10 años de evolución"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fourthText: UILabel = {
        let view = UILabel()
        view.text = "● Edad > 65 años /o fragilidad"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fifthText: UILabel = {
        let view = UILabel()
        view.text = "● Antecedentes de hipoglucemia (<70 mg/dl) (>3 eventos/semana y/o que haya requerido asistencia de 3ra persona)"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sixText: UILabel = {
        let view = UILabel()
        view.text = "● Alteración de la respuesta contrarreguladora/hipoglucemia desapercibida"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sevenText: UILabel = {
        let view = UILabel()
        view.text = "● Deterioro cognitivo y/o discapacidad"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let eigthText: UILabel = {
        let view = UILabel()
        view.text = "● Ayunos prolongados"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nineText: UILabel = {
        let view = UILabel()
        view.text = "● Etilismo"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tenText: UILabel = {
        let view = UILabel()
        view.text = "● Uso de medicamentos o combinaciones asociados con hipoglucemia: betabloqueadores (atenol, sobredosis de propranolol), antiarrítmicos (cibenzolina y quinidina), indometacina, quinolonas, pentamidina, quinina, timetroprima con sulfametoxazol"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let elevenText: UILabel = {
        let view = UILabel()
        view.text = "● Combinación de hipoglucemiantes (cualquiera con insulina o SU)"
        view.font = UIFont(name: "Open Sans Regular", size: 14.0)
        view.textColor = UIColor.C052D6C()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let closeButton: UIButton = {
        let view = UIButton()
        view.setTitle("X", for: .normal)
        view.titleLabel?.font = UIFont(name: "Open Sans Bold", size: 19)
        view.setTitleColor(UIColor.C00D9CC(), for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.C00D9CC().cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let backColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8)
        view.backgroundColor = backColor
        
        addSubviews()
        setGestures()
    }
    
    private func addSubviews() {
        stackView.addArrangedSubview(firstText)
        stackView.addArrangedSubview(secondText)
        stackView.addArrangedSubview(thirdText)
        stackView.addArrangedSubview(fourthText)
        stackView.addArrangedSubview(fifthText)
        stackView.addArrangedSubview(sixText)
        stackView.addArrangedSubview(sevenText)
        stackView.addArrangedSubview(eigthText)
        stackView.addArrangedSubview(nineText)
        stackView.addArrangedSubview(tenText)
        stackView.addArrangedSubview(elevenText)
        
        parentView.addSubview(stackView)
        view.addSubview(closeButton)
        view.addSubview(parentView)
        
        setConstraints()
    }
    
    private func setGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        parentView.addGestureRecognizer(tap)
        closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            parentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            parentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            parentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            stackView.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -10),
            
            closeButton.topAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 8),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc private func dismissView() {
        self.dismiss(animated: true)
    }
}
