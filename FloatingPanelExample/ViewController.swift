import FloatingPanel

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // SimpleFloatingPanlManagerは変数として保持していないといけない（function内で定義してはいけない）
    var manager: SimpleFloatingPanlManager = SimpleFloatingPanlManager()
    
    @IBAction func tappedShowButton(_ sender: Any) {
        
        // Modalで開く画面
        let nextSecondViewController = UIStoryboard(name: "Second", bundle: nil).instantiateInitialViewController() as! SecondViewController
        // 画面と高さを設定
        manager.setup(semiModalViewController: nextSecondViewController, height: UIScreen.main.bounds.size.height * 0.7)
        // 表示
        self.present(manager.fpc, animated: true, completion: nil)
    }
    
}


/// FloatingPanelは複数の高さに伸び縮みさせることができるが、大抵は１サイズのセミモーダルしか使わないので
/// 簡単のためにこれを作った
/// 公式:https://github.com/SCENEE/FloatingPanel
class SimpleFloatingPanlManager: NSObject, FloatingPanelControllerDelegate  {
    var semiModalViewController: UIViewController?
    var layout: SimpleFloatingPanelLayout!
    var fpc: FloatingPanelController = FloatingPanelController()
    
    func setup(semiModalViewController: UIViewController, height: CGFloat?) {
        self.semiModalViewController = semiModalViewController
        self.layout = SimpleFloatingPanelLayout()
        self.layout.height = height ?? UIScreen.main.bounds.height * 0.7
        self.fpc.delegate = self
        self.fpc.isRemovalInteractionEnabled = true // Optional: Let it removable by a swipe-down
        self.fpc.set(contentViewController: semiModalViewController)
    }
    
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return layout
    }
    
    func floatingPanelDidMove(_ vc: FloatingPanelController) {
        print(#function, vc.position)
    }
    
    func floatingPanelDidChangePosition(_ vc: FloatingPanelController) {
        print(#function, vc.position)
        if vc.position == .hidden {
            /// ちょっとまってから閉じる
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.semiModalViewController?.dismiss(animated: true, completion: {
                    print("dismissed")
                })
            }
        }
    }
    
}

class SimpleFloatingPanelLayout: FloatingPanelLayout {
    // セミモーダルの高さ
    var height: CGFloat = UIScreen.main.bounds.height * 0.7
    
    public var initialPosition: FloatingPanelPosition {
        return .half
    }
    
    public var supportedPositions: Set<FloatingPanelPosition> {
        return [.half, .hidden]
    }
    
    public func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
        case .half:
            return height
        case .hidden:
            return -20
        default:
            return nil
        }
    }
}
