public class TDF_Maker {

    private TDF_SubFactory subFactory;
    private TDF_Configuration configuration;

    public TDF_Maker(TDF_SubFactory subFactory) {
        this.subFactory = subFactory;

        this.configuration = subFactory.configurator.build();
    }

    public sObject createAndInsertRecord() {
        return this.createAndInsertRecords()[0];
    }

    public sObject createRecord() {
        return this.createRecords()[0];
    }

    public List<sObject> createAndInsertRecords() {
        return createRecords(true);
    }

    public List<sObject> createRecords() {
        return createRecords(false);
    }

    private List<sObject>  createRecords(Boolean insertRecord) {
        List<sObject> records = getRecords();

        this.fillRecordsWithCustomValues(records);

        if (insertRecord) {
            insert records;
        }

        return records;
    }

    private List<sObject> getRecords() {
        List<sObject> records = new List<sObject>();

        for (Integer i = 0; i < this.configuration.recordAmount; i++) {
            records.add(this.subFactory.getRecord(i));
        }

        return records;
    }

    private void fillRecordsWithCustomValues(List<sObject> records) {
        if (this.configuration.fieldsValues.isEmpty()) {
            return;
        }

        Integer fieldsValuesIndex = 0;

        for (Integer i = 0; i < records.size(); i++) {
            for (sObjectField field : this.configuration.fieldsValues[fieldsValuesIndex].keySet()) {
                records[i].put(field, this.configuration.fieldsValues[fieldsValuesIndex].get(field));
            }

            fieldsValuesIndex++;

            if (fieldsValuesIndex >= this.configuration.fieldsValues.size()) {
                if (!this.configuration.repeatValuesOverriding) {
                    return;
                }

                fieldsValuesIndex = 0; // Reset, start filling from begining
            }
        }
    }
}
