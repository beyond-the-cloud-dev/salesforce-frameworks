public with sharing class TDF_AccountVariantA extends TDF_SubFactory {
    public override sObject getRecord(Integer index) {
        return new Account(
            Name = 'Variant A' + index
        );
    }
}
