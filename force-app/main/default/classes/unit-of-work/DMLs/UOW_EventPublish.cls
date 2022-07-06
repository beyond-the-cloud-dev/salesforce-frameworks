public inherited sharing class UOW_EventPublish extends UnitOfWork {
    public override void execute() {
        List<sObject> events = new List<sObject>();

        for (String sObjectTypeName : recordsByType.keySet()) {
            events.addAll(recordsByType.get(sObjectTypeName).getRecords());
        }

        EventBus.publish(events);
    }
}
