public with sharing class UOW_sObjectWithRelationship extends UOW_sObject {
    public Schema.SObjectField relationshipField;
    public sObject relatedTo;

    public UOW_sObjectWithRelationship(sObject record, Schema.SObjectField relationshipField, sObject relatedTo) {
        this.record = record;
        this.relationshipField = relationshipField;
        this.relatedTo = relatedTo;
    }

    public override void resolve() {
        if (this.relationshipField == null || this.relatedTo == null) {
            return;
        }
        this.record.put(this.relationshipField, this.relatedTo.Id);
    }

    public override sObject getRecord() {
        return this.record;
    }
}
