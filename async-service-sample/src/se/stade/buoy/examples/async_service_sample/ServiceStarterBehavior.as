package se.stade.buoy.examples.async_service_sample
{
	import mx.controls.Alert;
	
	import org.justinjmoses.examples.mediate_behaviours.services.IAsyncService;

	public class ServiceStarterBehavior
	{
        [Click("#submit")]
        public function callService(view:AsyncLoaderView, service:IAsyncService):void
        {
            service.doSomething().addOnce(function():void
            {
                Alert.show("The service returned.", "Guess what?");
            });
        }
	}
}