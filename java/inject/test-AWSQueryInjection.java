// License: MIT (c) GitLab Inc.
// scaffold: dependencies=com.amazonaws.aws-java-sdk-simpledb@1.12.187

package inject;

import com.amazonaws.services.simpledb.AmazonSimpleDB;
import com.amazonaws.services.simpledb.AmazonSimpleDBClient;
import com.amazonaws.services.simpledb.model.SelectRequest;
import com.amazonaws.services.simpledb.model.SelectResult;

public class AWSQueryInjection {

    public void danger(String customerID,String productCategory) {
        AmazonSimpleDB sdbc = AmazonSimpleDBClient.builder().build();
        String query = "select * from invoices where productCategory = '"
                + productCategory + "' and customerID = '"
                + customerID + "' order by '";
        SelectResult sdbResult = sdbc.select(new SelectRequest(query));
    }

    public void danger2(String customerID,String productCategory) {
        AmazonSimpleDB sdbc = AmazonSimpleDBClient.builder().build();
        String query = "select * from invoices where productCategory = '"
                + productCategory + "' and customerID = '"
                + customerID + "' order by '";
        SelectResult sdbResult = sdbc.select(new SelectRequest(query, false));
    }
}
