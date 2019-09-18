package edu.berkeley.gpporgs.resolver;

import com.coxautodev.graphql.tools.GraphQLResolver;
import edu.berkeley.gpporgs.model.Language;
import edu.berkeley.gpporgs.model.Review;
import edu.berkeley.gpporgs.model.Sector;
import edu.berkeley.gpporgs.repository.LanguageRepository;
import edu.berkeley.gpporgs.repository.SectorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class ReviewResolver implements GraphQLResolver<Review> {

    @Autowired
    private LanguageRepository languageRepository;

    @Autowired
    private SectorRepository sectorRepository;

    @Value("${mysql_data_delimiter}")
    private String dataDelimiter;

    public Iterable<Language> getLanguages(Review review) {
        List<String> languageCodes = Arrays.asList(review.getLanguageCodes().split(dataDelimiter));
        return languageRepository.findAllById(languageCodes);
    }

    public Iterable<Sector> getSectors(Review review) {
        List<Long> sectorIds = new ArrayList<>();
        for (String sectorId: review.getSectorIds().split(dataDelimiter)) {
            sectorIds.add(Long.parseLong(sectorId));
        }
        return sectorRepository.findAllById(sectorIds);
    }
}
