public virtual class SObjectUnitOfWork {
    private UnitOfWork insertUnitOfWork;
    private UnitOfWork updateUnitOfWork;
    private UnitOfWork deleteUnitOfWork;
    private UnitOfWork platformEventUnitOfWork;

    public SObjectUnitOfWork() {
        this.insertUnitOfWork = new UOW_Insert();
        this.updateUnitOfWork = new UOW_Update();
        this.deleteUnitOfWork = new UOW_Delete();
        this.platformEventUnitOfWork = new UOW_EventPublish();
    }

    public SObjectUnitOfWork withoutSharingRules() {
        this.insertUnitOfWork.withoutSharingRules();
        this.updateUnitOfWork.withoutSharingRules();
        this.deleteUnitOfWork.withoutSharingRules();

        return this;
    }

    public SObjectUnitOfWork registerNew(sObject record) {
        if (String.isNotBlank(record.Id)) {
            throw new UnitOfWorkException('Only new records can be registered as new');
        }

        this.insertUnitOfWork.register(new UOW_sObjectPlain(record));

        return this;
    }

    public SObjectUnitOfWork registerNew(List<sObject> records) {
        for (sObject record : records) {
            this.registerNew(record);
        }

        return this;
    }

    public SObjectUnitOfWork registerDirty(sObject record) {
        if (String.isBlank(record.Id)) {
            throw new UnitOfWorkException('New records cannot be registered as dirty');
        }

        this.updateUnitOfWork.register(new UOW_sObjectPlain(record));

        return this;
    }

    public SObjectUnitOfWork registerDirty(List<sObject> records) {
        for (sObject record : records) {
            this.registerDirty(record);
        }

        return this;
    }

    public SObjectUnitOfWork registerUpsert(sObject record) {
        if (String.isBlank(record.Id)) {
            return this.registerNew(record);
        }

        return this.registerDirty(record);
    }

    public SObjectUnitOfWork registerUpsert(List<sObject> records) {
        for (sObject record : records) {
            this.registerUpsert(record);
        }

        return this;
    }

    public SObjectUnitOfWork registerDeleted(sObject record) {
        this.deleteUnitOfWork.register(new UOW_sObjectPlain(record));
        return this;
    }

    public SObjectUnitOfWork registerDeleted(List<sObject> records) {
        for (sObject record : records) {
            this.registerDeleted(record);
        }
        return this;
    }

    public SObjectUnitOfWork registerRelationship(sObject record, Schema.SObjectField relatedToField, Schema.SObjectField externalIdField, Object externalId) {
        this.insertUnitOfWork.register(new UOW_sObjectWithExternalId(record, relatedToField, externalIdField, externalId));
        return this;
    }

    public SObjectUnitOfWork registerRelationship(sObject record, Schema.SObjectField relatedToField, sObject relatedTo) {
        this.insertUnitOfWork.register(new UOW_sObjectWithRelationship(record, relatedToField, relatedTo));
        return this;
    }

    public SObjectUnitOfWork registerPlatformEvent(sObject record) {
        this.platformEventUnitOfWork.register(new UOW_sObjectPlain(record));
        return this;
    }

    public SObjectUnitOfWork registerPlatformEvent(List<sObject> records) {
        for (sObject record : records) {
            this.registerPlatformEvent(record);
        }

        return this;
    }

    public void commitWork() {
        Savepoint savePoint = Database.setSavepoint();

        try {
            this.doCommitWork();
        } catch (Exception e) {
            Database.rollback(savePoint);
            throw e;
        }
    }

    private void doCommitWork() {
        this.onDmlStart();

        this.insertUnitOfWork.process();
        this.updateUnitOfWork.process();
        this.deleteUnitOfWork.process();
        this.platformEventUnitOfWork.process();

        this.onDmlFinish();
    }

    private virtual void onDmlStart() {
        System.debug('----- DML Start -----');
    }

    private virtual void onDmlFinish() {
        System.debug('----- DML Finish -----');
    }
}
