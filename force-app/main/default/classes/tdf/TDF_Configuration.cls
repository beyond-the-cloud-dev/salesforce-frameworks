public class TDF_Configuration {
    public List<Map<sObjectField, Object>> fieldsValues;
    public Integer recordAmount;
    public Boolean repeatValuesOverriding;

    public TDF_Configuration() {
        this.fieldsValues = new List<Map<sObjectField, Object>>();
        this.recordAmount = 1;
        this.repeatValuesOverriding = false;
    }
}
