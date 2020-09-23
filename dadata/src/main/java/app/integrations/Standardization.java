package app.integrations;
import ru.redcom.lib.integration.api.client.dadata.DaDataClient;
import ru.redcom.lib.integration.api.client.dadata.DaDataClientFactory;
import ru.redcom.lib.integration.api.client.dadata.DaDataException;
import ru.redcom.lib.integration.api.client.dadata.dto.Address;

public class Standardization {
    private DaDataClient dadata;

    public Standardization(String API_KEY, String SECRET_KEY){
        dadata = DaDataClientFactory.getInstance(API_KEY, SECRET_KEY);
    }

    public Address cleanAddress(String source) throws DaDataException {
        return dadata.cleanAddress(source);
    }

}
