public abstract class UnitOfWork {
    protected Map<String, UOW_sObjectContainer> recordsByType = new Map<String, UOW_sObjectContainer>();
    private Boolean executeWithoutSharing = false;

    public abstract void execute();

    public void process() {
        if (this.executeWithoutSharing) {
            new DMLWithoutSharing().executeUnitOfWork(this);
            return;
        }

        new DMLWithSharing().executeUnitOfWork(this);
    }

    public void withoutSharingRules() {
        this.executeWithoutSharing = true;
    }

    public virtual void register(UOW_sObject wrapper) {
        String sObjectType = wrapper.getRecord().getSObjectType().getDescribe().getName();

        UOW_sObjectContainer recordsToProcess = this.recordsByType.get(sObjectType) == null ? new UOW_sObjectContainer() : this.recordsByType.get(sObjectType);

        recordsToProcess.add(wrapper);

        this.recordsByType.put(sObjectType, recordsToProcess);
    }

    private with sharing class DMLWithSharing {
        public void executeUnitOfWork(UnitOfWork unitOfWork) {
            unitOfWork.execute();
        }
    }

    private without sharing class DMLWithoutSharing {
        public void executeUnitOfWork(UnitOfWork unitOfWork) {
            unitOfWork.execute();
        }
    }
}
