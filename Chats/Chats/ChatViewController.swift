//import AudioToolbox
import UIKit

let messageFontSize: CGFloat = 17
let nameFontSize: CGFloat = 10
let toolBarMinHeight: CGFloat = 44
let textViewMaxHeight: (portrait: CGFloat, landscape: CGFloat) = (portrait: 272, landscape: 90)
//let messageSoundOutgoing: SystemSoundID = createMessageSoundOutgoing()

class ChatViewController: UIViewController {
    let chat: Chat
    var chatView: ChatView!
    var rotating = false


    init(chat: Chat) {
        self.chat = chat
        super.init(nibName: nil, bundle: nil)
        title = chat.user.name
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        chat.loadedMessages = [
            [
                Message(incoming: true, text: "I really enjoyed programming with you! :-)", sentDate: NSDate(timeIntervalSinceNow: -60*60*24*2-60*60)),
                Message(incoming: false, text: "Thanks! Me too! :-)", sentDate: NSDate(timeIntervalSinceNow: -60*60*24*2))
            ],
            [
                Message(incoming: true, text: "Hey, would you like to spend some time together tonight and work on Acani?", sentDate: NSDate(timeIntervalSinceNow: -33)),
                Message(incoming: false, text: "Sure, I'd love to. How's 6 PM?", sentDate: NSDate(timeIntervalSinceNow: -19)),
                Message(incoming: true, text: "6 sounds good :-)", sentDate: NSDate())
            ]
        ]

        view.backgroundColor = UIColor.whiteColor() // smooths push animation
        
        chatView = ChatView(chat: chat, frame: view.bounds)
        
        chatView.superViewDidLoad()
        
        view.addSubview(chatView)
    }

    deinit {
//        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func viewDidAppear(animated: Bool)  {
        super.viewDidAppear(animated)
        chatView.superViewDidAppear()
    }

    override func viewWillDisappear(animated: Bool)  {
        super.viewWillDisappear(animated)
        chatView.superViewWillDisappear()
    }

    // This gets called a lot. Perhaps there's a better way to know when `view.window` has been set?
    override func viewDidLayoutSubviews()  {
        super.viewDidLayoutSubviews()
        chatView.superViewDidLayoutSubviews()
    }
    
    
// #iOS7.1
//    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
//        super.willAnimateRotationToInterfaceOrientation(toInterfaceOrientation, duration: duration)
//        
//        if UIInterfaceOrientationIsLandscape(toInterfaceOrientation) {
//            if toolBar.frame.height > textViewMaxHeight.landscape {
//                toolBar.frame.size.height = textViewMaxHeight.landscape+8*2-0.5
//            }
//        } else { // portrait
//            updateTextViewHeight()
//        }
//    }
    //    // #iOS8
    //    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator!) {
    //        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    //    }

}

