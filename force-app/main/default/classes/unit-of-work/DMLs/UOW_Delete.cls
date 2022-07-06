public inherited sharing class UOW_Delete extends UnitOfWork {
    public override void execute() {
        for (String sObjectTypeName : recordsByType.keySet()) {
            delete recordsByType.get(sObjectTypeName).getRecords();
        }
    }
}
