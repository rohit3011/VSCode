public class ParkLocator {
    public static list<string> country(string countryName) {
        ParkService.ParksImplPort park = new ParkService.ParksImplPort ();
        return park.byCountry(countryName);
    }
}