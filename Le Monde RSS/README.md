# Solution design
The point of the application was to display the news feed and access the news details when it's clicked.

- Controllers are responsible for displaying the data into the 2 identified views.
- API group contains the manager making the call and a very minimalist error case.
- View group contains the only UI custom element : cell for the news feed.
- Model contains the domain layer and a Constants class used in all the app.
- Utils contains centralized methods not specific to logic layers.

## Before seeing data source
At first, I wanted to "play" and put the maximum of the latest subjects I've seen:
- [SwiftRX](https://github.com/ReactiveX/RxSwift): to update the view based on MVVM pattern as I do on Android.
- [Realm](https://github.com/realm/realm-cocoa): for data persistence, potential local pagination if many news and lazy loading.
- [CardsDesign](https://github.com/PaoloCuscela/Cards): cool UI and animations to enhance the app and the 2 identified views transition.

## After seeing data source
Data source was more "poor" that I was expecting it.. All the solutions above would have been totally useless in the final purpose of the app: **displaying the news**. As an engineer I consider that the simplier, the better a solution is; by simplier I mean "**clean and direct approch**" not "*put everything anywhere as long as it's working*".

So I ended up with a less fancy but more direct implementation:
- [Alamofire](https://github.com/Alamofire/Alamofire): for API calls and HTTP cache.
- [AlamofireImage](https://github.com/Alamofire/AlamofireImage): for image downloading and caching.
- [XMLMapper](https://github.com/gcharita/XMLMapper): I'm actually a JSON person myself so I was not very used to XML lib. Finally I've found one working as JSON mapping I'm used to do.
- [XCTTesting](https://developer.apple.com/documentation/xctest): nothing fancy for that; I **stayed on TDD** while doing the app, as you'll see the tests cover the 3 problems I've faced: getting data source; ensure it's encoding is UTF8; getting the news' image URL.
- [Swift Lint](https://github.com/realm/SwiftLint): because I like my code like my bike -> **clean**.