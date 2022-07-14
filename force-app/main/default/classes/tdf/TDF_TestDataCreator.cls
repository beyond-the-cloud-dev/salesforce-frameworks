public with sharing class TDF_TestDataCreator {
  private final static Map<sObjectType, System.Type> OBJECT_TO_FACTORY = new Map<sObjectType, System.Type>{
    Account.sObjectType => TDF_Accounts.class,
    Contact.sObjectType => TDF_Contacts.class
  };

  public static TDF_Factory get(sObjectType objectType) {
    return (TDF_Factory) OBJECT_TO_FACTORY.get(objectType).newInstance();
  }
}
