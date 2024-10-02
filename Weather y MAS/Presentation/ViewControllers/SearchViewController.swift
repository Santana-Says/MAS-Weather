import GooglePlaces
import UIKit

class SearchViewController: UIViewController {
    private var contentViewDelegate: ContentViewDelegate?
    
    override func viewDidLoad() {
        presentAutoCompleteViewController()
    }
    
    func presentAutoCompleteViewController() {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt64(GMSPlaceField.name.rawValue) |
                                                  UInt64(GMSPlaceField.placeID.rawValue))
        autocompleteController.placeFields = fields
        
        let filter = GMSAutocompleteFilter()
        filter.countries = ["US"]
        autocompleteController.autocompleteFilter = filter
        
        addChild(autocompleteController)
        autocompleteController.view.frame = self.view.bounds  // Set the frame to match your container
        self.view.addSubview(autocompleteController.view)
        autocompleteController.didMove(toParent: self)
    }
    
    func setDelegate(_ delegate: ContentViewDelegate) {
        contentViewDelegate = delegate
    }
}

extension SearchViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name ?? "")")
        print("Place coordinates: \(place.coordinate)")
        
        contentViewDelegate?.handleCoordinate(place.coordinate)
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
