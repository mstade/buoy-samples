package se.stade.buoy.examples.async_service_sample.domain
{
    import flash.events.EventDispatcher;

    public interface AsyncService
    {
        function doSomething():EventDispatcher;
    }
}