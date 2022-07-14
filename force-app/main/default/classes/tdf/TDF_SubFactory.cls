public abstract class TDF_SubFactory {
    private List<Map<sObjectField, Object>> fieldsValues;
    private Integer recordAmount;
    private Boolean repeatValuesOverriding;

    protected abstract sObject getRecord(Integer index);

    public TDF_SubFactory() {
        this.fieldsValues = new List<Map<sObjectField, Object>>();
        this.recordAmount = 1;
        this.repeatValuesOverriding = false;
    }

    public TDF_SubFactory setRecordsAmount(Integer recordAmount) {
        this.recordAmount = recordAmount;
        return this;
    }

    public TDF_SubFactory addFieldsValues(Map<sObjectField, Object> fieldsValues) {
        this.fieldsValues.add(fieldsValues);
        return this;
    }

    public TDF_SubFactory withRepeatValuesOverriding() {
        this.repeatValuesOverriding = true;
        return this;
    }

    public sObject createAndInsertRecord() {
        sObject record = this.createRecord();
        insert record;
        return record;
    }

    public sObject createRecord() {
        return this.createRecords()[0];
    }

    public List<sObject> createAndInsertRecords() {
        List<sObject> records = this.createRecords();
        insert records;
        return records;
    }

    public List<sObject> createRecords() {
        List<sObject> records = getRecords();

        this.fillRecordsWithCustomValues(records);

        return records;
    }

    private List<sObject> getRecords() {
        List<sObject> records = new List<sObject>();

        for (Integer i = 0; i < this.recordAmount; i++) {
            records.add(getRecord(i));
        }

        return records;
    }

    private void fillRecordsWithCustomValues(List<sObject> records) {
        if (this.fieldsValues.isEmpty()) {
            return;
        }

        Integer fieldsValuesIndex = 0;

        for (Integer i = 0; i < records.size(); i++) {
            for (sObjectField field : this.fieldsValues[fieldsValuesIndex].keySet()) {
                records[i].put(field, this.fieldsValues[fieldsValuesIndex].get(field));
            }

            fieldsValuesIndex++;

            if (fieldsValuesIndex >= this.fieldsValues.size()) {
                if (!this.repeatValuesOverriding) {
                    return;
                }

                fieldsValuesIndex = 0; // Reset, start filling from begining
            }
        }
    }
}
