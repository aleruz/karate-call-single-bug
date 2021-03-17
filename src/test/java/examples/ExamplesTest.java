package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ExamplesTest {

    @Test
    void testParallel() {
        final List<String> tags = new ArrayList<>();
        tags.add("~@ignore");

        Results results = Runner.path("classpath:examples")
                .tags(tags)
                .outputCucumberJson(true)
                .parallel(3);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
}
