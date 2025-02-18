/* Name: Emanuel Botros
Course: CNT 4714 – Summer 2024 – Project Three
Assignment title: A Three-Tier Distributed Web-Based Application
Date: August 1, 2024
*/
package logins;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class QueryTypeChecker {
  
public QueryTypeChecker()
{

}
    
    public String   getQueryType(String query) {
        String queryType = "UNKNOWN";

        // Remove leading/trailing whitespaces and convert the query to uppercase
        query = query.trim().toUpperCase();

        // Regular expressions to match query keywords
        Pattern insertPattern = Pattern.compile("^INSERT");
        Pattern deletePattern = Pattern.compile("^DELETE");
        Pattern updatePattern = Pattern.compile("^UPDATE");
        Pattern replacePattern = Pattern.compile("^REPLACE");
        Pattern selectPattern = Pattern.compile("^SELECT");

        Matcher insertMatcher = insertPattern.matcher(query);
        Matcher deleteMatcher = deletePattern.matcher(query);
        Matcher updateMatcher = updatePattern.matcher(query);
        Matcher replaceMatcher = replacePattern.matcher(query);
        Matcher selectMatcher = selectPattern.matcher(query);

        if (insertMatcher.find()) {
            queryType = "INSERT";
        } else if (deleteMatcher.find()) {
            queryType = "DELETE";
        } else if (updateMatcher.find()) {
            queryType = "UPDATE";
        } else if (replaceMatcher.find()) {
            queryType = "REPLACE";
        } else if (selectMatcher.find()) {
            queryType = "SELECT";
        }

        return queryType;
    }
}
