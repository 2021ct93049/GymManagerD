/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package gymmanagerd.app;

import gymmanagerd.list.LinkedList;

import static gymmanagerd.utilities.StringUtils.join;
import static gymmanagerd.utilities.StringUtils.split;
import static gymmanagerd.app.MessageUtils.getMessage;

import org.apache.commons.text.WordUtils;

public class App {
    public static void main(String[] args) {
        LinkedList tokens;
        tokens = split(getMessage());
        String result = join(tokens);
        System.out.println(WordUtils.capitalize(result));
    }
}
