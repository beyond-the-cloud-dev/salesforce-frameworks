public class TDF_Configurator {

    private TDF_Configuration configuration;

    public TDF_Configurator() {
        this.configuration = new TDF_Configuration();
    }

    public TDF_Configurator setRecordsAmount(Integer recordAmount) {
        this.configuration.recordAmount = recordAmount;
        return this;
    }

    public TDF_Configurator addFieldsValues(Map<sObjectField, Object> fieldsValues) {
        this.configuration.fieldsValues.add(fieldsValues);
        return this;
    }

    public TDF_Configurator withRepeatValuesOverriding() {
        this.configuration.repeatValuesOverriding = true;
        return this;
    }

    public TDF_Configuration build() {
        return this.configuration;
    }
}
