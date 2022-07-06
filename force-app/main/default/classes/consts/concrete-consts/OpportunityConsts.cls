public with sharing class OpportunityConsts implements ConcreteConsts {
    public final String API_NAME = Opportunity.sObjectType.getDescribe().getName();

    public final Type TYPE = new Type();

    private class Type {
        public final String EXISTING_CUSTOMER_UPGRADE = 'Existing Customer - Upgrade';
        public final String EXISTING_CUSTOMER_REPLACEMENT = 'Existing Customer - Replacement';
        public final String EXISTING_CUSTOMER_DOWNGRADE = 'Existing Customer - Downgrade';
        public final String CHANNEL_PARTNER_RESELLER = 'Channel Partner / Reseller';
        public final String NEW_CUSTOMER = 'New Customer';
    }

    private static OpportunityConsts instance;

    private OpportunityConsts() {}

    public static OpportunityConsts getInstance() {
        if (instance == null) {
            instance = new OpportunityConsts();
        }
        return instance;
    }
}
