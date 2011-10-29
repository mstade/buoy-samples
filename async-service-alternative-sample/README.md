# Async service alternative sample

*This sample is inspired by Justin Moses' [excellent example of behavior mediation](https://github.com/justinjmoses/mediate-behaviours-example) using RobotLegs.*

This is a different take on the [Async service sample](https://github.com/mstade/buoy-samples/tree/master/async-service-sample). The purpose of the sample is the same, with two important differences. First, this sample only has one behavior to deal with the service, although it certainly could be split up amongst multiple. Because of this, the main point of Justin's sample is actually removed: the ability to mediate multiple behaviors at once. Since the other sample already exhibits this feature, this sample is instead focusing on removing the dependency on signals, using plain vanilla flash events instead. The purpose of this is to show how buoy can be used not only to hook event handlers to the DOM, but also how it can handle events in the behavior itself.

This is accomplished using the `[HandleEvent]` metadata, which (out of the box) supports two different query syntaxes. One is css, which is used to query the DOM for targets. The other is the "internal" syntax, which is really just a property chain, prefixed with `this.`

In this example, the `[HandleEvent]` tag is used to set up an event binding to the local variable `token`:

```actionscript
[Bindable]
public var token:IEventDispatcher;

[HandleEvent(target="this.token", type="complete")]
public function handleComplete(view:ApplicationView):void
{
    Alert.show("The service returned.", "Guess what?");
    view.currentState = "normal";
}
```

The `token` variable must be bindable for this to work.

## Short hand event handlers, for common events

```actionscript
[Click("#submit")]
public function callService(view:ApplicationView, service:AsyncService):void
{
    view.currentState = "processing";
    token = service.doSomething();
}
```

This is a short hand tag that, behind the scenes, is using the exact same functionality as `[HandleEvent]`. In fact, using a tag declaration looking like this will yield the exact same result:

```actionscript
[HandleEvent(target="#submit", type="click")]
```

There are a few short hand tags available to deal with common events. For instance, `[KeyUp]` and `[KeyDown]` are short hands for keyboard events.

## A discussion on handlers and dependencies

Note also how these handlers can specify any number of parameters. If these parameters have matching dependency providers any where in the dependency chain, then they will be resolved. Otherwise an error is thrown. There are a few special dependencies that can be used for these handlers:

* `ApplicationView` - the target of the context. Being the target of the context, this view is automatically added in the list of dependencies. It is injected by type.
* `FlashQuery` - wraps the view target of the context. A FlashQuery instance is automatically created when the context initializes, wrapping the view. It is injected by type.
* `Event` - the event object of the event. In any event handler, the event object itself is passed as a dependency. It is injected by type.

The order of the parameters does not matter, buoy will figure it out. Optional parameters are of course also supported and will not throw an error if the dependency can not be resolved.
