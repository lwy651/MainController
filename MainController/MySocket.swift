//
//  MySocket.swift
//  MainController
//
//  Created by 651 on 2017/6/11.
//  Copyright © 2017年 651. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

class MySocket:NSObject{
    static let socketInstance = MySocket()
    var client_socket:GCDAsyncSocket?
    var socketTimer:Timer?
    override init(){
        super.init()
        connectServer()
    }
    //开始连接
    func connectServer() {
        client_socket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        do {
            try client_socket?.connect(toHost: "127.0.0.1", onPort: 8081)
        }catch _ {
            //print("连接失败")
        }
    }
    public func sendMes(sendMesStr:String){
        client_socket?.write(sendMesStr.data(using: String.Encoding.utf8)!, withTimeout: 3, tag: 0)
    }
}
extension MySocket:GCDAsyncSocketDelegate{
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print("连接成功")
        socketTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(MySocket.longConnectToSocket), userInfo: nil, repeats: true)
        socketTimer?.fire()
    }
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        print("连接失败")
        connectServer()
        socketTimer?.invalidate()
    }
    func longConnectToSocket(){
        print("reconnect")
        let longConnect = "zk";
        let dataStream = longConnect.data(using: String.Encoding.utf8)
        client_socket?.write(dataStream!, withTimeout: -1, tag: 1)
    }
}
