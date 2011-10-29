package se.stade.buoy.examples.async_service_sample
{
    import flash.events.IEventDispatcher;
    
    import mx.controls.Alert;
    
    import se.stade.buoy.examples.async_service_sample.domain.AsyncService;

    public class ServiceBehavior
    {
        [Bindable]
        public var token:IEventDispatcher;
        
        [HandleEvent(target="this.token", type="complete")]
        public function handleComplete(view:ApplicationView):void
        {
            Alert.show("The service returned.", "Guess what?");
            view.currentState = "normal";
        }
        
        [Click("#submit")]
        public function callService(view:ApplicationView, service:AsyncService):void
        {
            view.currentState = "processing";
            token = service.doSomething();
        }
    }
}