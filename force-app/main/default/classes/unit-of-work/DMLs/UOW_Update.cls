public inherited sharing class UOW_Update extends UnitOfWork {
    public override void execute() {
        for (String sObjectTypeName : recordsByType.keySet()) {
            recordsByType.get(sObjectTypeName).resolve();

            update recordsByType.get(sObjectTypeName).getRecords();
        }
    }
}
