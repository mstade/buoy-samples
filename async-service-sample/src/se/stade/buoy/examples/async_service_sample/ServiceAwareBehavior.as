package se.stade.buoy.examples.async_service_sample
{
    import org.justinjmoses.examples.mediate_behaviours.models.ServiceProcessingModel;
    
    public class ServiceAwareBehavior
    {
        private var model:ServiceProcessingModel;
        
        private var startedHandler:Function;
        private var completedHandler:Function;
        
        [Init]
        public function register(model:ServiceProcessingModel, view:ApplicationView):void
        {
            this.model = model;
            
            model.started.add(startedHandler = function():void {
                view.currentState = "processing";
            });
            
            model.completed.add(completedHandler = function():void {
                view.currentState = "normal";
            });
        }
        
        [Dispose]
        public function unregister():void
        {
            model.started.remove(startedHandler);
            model.completed.remove(completedHandler);
        }
    }
}

