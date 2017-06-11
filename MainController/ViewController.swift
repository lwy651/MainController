//
//  ViewController.swift
//  MainController
//
//  Created by 651 on 2017/6/3.
//  Copyright © 2017年 651. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class ViewController: UIViewController{
    @IBOutlet weak var SendBtn: UIButton!
    //var clientSocket:GCDAsyncSocket?
    let mysocket = MySocket.socketInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //let s2 = MySocket.socketInstance
        //print(s1===s2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SendMes(_ sender: Any) {
        //clientSocket?.write("xiao123".data(using: String.Encoding.utf8)!, withTimeout: 3, tag: 0)
        mysocket.sendMes(sendMesStr: "666")
    }
    
    /*func StartConnect()->Void {
        clientSocket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        do {
            try clientSocket?.connect(toHost: "127.0.0.1", onPort: 8081)
            print("连接成功")
        }catch _ {
            print("连接失败")
        }
    }
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) -> Void {
        print("no")
    }
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        print("close");
    }
    func socketDidSecure(_ sock: GCDAsyncSocket) {
        print(3333)
    }*/
}

