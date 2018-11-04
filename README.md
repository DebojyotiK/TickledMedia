# TickledMedia Assignment!


## Project Usage

Run `carthage update --platform iOS` to install the dependencies

## Frameworks

 - **Alamofire** Used For Making Network calls
 - **Alamofire Object Mapper** Used for mapping web Entities.I could also have used JSONDecoder
 - **SDWebImage** Used for  loading images from Server.
  I could have implemented this on my own.However the challenges couldnot be solved in a short period of time
  They are:
  1.Downloading the Image and storing them on the disk manually
  2.Maintain some Database where physical path of the image would be kept in relation to the imageURL
  3.I would also have to respect the Cache-Control headers.Store the max age time,
  4.Store the ETag so that if the image changes on the server side even if for the same URL I get the updated image
  5.Make a custom network call.Manage its delegates on my own.Post notifications about image Progress.

## Remaining

Unit Test cases
UI Automation Testing
