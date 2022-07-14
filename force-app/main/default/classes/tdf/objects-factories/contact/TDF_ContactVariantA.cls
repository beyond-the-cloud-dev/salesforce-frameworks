public with sharing class TDF_ContactVariantA extends TDF_SubFactory {
    public override sObject getRecord(Integer index) {
        return new Contact(
            FirstName = 'First Name A' + index,
            LastName = 'Last Name B' + index
        );
    }
}
