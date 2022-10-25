package com.google.i18n.phonenumbers;

import com.google.i18n.phonenumbers.Phonemetadata;
import com.google.i18n.phonenumbers.Phonenumber;
import com.google.i18n.phonenumbers.internal.MatcherApi;
import com.google.i18n.phonenumbers.internal.RegexBasedMatcher;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
/* loaded from: classes.dex */
public class ShortNumberInfo {
    private final Map<Integer, List<String>> countryCallingCodeToRegionCodeMap = CountryCodeToRegionCodeMap.getCountryCodeToRegionCodeMap();
    private final MatcherApi matcherApi;
    private static final Logger logger = Logger.getLogger(ShortNumberInfo.class.getName());
    private static final ShortNumberInfo INSTANCE = new ShortNumberInfo(RegexBasedMatcher.create());
    private static final Set<String> REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT = new HashSet();

    /* loaded from: classes2.dex */
    public enum ShortNumberCost {
        TOLL_FREE,
        STANDARD_RATE,
        PREMIUM_RATE,
        UNKNOWN_COST
    }

    static {
        REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT.add("BR");
        REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT.add("CL");
        REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT.add("NI");
    }

    public static ShortNumberInfo getInstance() {
        return INSTANCE;
    }

    ShortNumberInfo(MatcherApi matcherApi) {
        this.matcherApi = matcherApi;
    }

    private List<String> getRegionCodesForCountryCode(int countryCallingCode) {
        List<String> regionCodes = this.countryCallingCodeToRegionCodeMap.get(Integer.valueOf(countryCallingCode));
        if (regionCodes == null) {
            regionCodes = new ArrayList<>(0);
        }
        return Collections.unmodifiableList(regionCodes);
    }

    @Deprecated
    public boolean isPossibleShortNumberForRegion(String shortNumber, String regionDialingFrom) {
        Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionDialingFrom);
        if (phoneMetadata == null) {
            return false;
        }
        return this.matcherApi.matchesPossibleNumber(shortNumber, phoneMetadata.getGeneralDesc());
    }

    public boolean isPossibleShortNumberForRegion(Phonenumber.PhoneNumber number, String regionDialingFrom) {
        Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionDialingFrom);
        if (phoneMetadata == null) {
            return false;
        }
        return this.matcherApi.matchesPossibleNumber(getNationalSignificantNumber(number), phoneMetadata.getGeneralDesc());
    }

    public boolean isPossibleShortNumber(Phonenumber.PhoneNumber number) {
        List<String> regionCodes = getRegionCodesForCountryCode(number.getCountryCode());
        String shortNumber = getNationalSignificantNumber(number);
        for (String region : regionCodes) {
            Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(region);
            if (this.matcherApi.matchesPossibleNumber(shortNumber, phoneMetadata.getGeneralDesc())) {
                return true;
            }
        }
        return false;
    }

    @Deprecated
    public boolean isValidShortNumberForRegion(String shortNumber, String regionDialingFrom) {
        Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionDialingFrom);
        if (phoneMetadata == null) {
            return false;
        }
        Phonemetadata.PhoneNumberDesc generalDesc = phoneMetadata.getGeneralDesc();
        if (!matchesPossibleNumberAndNationalNumber(shortNumber, generalDesc)) {
            return false;
        }
        Phonemetadata.PhoneNumberDesc shortNumberDesc = phoneMetadata.getShortCode();
        return matchesPossibleNumberAndNationalNumber(shortNumber, shortNumberDesc);
    }

    public boolean isValidShortNumberForRegion(Phonenumber.PhoneNumber number, String regionDialingFrom) {
        Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionDialingFrom);
        if (phoneMetadata == null) {
            return false;
        }
        String shortNumber = getNationalSignificantNumber(number);
        Phonemetadata.PhoneNumberDesc generalDesc = phoneMetadata.getGeneralDesc();
        if (!matchesPossibleNumberAndNationalNumber(shortNumber, generalDesc)) {
            return false;
        }
        Phonemetadata.PhoneNumberDesc shortNumberDesc = phoneMetadata.getShortCode();
        return matchesPossibleNumberAndNationalNumber(shortNumber, shortNumberDesc);
    }

    public boolean isValidShortNumber(Phonenumber.PhoneNumber number) {
        List<String> regionCodes = getRegionCodesForCountryCode(number.getCountryCode());
        String regionCode = getRegionCodeForShortNumberFromRegionList(number, regionCodes);
        if (regionCodes.size() <= 1 || regionCode == null) {
            return isValidShortNumberForRegion(number, regionCode);
        }
        return true;
    }

    @Deprecated
    public ShortNumberCost getExpectedCostForRegion(String shortNumber, String regionDialingFrom) {
        Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionDialingFrom);
        if (phoneMetadata == null) {
            return ShortNumberCost.UNKNOWN_COST;
        }
        if (matchesPossibleNumberAndNationalNumber(shortNumber, phoneMetadata.getPremiumRate())) {
            return ShortNumberCost.PREMIUM_RATE;
        }
        if (matchesPossibleNumberAndNationalNumber(shortNumber, phoneMetadata.getStandardRate())) {
            return ShortNumberCost.STANDARD_RATE;
        }
        if (matchesPossibleNumberAndNationalNumber(shortNumber, phoneMetadata.getTollFree())) {
            return ShortNumberCost.TOLL_FREE;
        }
        if (isEmergencyNumber(shortNumber, regionDialingFrom)) {
            return ShortNumberCost.TOLL_FREE;
        }
        return ShortNumberCost.UNKNOWN_COST;
    }

    public ShortNumberCost getExpectedCostForRegion(Phonenumber.PhoneNumber number, String regionDialingFrom) {
        Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionDialingFrom);
        if (phoneMetadata == null) {
            return ShortNumberCost.UNKNOWN_COST;
        }
        String shortNumber = getNationalSignificantNumber(number);
        if (matchesPossibleNumberAndNationalNumber(shortNumber, phoneMetadata.getPremiumRate())) {
            return ShortNumberCost.PREMIUM_RATE;
        }
        if (matchesPossibleNumberAndNationalNumber(shortNumber, phoneMetadata.getStandardRate())) {
            return ShortNumberCost.STANDARD_RATE;
        }
        if (matchesPossibleNumberAndNationalNumber(shortNumber, phoneMetadata.getTollFree())) {
            return ShortNumberCost.TOLL_FREE;
        }
        if (isEmergencyNumber(shortNumber, regionDialingFrom)) {
            return ShortNumberCost.TOLL_FREE;
        }
        return ShortNumberCost.UNKNOWN_COST;
    }

    public ShortNumberCost getExpectedCost(Phonenumber.PhoneNumber number) {
        List<String> regionCodes = getRegionCodesForCountryCode(number.getCountryCode());
        if (regionCodes.size() == 0) {
            return ShortNumberCost.UNKNOWN_COST;
        }
        if (regionCodes.size() == 1) {
            return getExpectedCostForRegion(number, regionCodes.get(0));
        }
        ShortNumberCost cost = ShortNumberCost.TOLL_FREE;
        for (String regionCode : regionCodes) {
            ShortNumberCost costForRegion = getExpectedCostForRegion(number, regionCode);
            switch (costForRegion) {
                case PREMIUM_RATE:
                    ShortNumberCost cost2 = ShortNumberCost.PREMIUM_RATE;
                    return cost2;
                case UNKNOWN_COST:
                    cost = ShortNumberCost.UNKNOWN_COST;
                    break;
                case STANDARD_RATE:
                    if (cost != ShortNumberCost.UNKNOWN_COST) {
                        cost = ShortNumberCost.STANDARD_RATE;
                        break;
                    } else {
                        break;
                    }
                case TOLL_FREE:
                    break;
                default:
                    Logger logger2 = logger;
                    Level level = Level.SEVERE;
                    String valueOf = String.valueOf(String.valueOf(costForRegion));
                    logger2.log(level, new StringBuilder(valueOf.length() + 30).append("Unrecognised cost for region: ").append(valueOf).toString());
                    break;
            }
        }
        return cost;
    }

    private String getRegionCodeForShortNumberFromRegionList(Phonenumber.PhoneNumber number, List<String> regionCodes) {
        if (regionCodes.size() == 0) {
            return null;
        }
        if (regionCodes.size() == 1) {
            return regionCodes.get(0);
        }
        String nationalNumber = getNationalSignificantNumber(number);
        for (String regionCode : regionCodes) {
            Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionCode);
            if (phoneMetadata != null && matchesPossibleNumberAndNationalNumber(nationalNumber, phoneMetadata.getShortCode())) {
                return regionCode;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Set<String> getSupportedRegions() {
        return Collections.unmodifiableSet(MetadataManager.getShortNumberMetadataSupportedRegions());
    }

    String getExampleShortNumber(String regionCode) {
        Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionCode);
        if (phoneMetadata == null) {
            return "";
        }
        Phonemetadata.PhoneNumberDesc desc = phoneMetadata.getShortCode();
        if (desc.hasExampleNumber()) {
            return desc.getExampleNumber();
        }
        return "";
    }

    String getExampleShortNumberForCost(String regionCode, ShortNumberCost cost) {
        Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionCode);
        if (phoneMetadata == null) {
            return "";
        }
        Phonemetadata.PhoneNumberDesc desc = null;
        switch (cost) {
            case PREMIUM_RATE:
                desc = phoneMetadata.getPremiumRate();
                break;
            case STANDARD_RATE:
                desc = phoneMetadata.getStandardRate();
                break;
            case TOLL_FREE:
                desc = phoneMetadata.getTollFree();
                break;
        }
        if (desc != null && desc.hasExampleNumber()) {
            return desc.getExampleNumber();
        }
        return "";
    }

    public boolean connectsToEmergencyNumber(String number, String regionCode) {
        return matchesEmergencyNumberHelper(number, regionCode, true);
    }

    public boolean isEmergencyNumber(String number, String regionCode) {
        return matchesEmergencyNumberHelper(number, regionCode, false);
    }

    private boolean matchesEmergencyNumberHelper(String number, String regionCode, boolean allowPrefixMatch) {
        Phonemetadata.PhoneMetadata metadata;
        boolean allowPrefixMatchForRegion = false;
        String number2 = PhoneNumberUtil.extractPossibleNumber(number);
        if (!PhoneNumberUtil.PLUS_CHARS_PATTERN.matcher(number2).lookingAt() && (metadata = MetadataManager.getShortNumberMetadataForRegion(regionCode)) != null && metadata.hasEmergency()) {
            String normalizedNumber = PhoneNumberUtil.normalizeDigitsOnly(number2);
            Phonemetadata.PhoneNumberDesc emergencyDesc = metadata.getEmergency();
            if (allowPrefixMatch && !REGIONS_WHERE_EMERGENCY_NUMBERS_MUST_BE_EXACT.contains(regionCode)) {
                allowPrefixMatchForRegion = true;
            }
            return this.matcherApi.matchesNationalNumber(normalizedNumber, emergencyDesc, allowPrefixMatchForRegion);
        }
        return false;
    }

    public boolean isCarrierSpecific(Phonenumber.PhoneNumber number) {
        List<String> regionCodes = getRegionCodesForCountryCode(number.getCountryCode());
        String regionCode = getRegionCodeForShortNumberFromRegionList(number, regionCodes);
        String nationalNumber = getNationalSignificantNumber(number);
        Phonemetadata.PhoneMetadata phoneMetadata = MetadataManager.getShortNumberMetadataForRegion(regionCode);
        return phoneMetadata != null && matchesPossibleNumberAndNationalNumber(nationalNumber, phoneMetadata.getCarrierSpecific());
    }

    private static String getNationalSignificantNumber(Phonenumber.PhoneNumber number) {
        StringBuilder nationalNumber = new StringBuilder();
        if (number.isItalianLeadingZero()) {
            char[] zeros = new char[number.getNumberOfLeadingZeros()];
            Arrays.fill(zeros, '0');
            nationalNumber.append(new String(zeros));
        }
        nationalNumber.append(number.getNationalNumber());
        return nationalNumber.toString();
    }

    private boolean matchesPossibleNumberAndNationalNumber(String number, Phonemetadata.PhoneNumberDesc numberDesc) {
        return this.matcherApi.matchesPossibleNumber(number, numberDesc) && this.matcherApi.matchesNationalNumber(number, numberDesc, false);
    }
}
