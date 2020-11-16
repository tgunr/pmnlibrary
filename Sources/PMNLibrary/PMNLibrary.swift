
import SwiftUI

struct PMNLibrary {
    var text = "polymicro.net library"
}

class ActivityViewController : UIViewController {
    
    var uiImage:UIImage!
    var ideaTitle: String!
    var ideaDescription: String!
    
    @objc func shareImage() {
        let vc = UIActivityViewController(activityItems: [uiImage!], applicationActivities: [])
        vc.excludedActivityTypes =  [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo
        ]
        present(vc,
                animated: true,
                completion: nil)
        vc.popoverPresentationController?.sourceView = self.view
    }
    
}

struct SwiftUIActivityViewController : UIViewControllerRepresentable {
    
    let activityViewController = ActivityViewController()
    
    func makeUIViewController(context: Context) -> ActivityViewController {
        activityViewController
    }
    func updateUIViewController(_ uiViewController: ActivityViewController, context: Context) {
        //
    }
    func shareImage(uiImage: UIImage) {
        activityViewController.uiImage = uiImage
        activityViewController.shareImage()
    }
}


