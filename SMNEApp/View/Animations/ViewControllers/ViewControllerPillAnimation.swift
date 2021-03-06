//
//  ViewControllerPillAnimation.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 05/03/21.
//

import UIKit
import Lottie

protocol EndPillAnimationProtocol {
    func endAnimation()
}

class ViewControllerPillAnimation: UIViewController {

    
    @IBOutlet weak var animationView: AnimationView!
    var anim: AnimationView?
//    var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        animationView = .init(name: "coffee")
//        animationView?.frame = view.bounds
//        view.addSubview(animationView!)
//        animationView?.play()
        
//        let animation = Animation.named("pill")
//
//        animationView.animation = animation
//        animationView.contentMode = .scaleAspectFit
        
        anim = .init(name: "coffee")
        anim?.frame = view.bounds
        anim?.loopMode = .loop
        view.addSubview(anim!)
        anim?.play(completion: { (flag) in
            if flag {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Usuario cerró")
            }
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        animationView.play(fromProgress: 0, toProgress: 1, loopMode: LottieLoopMode.loop) { (flag) in
//            if flag {
//                print("Acabó")
//            } else {
//                print("La terminaron")
//            }
//        }
    }

}

extension ViewControllerPillAnimation: EndPillAnimationProtocol {
    func endAnimation() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyBoard.instantiateViewController(withIdentifier: "init")
        viewcontroller.modalPresentationStyle = .fullScreen
        self.present(viewcontroller, animated: true) {
            self.anim?.stop()
        }
    }
}
