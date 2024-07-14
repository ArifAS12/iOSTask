import UIKit

class BaseViewController: UIViewController {

    private let sideMenuWidth: CGFloat = 240
    private let dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0.0 // Initially transparent
        return view
    }()
    private var isMenuOpen = false
    private var menuViewController: SideMenuVC!

    override func viewDidLoad() {
        super.viewDidLoad()

       
        dimmingView.frame = view.bounds
        view.insertSubview(dimmingView, at: 0)

        // Gesture recognizer for menu opening/closing
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMenuTap))
        dimmingView.addGestureRecognizer(tapGesture)
    }

    @objc func handleMenuTap() {
        if isMenuOpen {
            hideMenu()
        } else {
            showMenu()
        }
    }

    func setMenuViewController(_ menuViewController: SideMenuVC) {
        self.menuViewController = menuViewController
        addChild(menuViewController)

       
        menuViewController.view.frame = CGRect(x: -sideMenuWidth, y: 0,
                                               width: sideMenuWidth, height: view.frame.height)


        view.insertSubview(menuViewController.view, at: 0)
        menuViewController.didMove(toParent: self)
    }

    private func showMenu() {
        isMenuOpen = true
        UIView.animate(withDuration: 0.3) {
            self.menuViewController.view.frame.origin.x = 0
            self.dimmingView.alpha = 0.7
        }
    }

    private func hideMenu() {
        isMenuOpen = false
        UIView.animate(withDuration: 0.3) {
            self.menuViewController.view.frame.origin.x = -self.sideMenuWidth
            self.dimmingView.alpha = 0.0
        }
    }
}
