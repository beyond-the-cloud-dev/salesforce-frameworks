public class TDF_Accounts extends TDF_Factory {
  protected override Map<String, System.Type> getVariantToSubFactory() {
    return new Map<String, System.Type>{
      'VARIANT_A' => TDF_AccountVariantA.class,
      'VARIANT_B' => TDF_AccountVariantB.class
    };
  }
}
