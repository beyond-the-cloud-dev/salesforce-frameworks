public with sharing class TDF_AccountVariantB extends TDF_SubFactory {
    public override sObject getRecord(Integer index) {
        return new Account(
            Name = 'Variant B' + index
        );
    }
}
