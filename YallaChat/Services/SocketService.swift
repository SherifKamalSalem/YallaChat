//
//  SocketService.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/30/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    var manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(false), .forcePolling(true)])
    lazy var socket = SocketIOClient(manager: manager, nsp: "someSocket")

    override init() {
        super.init()
        socket.on("test") { dataArray, ack in
            print(dataArray) }
    }
    
    //var socket = SocketIOClient(manager: SocketManager(socketURL: URL(string: BASE_URL)!), nsp: "socket")

    //var manager = SocketManager(socketURL: URL(string: BASE_URL)!)
    
    //lazy var socket : SocketIOClient = manager.defaultSocket
    
    func establishConnection() {
        socket.connect()
        print("socket connected \(socket.debugDescription)")
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription)
        print("addChannel")
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            print(dataArray)
            print(ack)
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(id: channelId, name: channelName, description: channelDesc)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    func getChatMessage(completion: @escaping (_ newMessage: Message) -> Void) {
        socket.on("messageCreated") { (dataArray, ack) in
            
            guard let msgBody = dataArray[0] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            guard let userName = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvatarColor = dataArray[5] as? String else { return }
            guard let timeStamp = dataArray[6] as? String else { return }
            guard let id = dataArray[7] as? String else { return }
            
            if channelId == MessageService.instance.selectedChannel?.id && AuthService.instance.isLoggedIn {
                
                let newMessage = Message(message: msgBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                completion(newMessage)
                MessageService.instance.messages.append(newMessage)
            } else {
                //completion(false)
            }
        }
    }
}
