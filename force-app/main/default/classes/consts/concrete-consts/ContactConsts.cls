public with sharing class ContactConsts implements ConcreteConsts {
    public final String API_NAME = Contact.sObjectType.getDescribe().getName();

    public final LeadSource LEAD_SOURCE = new LeadSource();

    private class LeadSource {
        public final String WEB = 'Web';
        public final String PHONE_INQUIRY = 'Phone Inquiry';
        public final String PARTNER_REFERRAL = 'Partner Referral';
        public final String PURCHASED_LIST = 'Purchased List';
        public final String OTHER = 'Other';
    }

    private static ContactConsts instance;

    private ContactConsts() {}

    public static ContactConsts getInstance() {
        if (instance == null) {
            instance = new ContactConsts();
        }
        return instance;
    }
}
