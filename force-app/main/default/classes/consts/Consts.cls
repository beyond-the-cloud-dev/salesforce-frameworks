public with sharing class Consts {

    public static final AccountConsts ACCOUNT {
        get {
            return AccountConsts.getInstance();
        }
        private set;
    }

    public static final ContactConsts CONTACT {
        get {
            return ContactConsts.getInstance();
        }
        private set;
    }

    public static final OpportunityConsts OPPORTUNITY {
        get {
            return OpportunityConsts.getInstance();
        }
        private set;
    }
}
