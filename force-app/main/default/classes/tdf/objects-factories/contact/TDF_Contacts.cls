public class TDF_Contacts extends TDF_Factory {
  protected override Map<String, System.Type> getVariantToSubFactory() {
    return new Map<String, System.Type>{
      'VARIANT_A' => TDF_ContactVariantA.class,
      'VARIANT_B' => TDF_ContactVariantB.class
    };
  }
}
