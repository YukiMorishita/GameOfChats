//
//  ChatInputContainerView.swift
//  gameofchats
//
//  Created by admin on 2019/07/26.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ChatInputContainerView: UIView, UITextFieldDelegate {
    
    weak var chatLogController: ChatLogController? {
        didSet {
            sendButton.addTarget(self.chatLogController, action: #selector(self.chatLogController?.handleSend), for: .touchUpInside)
            uploadImageView.addGestureRecognizer(UITapGestureRecognizer(target: self.chatLogController, action: #selector(self.chatLogController?.handleUploadTap)))
        }
    }
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter message..."
        textField.delegate = self
        return textField
    }()
    
    let uploadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "upload_image_icon")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Send", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        let separatorLineView = UIView()
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        separatorLineView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        
        addSubview(uploadImageView)
        addSubview(inputTextField)
        addSubview(sendButton)
        addSubview(separatorLineView)
        
        NSLayoutConstraint.activate([
            uploadImageView.leftAnchor.constraint(equalTo: leftAnchor),
            uploadImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            uploadImageView.widthAnchor.constraint(equalToConstant: 44),
            uploadImageView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            self.inputTextField.leftAnchor.constraint(equalTo: uploadImageView.rightAnchor, constant: 8),
            self.inputTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.inputTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor),
            self.inputTextField.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            sendButton.rightAnchor.constraint(equalTo: rightAnchor),
            sendButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 80),
            sendButton.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separatorLineView.leftAnchor.constraint(equalTo: leftAnchor),
            separatorLineView.topAnchor.constraint(equalTo: topAnchor),
            separatorLineView.widthAnchor.constraint(equalTo: widthAnchor),
            separatorLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        chatLogController?.handleSend()
        return true
    }
}
