public abstract class TDF_SubFactory {

    public TDF_Configurator configurator = new TDF_Configurator();

    public abstract sObject getRecord(Integer index);

    public TDF_SubFactory passConfigurator(TDF_Configurator configurator) {
        this.configurator = configurator;
        return this;
    }

    public sObject createAndInsertRecord() {
        return new TDF_Maker(this).createAndInsertRecord();
    }

    public sObject createRecord() {
        return new TDF_Maker(this).createRecord();
    }

    public List<sObject> createAndInsertRecords() {
        return new TDF_Maker(this).createAndInsertRecords();
    }

    public List<sObject> createRecords() {
        return new TDF_Maker(this).createRecords();
    }
}
