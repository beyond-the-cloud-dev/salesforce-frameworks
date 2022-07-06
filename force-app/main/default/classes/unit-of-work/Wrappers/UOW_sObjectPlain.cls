public with sharing class UOW_sObjectPlain extends UOW_sObject {
    public UOW_sObjectPlain(sObject record) {
        this.record = record;
    }

    public override sObject getRecord() {
        return this.record;
    }
}
