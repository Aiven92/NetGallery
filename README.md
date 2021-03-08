#  NetGallery iOS app

## Simple two tabs demo project:
- iOS11, Swift4.2, MVVM, PureLayout
- Put api key from https://www.flickr.com/services/api/explore/flickr.photos.search to Service/Flickr.swift
- 
### Firs tab:
- Two collumn collection view. Each cell represented with image, fetched from Flickr.com with REST API.
- At launch search starts with predefined search request. User can type own one.
- Tap on cell performs push with detail view: fullsize(width) image and title.
- User can save image to iOS gallery with navigation bar button, with allert view in case of error.
- Navigation bar allows to go back in collection view.
- All images fetched and cached by SDWebImage library.

### Second tab:
- Scroll view with my name, photo and bio.
