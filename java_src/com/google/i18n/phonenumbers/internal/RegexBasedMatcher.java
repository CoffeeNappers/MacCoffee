package com.google.i18n.phonenumbers.internal;

import com.google.i18n.phonenumbers.Phonemetadata;
import com.google.i18n.phonenumbers.RegexCache;
import java.util.regex.Matcher;
/* loaded from: classes2.dex */
public final class RegexBasedMatcher implements MatcherApi {
    private final RegexCache regexCache = new RegexCache(100);

    public static MatcherApi create() {
        return new RegexBasedMatcher();
    }

    private RegexBasedMatcher() {
    }

    @Override // com.google.i18n.phonenumbers.internal.MatcherApi
    public boolean matchesNationalNumber(String nationalNumber, Phonemetadata.PhoneNumberDesc numberDesc, boolean allowPrefixMatch) {
        Matcher nationalNumberPatternMatcher = this.regexCache.getPatternForRegex(numberDesc.getNationalNumberPattern()).matcher(nationalNumber);
        return nationalNumberPatternMatcher.matches() || (allowPrefixMatch && nationalNumberPatternMatcher.lookingAt());
    }

    @Override // com.google.i18n.phonenumbers.internal.MatcherApi
    public boolean matchesPossibleNumber(String nationalNumber, Phonemetadata.PhoneNumberDesc numberDesc) {
        Matcher possibleNumberPatternMatcher = this.regexCache.getPatternForRegex(numberDesc.getPossibleNumberPattern()).matcher(nationalNumber);
        return possibleNumberPatternMatcher.matches();
    }
}
