
## Welcome to A No Storyboard iOS app

This app shows how to create an iOS app that consumes json data from an external url and displays that in a UITableView. The app doesn't use a storyboard and instead constructs it's entire UI in Swift code. This was part of a iOS developer role job interview for Infosys.

### Solution details

- it uses NSURLSession to query the external url
- uses JSONDecoder to parse data into native Swift objects
- lazy loads image for a feed item
- dynamically adjusts the height of each row displaying the feed based on feed item length
- bypasses ATS
- uses auto-layout anchors to position elements
- reads a local json file for the feed when no internet access

### A more beginner friendly example to create iOS UI in code
This project is a little overwhelming for new comers and I fully understand that, hence I have written a more beginner friendly tutorial for creating iOS UI in code [here check it out](https://mydaytodo.com/ios-app-no-storyboard-how-to/).


# More great tutorials and code samples
Checkout [this blog] for more "how-to" code samples, tutorials and just info on how to solve problems.

If you like what I am doing, you can [buy me a coffee]

Click on the next link for more info on the 13+ year [software engineering career journey] of the author.

[buy me a coffee]: https://www.buymeacoffee.com/bhumansoni
[this blog]: https://mydaytodo.com/blog/


#### No Storyboard iOS app to consume API & show data
#### The "tech test" had the following instructions

The purpose of this exercise is to assess candidate developer’s iOS coding knowledge and style. The exercise involves build a “proof of concept” app which consumes a REST service and displays photos with headings and descriptions. The exercise will be evaluated on coding style, understanding of programming concepts, choice of techniques, and also by the developer’s process, as indicated by the trail of git commits.

1.  Ingests a json feed https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json
2.  You can use a third party Json parser to parse this if desired.
3.  Displays the content (including image, title and description) in a table
4.  The title in the navbar should be updated from the json
5.  Each row should be the right height to display its own content and no taller. No content should be clipped. This means some rows will be larger than others.
6.  Don’t download all images at once, only as needed
7.  Refresh function, either a refresh button or use pull down to refresh.
8.  Should not block UI when loading the data from the json feed.
9.  Support all iOS versions from the latest back at least 2 versions


