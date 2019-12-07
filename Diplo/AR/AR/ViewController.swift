//
//  ViewController.swift
//  AR
//
//  Created by Sofìa Gutièrrez on 10/26/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
//import PlaygroundSupport

class ViewController: UIViewController, ARSCNViewDelegate{
    //escena de ARKit, para acceder a la càmara
    var sceneView = ARSCNView(frame: CGRect(x: 0, y: 0, width: 500, height: 600))
    //variable para mover el avion
    var shipNode: SCNNode?
    
    var crosshair = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // creo escena e SceneKi, para posicionar los modelos en 3D
        let scene = SCNScene()
        sceneView.scene = scene
        //convierto sceneView en mi vista principal
        self.view = sceneView
        sceneView.center = self.view.center
        //para debuggear sin que sea vea en el producto final
        sceneView.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        sceneView.delegate = self
        sceneView.session.run(config)
        
        //boton para mover avion
        let forwardButton: UIButton = {
            let btn = UIButton()
            btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            btn.setTitle("🙊", for: .normal)
            return btn
        } ()
        self.view.addSubview(forwardButton)
        
        forwardButton.addTarget(self, action: #selector(moveShip), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        crosshair.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        crosshair.layer.cornerRadius = 10.0
        crosshair.center = self.view.center
        self.view.addSubview(crosshair)
        
        
    }
    
    //conforme detecta planos, crea anchor, que nos dice donde empieza algo, su punto y su posion, permite poner algo en planos 3D
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
        print("Detecté plano")
        
        //info para construir un plano
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        
        //da la extensiòn del lado x
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        
        //construcción del plano, pero hay nada para verlo
        let plane = SCNPlane(width: width, height: height)
        //para hacer visible el plano en la cámara
        plane.materials.first?.diffuse.contents = UIColor.red.withAlphaComponent(0.7)
        //creación de un nodo para posicionar el plano en la escena
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3(x, y, z)
        //rota sobre eje x
        planeNode.eulerAngles.x = -.pi/2
        
        //cargar modelo, carga la escena, toda la escena
        let shipScene = SCNScene(named: "ship.scn")!
        //saco el modelo de la variable, el aviòn está en el elemento 0
        //Cargo saco lo elementos que tiene la escna y el avión es el elemento 0
         shipNode = shipScene.rootNode.childNodes[0]
        //pongo el avion dentro de la escena, para que se mueva dentro de la escena y no solo dentro del plano
        
        guard let shipNode = shipNode else { return }
        sceneView.scene.rootNode.addChildNode(shipNode)
        
        //sacar coordenadas don de pondre avion
        let xShip = CGFloat(planeAnchor.transform.columns.3.x)
        let yShip = CGFloat(planeAnchor.transform.columns.3.y)
        let zShip = CGFloat(planeAnchor.transform.columns.3.z)
        //posiciono el avion
        shipNode.position = SCNVector3(xShip, yShip, zShip)
        //escalo el avion
        shipNode.scale = SCNVector3(0.1, 0.1, 0.1)
        //agregamos el nodo en la escena de AR
        node.addChildNode(planeNode)
        
        //mata la configuración anterior y pone la nueva, ya no pone el plano, sólo pone los puntos
        let newConfing = ARWorldTrackingConfiguration()
        sceneView.session.run(newConfing)
    }

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        DispatchQueue.main.async {
            [unowned self] in
            
            if let hit = self.sceneView.hitTest(self.view.center, options: nil).first {
                guard let nodeName = hit.node.name else {return}
                print(nodeName)
                
                self.crosshair.backgroundColor = UIColor.green.withAlphaComponent(0.3)
            }else{
                self.crosshair.backgroundColor = UIColor.white.withAlphaComponent(0.3)
            }
            
        }
    }
    
    
    
    //funcón de acción para el botón
    @objc func moveShip(){
        //para validar que primero se cargue el modelo
        if let ship = shipNode{
            let actualPosition = ship.position
            //está en metros las medidas
            let newPosition = SCNVector3(actualPosition.x, actualPosition.y, actualPosition.z + 0.2)
            ship.position = newPosition
        }
    }
    
}

//PlaygroudPage.current.liveView = ViewController()
//PlayGroundPage. current.needsIndefiniteExecution = true
