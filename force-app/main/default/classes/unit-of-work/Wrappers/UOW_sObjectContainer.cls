public with sharing class UOW_sObjectContainer {
    private List<UOW_sObject> sObjectsWithRelationships;

    public UOW_sObjectContainer() {
        this.sObjectsWithRelationships = new List<UOW_sObject>();
    }

    public void add(UOW_sObject sObjectWithRelationship) {
        this.sObjectsWithRelationships.add(sObjectWithRelationship);
    }

    public void resolve() {
        for (UOW_sObject sObjectWithRelationship : this.sObjectsWithRelationships) {
            sObjectWithRelationship.resolve();
        }
    }

    public List<sObject> getRecords() {
        List<sObject> recordsToProcess = new List<sObject>();

        for (UOW_sObject sObjectWithRelationship : this.sObjectsWithRelationships) {
            recordsToProcess.add(sObjectWithRelationship.getRecord());
        }

        return recordsToProcess;
    }
}
