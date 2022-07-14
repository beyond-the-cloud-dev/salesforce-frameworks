public with sharing class TDF_AccountVariantC extends TDF_SubFactory {
    public override sObject getRecord(Integer index) {
        return new Account(
            Name = 'Variant C' + index
        );
    }
}
