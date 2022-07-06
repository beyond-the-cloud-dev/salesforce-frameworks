public abstract class UOW_sObject {
    public SObject record;

    public virtual void resolve() {}
    public abstract sObject getRecord();
}
