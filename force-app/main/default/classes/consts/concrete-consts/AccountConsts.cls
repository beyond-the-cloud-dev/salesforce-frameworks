public with sharing class AccountConsts implements ConcreteConsts {
    public final String API_NAME = Account.sObjectType.getDescribe().getName();

    public final Type TYPE = new Type();
    public final Rating RATING = new Rating();

    private class Type {
        public final String PROSPECT = 'Prospect';
        public final String CUSTOMER_DIRECT = 'Customer - Direct';
        public final String CUSTOMER_CHANNEL = 'Customer - Channel';
        public final String CHANNEL_PARTNER_RESELLER = 'Channel Partner / Reseller';
        public final String INSTALLATION_PARTNER = 'Installation Partner';
        public final String TECHNOLOGY_PARTNER = 'Technology Partner';
        public final String OTHER = 'Other';
    }

    private class Rating {
        public final String HOT = 'Hot';
        public final String WARM = 'Warm';
        public final String COLD = 'Cold';
    }

    private static AccountConsts instance;

    private AccountConsts() {}

    public static AccountConsts getInstance() {
        if (instance == null) {
            instance = new AccountConsts();
        }
        return instance;
    }
}
