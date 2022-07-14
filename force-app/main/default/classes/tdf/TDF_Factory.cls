public abstract class TDF_Factory {
  protected abstract Map<String, System.Type> getVariantToSubFactory();

  public TDF_SubFactory get(String variant) {
    return (TDF_SubFactory) this.getVariantToSubFactory().get(variant).newInstance();
  }
}

TDF_TestDataCreator.get(Account.sObjectType).get('VARIANT_A').passConfigurator(
  new TDF_Configurator()
    .setRecordsAmount(5)
    .addFieldsValues(new Map<sObjectField, Object>{

    })
    .addFieldsValues(new Map<sObjectField, Object>{

    })
    .addFieldsValues(new Map<sObjectField, Object>{

    })
    .withRepeatValuesOverriding()
).createAndInsertRecord();
