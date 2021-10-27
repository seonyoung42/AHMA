//
//  ChatViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/19.
//
import UIKit
import MessageKit
import InputBarAccessoryView

class ChatViewController: MessagesViewController {
   
    
    private var messages = [Message]()
//    private let selfSender = ChatUser(photoURL: "", senderId: "1", displayName: "Joe Smith")
    let currentUser = ChatUser(photoimage: #imageLiteral(resourceName: "profileImage1"), senderId: "self", displayName: "seonyoung")
    
    public static let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .long
        formatter.locale = .current
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
       
        
//        messages.append(Message(sender: currentUser,
//                                messageId: "1",
//                                sentDate: Date(),
//                                kind: .text("Hello World message")))
//        messages.append(Message(sender: currentUser,
//                                messageId: "1",
//                                sentDate: Date(),
//                                kind: .text("Hello World message Hello World message Hello World message")))
        
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}

extension ChatViewController: InputBarAccessoryViewDelegate {
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let message = Message(sender: currentUser, messageId: "1", sentDate: Date(), kind: .text(text))
        messages.append(message)
        messagesCollectionView.reloadData()
       print("Sending: \(text)")
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didChangeIntrinsicContentTo size: CGSize) {
        print("aa")
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, textViewTextDidChangeTo text: String) {
        print("bb")
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didSwipeTextViewWith gesture: UISwipeGestureRecognizer) {
        print("cc")
    }
    
}

extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        messages.count
    }
    
    // - cell Top label
    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        
        if indexPath.section % 3 == 0 {
            let showLoadMore = false
            let text = showLoadMore ? "Pull to load more":
                MessageKitDateFormatter.shared.string(from: message.sentDate)
            let font = showLoadMore ? UIFont.systemFont(ofSize: 13) : UIFont.boldSystemFont(ofSize: 10)
            let color = showLoadMore ? UIColor.systemBlue : UIColor.darkGray
            
            return NSAttributedString(string: text, attributes: [.font: font, .foregroundColor: color])
        }
        
        return nil
    }
    
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        
        if indexPath.section % 3 == 0 {
            
        }
        
        return 10
    }
    
//    func cellBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
//
//        if isFromCurrentSender(message: message) {
//
//            let message = messages[indexPath.section]
//            let status = indexPath.section == messages.count - 1 ? message.sentDate. : ""
//        }
//    }
    
    // sender profile
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.set(avatar: Avatar(image: #imageLiteral(resourceName: "profileImage1"), initials: "장선영" ))
    }
    
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        
        return .label
    }
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        let bubbleColorOutGoing = UIColor(cgColor: CGColor(red: 255/255, green: 211/255, blue: 132/255, alpha: 1))
        
        return bubbleColorOutGoing
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        
        let tail: MessageStyle.TailCorner = .bottomRight
        
        return .bubbleTail(tail, .pointedEdge)
    }
}
