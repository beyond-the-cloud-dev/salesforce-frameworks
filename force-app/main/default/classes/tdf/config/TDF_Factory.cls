public abstract class TDF_Factory {
  protected abstract Map<String, System.Type> getVariantToSubFactory();

  public TDF_SubFactory get(String variant) {
    return (TDF_SubFactory) this.getVariantToSubFactory().get(variant).newInstance();
  }
}
