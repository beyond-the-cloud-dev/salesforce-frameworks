public with sharing class UOW_sObjectWithExternalId extends UOW_sObject {
    public Schema.SObjectField relatedToField;
    public Schema.SObjectType relatedTo;
    public String relationshipName;
    public Schema.SObjectField externalIdField;
    public Object externalId;

    public UOW_sObjectWithExternalId(sObject record, Schema.SObjectField relatedToField, Schema.SObjectField externalIdField, Object externalId) {
        validateRelatedToField(relatedToField);
        validateExternalIdField(relatedToField, externalIdField);

        this.record = record;
        this.relatedToField = relatedToField;
        this.relatedTo = relatedToField.getDescribe().getReferenceTo()[0];
        this.relationshipName = relatedToField.getDescribe().getRelationshipName();
        this.externalIdField = externalIdField;
        this.externalId = externalId;
    }

    public override void resolve() {
        sObject relationshipObject = this.relatedTo.newSObject();
        relationshipObject.put(externalIdField.getDescribe().getName(), this.externalId);
        this.record.putSObject(this.relationshipName,relationshipObject);
    }

    public override sObject getRecord() {
        return this.record;
    }

    private void validateRelatedToField(Schema.SObjectField relatedToField) {
        if (relatedToField == null) {
            throw new UnitOfWorkException('Invalid argument: relatedToField.');
        }

        String relationshipName = relatedToField.getDescribe().getRelationshipName();

        if (String.isBlank(relationshipName)) {
            throw new UnitOfWorkException('Invalid argument: relatedToField. Field supplied is not a relationship field.');
        }
    }

    private void validateExternalIdField(Schema.SObjectField relatedToField, Schema.SObjectField externalIdField) {
        Boolean externalIdFieldIsValid = externalIdField.getDescribe().isExternalId();

        if (!externalIdFieldIsValid) {
            throw new UnitOfWorkException('Invalid argument: externalIdField. Field supplied is not a marked as an External Identifier.');
        }

        List<Schema.SObjectType> relatedObjects = relatedToField.getDescribe().getReferenceTo();
        Schema.SObjectType relatedObject = relatedObjects[0];
        String externalIdFieldName = externalIdField.getDescribe().getName();

        Boolean relatedHasExternalIdField = relatedObject.getDescribe().fields.getMap().keySet().contains(externalIdFieldName.toLowerCase());

        if (!relatedHasExternalIdField) {
            throw new UnitOfWorkException('Invalid argument: externalIdField. Field supplied is not a known field on the target sObject.');
        }
    }
}
