public inherited sharing class UOW_Insert extends UnitOfWork {
    public override void execute() {
        for (String sObjectTypeName : recordsByType.keySet()) {

            recordsByType.get(sObjectTypeName).resolve();

            insert recordsByType.get(sObjectTypeName).getRecords();
        }
    }
}
