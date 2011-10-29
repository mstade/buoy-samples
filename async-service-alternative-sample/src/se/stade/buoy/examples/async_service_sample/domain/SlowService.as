package se.stade.buoy.examples.async_service_sample.domain
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.TimerEvent;
    import flash.utils.Timer;

    public class SlowService implements AsyncService
    {
        public function doSomething():EventDispatcher
        {
            const timer:Timer = new Timer(2000, 1);
            
            var token:EventDispatcher = new EventDispatcher;
            
            timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(evt:TimerEvent):void
            {
                token.dispatchEvent(new Event(Event.COMPLETE));
                
                //remove listener to prevent memory leaks
                timer.removeEventListener(TimerEvent.TIMER_COMPLETE, arguments.callee);
            });
            
            //start timer which will trigger the signal when complete.
            timer.start();
            
            return token;
        }
    }
}
