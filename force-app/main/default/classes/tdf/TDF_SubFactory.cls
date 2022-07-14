public abstract class TDF_SubFactory {

    private TDF_Maker maker;

    public abstract sObject getRecord(Integer index);

    public TDF_SubFactory() {
        this.maker = new TDF_Maker(this);
    }

    public TDF_SubFactory passConfigurator(TDF_Configurator configurator) {
        this.maker.setConfigurator(configurator);
        return this;
    }

    public sObject createAndInsertRecord() {
        return this.maker.createAndInsertRecord();
    }

    public sObject createRecord() {
        return this.maker.createRecord();
    }

    public List<sObject> createAndInsertRecords() {
        return this.maker.createAndInsertRecords();
    }

    public List<sObject> createRecords() {
        return this.maker.createRecords();
    }
}
