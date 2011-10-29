# Async service sample

*This sample is inspired by Justin Moses' [excellent example of behavior mediation](https://github.com/justinjmoses/mediate-behaviours-example) using RobotLegs.*

This sample shows how buoy could be used to implement a typical scenario using an asyncronous service. There's a button, when you click on it a request fires off and the UI updates accordingly. When the request comes back the UI again updates accordingly. The request itself is handled by one behavior, whereas the result of the request is handled by another.

