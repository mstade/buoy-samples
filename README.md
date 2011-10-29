# Buoy

Buoy is an easy to use application framework for Adobe Flash/Flex. Its main purpose is to aid the developer in reducing boilerplate while at the same time encouraging a healthy separation between domain logic and the user interface.

More information about buoy:
https://github.com/mstade/buoy

# Samples

These samples are meant to showcase the power of buoy and should be reasonably annotated. All samples include Flash Builder project files to lower the threshold to just grab them and play around.

In the spirit of github, feel free to fork this repository and play around with the code. I'm always more than happy to receive pull requests for new samples or fixes to old ones.

## List of samples

### [Async service sample](https://github.com/mstade/buoy-samples/tree/master/async-service-sample)

Simple sample that simulates an asyncronous service call, updating the view in response to changes. This sample also includes the domain logic from a [RobotLegs sample by Justin Moses](https://github.com/justinjmoses/mediate-behaviours-example), to show how domain logic can be re-used, even though the frameworks may change.

### [Async service, alternative sample](https://github.com/mstade/buoy-samples/tree/master/async-service-alternative-sample)

A different take on the previous sample. While this sample is not meant to showcase multiple behavior support, it's meant to highlight buoy's ability to handle events efficiently. No matter if they are dispatched from an element on the DOM or from a property chain inside of a behaior. This sample is using slightly modified logic from Justin's example. It is also not dependant on signals, but rather uses vanilla flash events.
