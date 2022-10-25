package com.google.i18n.phonenumbers;

import com.facebook.appevents.AppEventsConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberMatcher;
import com.google.i18n.phonenumbers.Phonemetadata;
import com.google.i18n.phonenumbers.Phonenumber;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.slf4j.Marker;
/* loaded from: classes2.dex */
public class PhoneNumberUtil {
    private static final Map<Character, Character> ALL_PLUS_NUMBER_GROUPING_SYMBOLS;
    private static final Map<Character, Character> ALPHA_MAPPINGS;
    private static final Map<Character, Character> ALPHA_PHONE_MAPPINGS;
    private static final Pattern CAPTURING_DIGIT_PATTERN;
    private static final String CAPTURING_EXTN_DIGITS = "(\\p{Nd}{1,7})";
    private static final Pattern CC_PATTERN;
    private static final String COLOMBIA_MOBILE_TO_FIXED_LINE_PREFIX = "3";
    private static final String DEFAULT_EXTN_PREFIX = " ext. ";
    private static final Map<Character, Character> DIALLABLE_CHAR_MAPPINGS;
    private static final String DIGITS = "\\p{Nd}";
    private static final Pattern EXTN_PATTERN;
    static final String EXTN_PATTERNS_FOR_MATCHING;
    private static final String EXTN_PATTERNS_FOR_PARSING;
    private static final Pattern FG_PATTERN;
    private static final Pattern FIRST_GROUP_ONLY_PREFIX_PATTERN;
    private static final Pattern FIRST_GROUP_PATTERN;
    private static final int MAX_INPUT_STRING_LENGTH = 250;
    static final int MAX_LENGTH_COUNTRY_CODE = 3;
    static final int MAX_LENGTH_FOR_NSN = 17;
    private static final String META_DATA_FILE_PREFIX = "/com/google/i18n/phonenumbers/data/PhoneNumberMetadataProto";
    private static final int MIN_LENGTH_FOR_NSN = 2;
    private static final Map<Integer, String> MOBILE_TOKEN_MAPPINGS;
    private static final int NANPA_COUNTRY_CODE = 1;
    static final Pattern NON_DIGITS_PATTERN;
    private static final Pattern NP_PATTERN;
    static final String PLUS_CHARS = "+＋";
    static final Pattern PLUS_CHARS_PATTERN;
    static final char PLUS_SIGN = '+';
    static final int REGEX_FLAGS = 66;
    public static final String REGION_CODE_FOR_NON_GEO_ENTITY = "001";
    private static final String RFC3966_EXTN_PREFIX = ";ext=";
    private static final String RFC3966_ISDN_SUBADDRESS = ";isub=";
    private static final String RFC3966_PHONE_CONTEXT = ";phone-context=";
    private static final String RFC3966_PREFIX = "tel:";
    private static final String SECOND_NUMBER_START = "[\\\\/] *x";
    static final Pattern SECOND_NUMBER_START_PATTERN;
    private static final Pattern SEPARATOR_PATTERN;
    private static final char STAR_SIGN = '*';
    private static final Pattern UNIQUE_INTERNATIONAL_PREFIX;
    private static final String UNKNOWN_REGION = "ZZ";
    private static final String UNWANTED_END_CHARS = "[[\\P{N}&&\\P{L}]&&[^#]]+$";
    static final Pattern UNWANTED_END_CHAR_PATTERN;
    private static final String VALID_ALPHA;
    private static final Pattern VALID_ALPHA_PHONE_PATTERN;
    private static final String VALID_PHONE_NUMBER;
    private static final Pattern VALID_PHONE_NUMBER_PATTERN;
    static final String VALID_PUNCTUATION = "-x‐-―−ー－-／  \u00ad\u200b\u2060\u3000()（）［］.\\[\\]/~⁓∼～";
    private static final String VALID_START_CHAR = "[+＋\\p{Nd}]";
    private static final Pattern VALID_START_CHAR_PATTERN;
    private static PhoneNumberUtil instance;
    private final Map<Integer, List<String>> countryCallingCodeToRegionCodeMap;
    private final String currentFilePrefix;
    private final MetadataLoader metadataLoader;
    static final MetadataLoader DEFAULT_METADATA_LOADER = new MetadataLoader() { // from class: com.google.i18n.phonenumbers.PhoneNumberUtil.1
        @Override // com.google.i18n.phonenumbers.MetadataLoader
        public InputStream loadMetadata(String metadataFileName) {
            return PhoneNumberUtil.class.getResourceAsStream(metadataFileName);
        }
    };
    private static final Logger logger = Logger.getLogger(PhoneNumberUtil.class.getName());
    private final Set<String> nanpaRegions = new HashSet(35);
    private final Map<String, Phonemetadata.PhoneMetadata> regionToMetadataMap = Collections.synchronizedMap(new HashMap());
    private final Map<Integer, Phonemetadata.PhoneMetadata> countryCodeToNonGeographicalMetadataMap = Collections.synchronizedMap(new HashMap());
    private final RegexCache regexCache = new RegexCache(100);
    private final Set<String> supportedRegions = new HashSet(320);
    private final Set<Integer> countryCodesForNonGeographicalRegion = new HashSet();

    /* loaded from: classes2.dex */
    public enum Leniency {
        POSSIBLE { // from class: com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency.1
            @Override // com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency
            boolean verify(Phonenumber.PhoneNumber number, String candidate, PhoneNumberUtil util) {
                return util.isPossibleNumber(number);
            }
        },
        VALID { // from class: com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency.2
            @Override // com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency
            boolean verify(Phonenumber.PhoneNumber number, String candidate, PhoneNumberUtil util) {
                if (!util.isValidNumber(number) || !PhoneNumberMatcher.containsOnlyValidXChars(number, candidate, util)) {
                    return false;
                }
                return PhoneNumberMatcher.isNationalPrefixPresentIfRequired(number, util);
            }
        },
        STRICT_GROUPING { // from class: com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency.3
            @Override // com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency
            boolean verify(Phonenumber.PhoneNumber number, String candidate, PhoneNumberUtil util) {
                if (!util.isValidNumber(number) || !PhoneNumberMatcher.containsOnlyValidXChars(number, candidate, util) || PhoneNumberMatcher.containsMoreThanOneSlashInNationalNumber(number, candidate) || !PhoneNumberMatcher.isNationalPrefixPresentIfRequired(number, util)) {
                    return false;
                }
                return PhoneNumberMatcher.checkNumberGroupingIsValid(number, candidate, util, new PhoneNumberMatcher.NumberGroupingChecker() { // from class: com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency.3.1
                    @Override // com.google.i18n.phonenumbers.PhoneNumberMatcher.NumberGroupingChecker
                    public boolean checkGroups(PhoneNumberUtil util2, Phonenumber.PhoneNumber number2, StringBuilder normalizedCandidate, String[] expectedNumberGroups) {
                        return PhoneNumberMatcher.allNumberGroupsRemainGrouped(util2, number2, normalizedCandidate, expectedNumberGroups);
                    }
                });
            }
        },
        EXACT_GROUPING { // from class: com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency.4
            @Override // com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency
            boolean verify(Phonenumber.PhoneNumber number, String candidate, PhoneNumberUtil util) {
                if (!util.isValidNumber(number) || !PhoneNumberMatcher.containsOnlyValidXChars(number, candidate, util) || PhoneNumberMatcher.containsMoreThanOneSlashInNationalNumber(number, candidate) || !PhoneNumberMatcher.isNationalPrefixPresentIfRequired(number, util)) {
                    return false;
                }
                return PhoneNumberMatcher.checkNumberGroupingIsValid(number, candidate, util, new PhoneNumberMatcher.NumberGroupingChecker() { // from class: com.google.i18n.phonenumbers.PhoneNumberUtil.Leniency.4.1
                    @Override // com.google.i18n.phonenumbers.PhoneNumberMatcher.NumberGroupingChecker
                    public boolean checkGroups(PhoneNumberUtil util2, Phonenumber.PhoneNumber number2, StringBuilder normalizedCandidate, String[] expectedNumberGroups) {
                        return PhoneNumberMatcher.allNumberGroupsAreExactlyPresent(util2, number2, normalizedCandidate, expectedNumberGroups);
                    }
                });
            }
        };

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract boolean verify(Phonenumber.PhoneNumber phoneNumber, String str, PhoneNumberUtil phoneNumberUtil);
    }

    /* loaded from: classes2.dex */
    public enum MatchType {
        NOT_A_NUMBER,
        NO_MATCH,
        SHORT_NSN_MATCH,
        NSN_MATCH,
        EXACT_MATCH
    }

    /* loaded from: classes2.dex */
    public enum PhoneNumberFormat {
        E164,
        INTERNATIONAL,
        NATIONAL,
        RFC3966
    }

    /* loaded from: classes2.dex */
    public enum PhoneNumberType {
        FIXED_LINE,
        MOBILE,
        FIXED_LINE_OR_MOBILE,
        TOLL_FREE,
        PREMIUM_RATE,
        SHARED_COST,
        VOIP,
        PERSONAL_NUMBER,
        PAGER,
        UAN,
        VOICEMAIL,
        UNKNOWN
    }

    /* loaded from: classes2.dex */
    public enum ValidationResult {
        IS_POSSIBLE,
        INVALID_COUNTRY_CODE,
        TOO_SHORT,
        TOO_LONG
    }

    static {
        HashMap<Integer, String> mobileTokenMap = new HashMap<>();
        mobileTokenMap.put(52, AppEventsConstants.EVENT_PARAM_VALUE_YES);
        mobileTokenMap.put(54, "9");
        MOBILE_TOKEN_MAPPINGS = Collections.unmodifiableMap(mobileTokenMap);
        HashMap<Character, Character> asciiDigitMappings = new HashMap<>();
        asciiDigitMappings.put('0', '0');
        asciiDigitMappings.put('1', '1');
        asciiDigitMappings.put('2', '2');
        asciiDigitMappings.put('3', '3');
        asciiDigitMappings.put('4', '4');
        asciiDigitMappings.put('5', '5');
        asciiDigitMappings.put('6', '6');
        asciiDigitMappings.put('7', '7');
        asciiDigitMappings.put('8', '8');
        asciiDigitMappings.put('9', '9');
        HashMap<Character, Character> alphaMap = new HashMap<>(40);
        alphaMap.put('A', '2');
        alphaMap.put('B', '2');
        alphaMap.put('C', '2');
        alphaMap.put('D', '3');
        alphaMap.put('E', '3');
        alphaMap.put('F', '3');
        alphaMap.put('G', '4');
        alphaMap.put('H', '4');
        alphaMap.put('I', '4');
        alphaMap.put('J', '5');
        alphaMap.put('K', '5');
        alphaMap.put('L', '5');
        alphaMap.put('M', '6');
        alphaMap.put('N', '6');
        alphaMap.put('O', '6');
        alphaMap.put('P', '7');
        alphaMap.put('Q', '7');
        alphaMap.put('R', '7');
        alphaMap.put('S', '7');
        alphaMap.put('T', '8');
        alphaMap.put('U', '8');
        alphaMap.put('V', '8');
        alphaMap.put('W', '9');
        alphaMap.put('X', '9');
        alphaMap.put('Y', '9');
        alphaMap.put('Z', '9');
        ALPHA_MAPPINGS = Collections.unmodifiableMap(alphaMap);
        HashMap<Character, Character> combinedMap = new HashMap<>(100);
        combinedMap.putAll(ALPHA_MAPPINGS);
        combinedMap.putAll(asciiDigitMappings);
        ALPHA_PHONE_MAPPINGS = Collections.unmodifiableMap(combinedMap);
        HashMap<Character, Character> diallableCharMap = new HashMap<>();
        diallableCharMap.putAll(asciiDigitMappings);
        diallableCharMap.put(Character.valueOf(PLUS_SIGN), Character.valueOf(PLUS_SIGN));
        diallableCharMap.put(Character.valueOf(STAR_SIGN), Character.valueOf(STAR_SIGN));
        DIALLABLE_CHAR_MAPPINGS = Collections.unmodifiableMap(diallableCharMap);
        HashMap<Character, Character> allPlusNumberGroupings = new HashMap<>();
        for (Character ch : ALPHA_MAPPINGS.keySet()) {
            char c = ch.charValue();
            allPlusNumberGroupings.put(Character.valueOf(Character.toLowerCase(c)), Character.valueOf(c));
            allPlusNumberGroupings.put(Character.valueOf(c), Character.valueOf(c));
        }
        allPlusNumberGroupings.putAll(asciiDigitMappings);
        allPlusNumberGroupings.put('-', '-');
        allPlusNumberGroupings.put((char) 65293, '-');
        allPlusNumberGroupings.put((char) 8208, '-');
        allPlusNumberGroupings.put((char) 8209, '-');
        allPlusNumberGroupings.put((char) 8210, '-');
        allPlusNumberGroupings.put((char) 8211, '-');
        allPlusNumberGroupings.put((char) 8212, '-');
        allPlusNumberGroupings.put((char) 8213, '-');
        allPlusNumberGroupings.put((char) 8722, '-');
        allPlusNumberGroupings.put('/', '/');
        allPlusNumberGroupings.put((char) 65295, '/');
        allPlusNumberGroupings.put(' ', ' ');
        allPlusNumberGroupings.put((char) 12288, ' ');
        allPlusNumberGroupings.put((char) 8288, ' ');
        allPlusNumberGroupings.put('.', '.');
        allPlusNumberGroupings.put((char) 65294, '.');
        ALL_PLUS_NUMBER_GROUPING_SYMBOLS = Collections.unmodifiableMap(allPlusNumberGroupings);
        UNIQUE_INTERNATIONAL_PREFIX = Pattern.compile("[\\d]+(?:[~⁓∼～][\\d]+)?");
        String valueOf = String.valueOf(Arrays.toString(ALPHA_MAPPINGS.keySet().toArray()).replaceAll("[, \\[\\]]", ""));
        String valueOf2 = String.valueOf(Arrays.toString(ALPHA_MAPPINGS.keySet().toArray()).toLowerCase().replaceAll("[, \\[\\]]", ""));
        VALID_ALPHA = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
        PLUS_CHARS_PATTERN = Pattern.compile("[+＋]+");
        SEPARATOR_PATTERN = Pattern.compile("[-x‐-―−ー－-／  \u00ad\u200b\u2060\u3000()（）［］.\\[\\]/~⁓∼～]+");
        CAPTURING_DIGIT_PATTERN = Pattern.compile("(\\p{Nd})");
        VALID_START_CHAR_PATTERN = Pattern.compile(VALID_START_CHAR);
        SECOND_NUMBER_START_PATTERN = Pattern.compile(SECOND_NUMBER_START);
        UNWANTED_END_CHAR_PATTERN = Pattern.compile(UNWANTED_END_CHARS);
        VALID_ALPHA_PHONE_PATTERN = Pattern.compile("(?:.*?[A-Za-z]){3}.*");
        String valueOf3 = String.valueOf(String.valueOf("\\p{Nd}{2}|[+＋]*+(?:[-x‐-―−ー－-／  \u00ad\u200b\u2060\u3000()（）［］.\\[\\]/~⁓∼～*]*\\p{Nd}){3,}[-x‐-―−ー－-／  \u00ad\u200b\u2060\u3000()（）［］.\\[\\]/~⁓∼～*"));
        String valueOf4 = String.valueOf(String.valueOf(VALID_ALPHA));
        String valueOf5 = String.valueOf(String.valueOf(DIGITS));
        VALID_PHONE_NUMBER = new StringBuilder(valueOf3.length() + 2 + valueOf4.length() + valueOf5.length()).append(valueOf3).append(valueOf4).append(valueOf5).append("]*").toString();
        String valueOf6 = String.valueOf("xｘ#＃~～");
        String singleExtnSymbolsForParsing = valueOf6.length() != 0 ? ",".concat(valueOf6) : new String(",");
        EXTN_PATTERNS_FOR_PARSING = createExtnPattern(singleExtnSymbolsForParsing);
        EXTN_PATTERNS_FOR_MATCHING = createExtnPattern("xｘ#＃~～");
        String valueOf7 = String.valueOf(String.valueOf(EXTN_PATTERNS_FOR_PARSING));
        EXTN_PATTERN = Pattern.compile(new StringBuilder(valueOf7.length() + 5).append("(?:").append(valueOf7).append(")$").toString(), 66);
        String valueOf8 = String.valueOf(String.valueOf(VALID_PHONE_NUMBER));
        String valueOf9 = String.valueOf(String.valueOf(EXTN_PATTERNS_FOR_PARSING));
        VALID_PHONE_NUMBER_PATTERN = Pattern.compile(new StringBuilder(valueOf8.length() + 5 + valueOf9.length()).append(valueOf8).append("(?:").append(valueOf9).append(")?").toString(), 66);
        NON_DIGITS_PATTERN = Pattern.compile("(\\D+)");
        FIRST_GROUP_PATTERN = Pattern.compile("(\\$\\d)");
        NP_PATTERN = Pattern.compile("\\$NP");
        FG_PATTERN = Pattern.compile("\\$FG");
        CC_PATTERN = Pattern.compile("\\$CC");
        FIRST_GROUP_ONLY_PREFIX_PATTERN = Pattern.compile("\\(?\\$1\\)?");
        instance = null;
    }

    private static String createExtnPattern(String singleExtnSymbols) {
        String valueOf = String.valueOf(String.valueOf(";ext=(\\p{Nd}{1,7})|[  \\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|["));
        String valueOf2 = String.valueOf(String.valueOf(singleExtnSymbols));
        String valueOf3 = String.valueOf(String.valueOf(CAPTURING_EXTN_DIGITS));
        String valueOf4 = String.valueOf(String.valueOf(DIGITS));
        return new StringBuilder(valueOf.length() + 48 + valueOf2.length() + valueOf3.length() + valueOf4.length()).append(valueOf).append(valueOf2).append("]|int|anexo|ｉｎｔ)").append("[:\\.．]?[  \\t,-]*").append(valueOf3).append("#?|").append("[- ]+(").append(valueOf4).append("{1,5})#").toString();
    }

    PhoneNumberUtil(String filePrefix, MetadataLoader metadataLoader, Map<Integer, List<String>> countryCallingCodeToRegionCodeMap) {
        this.currentFilePrefix = filePrefix;
        this.metadataLoader = metadataLoader;
        this.countryCallingCodeToRegionCodeMap = countryCallingCodeToRegionCodeMap;
        for (Map.Entry<Integer, List<String>> entry : countryCallingCodeToRegionCodeMap.entrySet()) {
            List<String> regionCodes = entry.getValue();
            if (regionCodes.size() == 1 && REGION_CODE_FOR_NON_GEO_ENTITY.equals(regionCodes.get(0))) {
                this.countryCodesForNonGeographicalRegion.add(entry.getKey());
            } else {
                this.supportedRegions.addAll(regionCodes);
            }
        }
        if (this.supportedRegions.remove(REGION_CODE_FOR_NON_GEO_ENTITY)) {
            logger.log(Level.WARNING, "invalid metadata (country calling code was mapped to the non-geo entity as well as specific region(s))");
        }
        this.nanpaRegions.addAll(countryCallingCodeToRegionCodeMap.get(1));
    }

    void loadMetadataFromFile(String filePrefix, String regionCode, int countryCallingCode, MetadataLoader metadataLoader) {
        ObjectInputStream in;
        boolean isNonGeoRegion = REGION_CODE_FOR_NON_GEO_ENTITY.equals(regionCode);
        String valueOf = String.valueOf(String.valueOf(filePrefix));
        String valueOf2 = String.valueOf(String.valueOf(isNonGeoRegion ? String.valueOf(countryCallingCode) : regionCode));
        String fileName = new StringBuilder(valueOf.length() + 1 + valueOf2.length()).append(valueOf).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(valueOf2).toString();
        InputStream source = metadataLoader.loadMetadata(fileName);
        if (source == null) {
            Logger logger2 = logger;
            Level level = Level.SEVERE;
            String valueOf3 = String.valueOf(fileName);
            logger2.log(level, valueOf3.length() != 0 ? "missing metadata: ".concat(valueOf3) : new String("missing metadata: "));
            String valueOf4 = String.valueOf(fileName);
            throw new IllegalStateException(valueOf4.length() != 0 ? "missing metadata: ".concat(valueOf4) : new String("missing metadata: "));
        }
        try {
            in = new ObjectInputStream(source);
        } catch (IOException e) {
            e = e;
        }
        try {
            Phonemetadata.PhoneMetadataCollection metadataCollection = loadMetadataAndCloseInput(in);
            List<Phonemetadata.PhoneMetadata> metadataList = metadataCollection.getMetadataList();
            if (metadataList.isEmpty()) {
                Logger logger3 = logger;
                Level level2 = Level.SEVERE;
                String valueOf5 = String.valueOf(fileName);
                logger3.log(level2, valueOf5.length() != 0 ? "empty metadata: ".concat(valueOf5) : new String("empty metadata: "));
                String valueOf6 = String.valueOf(fileName);
                throw new IllegalStateException(valueOf6.length() != 0 ? "empty metadata: ".concat(valueOf6) : new String("empty metadata: "));
            }
            if (metadataList.size() > 1) {
                Logger logger4 = logger;
                Level level3 = Level.WARNING;
                String valueOf7 = String.valueOf(fileName);
                logger4.log(level3, valueOf7.length() != 0 ? "invalid metadata (too many entries): ".concat(valueOf7) : new String("invalid metadata (too many entries): "));
            }
            Phonemetadata.PhoneMetadata metadata = metadataList.get(0);
            if (isNonGeoRegion) {
                this.countryCodeToNonGeographicalMetadataMap.put(Integer.valueOf(countryCallingCode), metadata);
            } else {
                this.regionToMetadataMap.put(regionCode, metadata);
            }
        } catch (IOException e2) {
            e = e2;
            Logger logger5 = logger;
            Level level4 = Level.SEVERE;
            String valueOf8 = String.valueOf(fileName);
            logger5.log(level4, valueOf8.length() != 0 ? "cannot load/parse metadata: ".concat(valueOf8) : new String("cannot load/parse metadata: "), (Throwable) e);
            String valueOf9 = String.valueOf(fileName);
            throw new RuntimeException(valueOf9.length() != 0 ? "cannot load/parse metadata: ".concat(valueOf9) : new String("cannot load/parse metadata: "), e);
        }
    }

    private static Phonemetadata.PhoneMetadataCollection loadMetadataAndCloseInput(ObjectInputStream source) {
        Phonemetadata.PhoneMetadataCollection metadataCollection = new Phonemetadata.PhoneMetadataCollection();
        try {
            try {
                try {
                    metadataCollection.readExternal(source);
                    try {
                        source.close();
                    } catch (IOException e) {
                        logger.log(Level.WARNING, "error closing input stream (ignored)", (Throwable) e);
                    }
                } catch (IOException e2) {
                    logger.log(Level.WARNING, "error reading input (ignored)", (Throwable) e2);
                    try {
                        try {
                            source.close();
                        } catch (IOException e3) {
                            logger.log(Level.WARNING, "error closing input stream (ignored)", (Throwable) e3);
                        }
                    } catch (Throwable th) {
                    }
                }
            } catch (Throwable th2) {
                try {
                    try {
                        source.close();
                    } catch (Throwable th3) {
                    }
                } catch (IOException e4) {
                    logger.log(Level.WARNING, "error closing input stream (ignored)", (Throwable) e4);
                }
            }
        } catch (Throwable th4) {
        }
        return metadataCollection;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String extractPossibleNumber(String number) {
        Matcher m = VALID_START_CHAR_PATTERN.matcher(number);
        if (m.find()) {
            String number2 = number.substring(m.start());
            Matcher trailingCharsMatcher = UNWANTED_END_CHAR_PATTERN.matcher(number2);
            if (trailingCharsMatcher.find()) {
                number2 = number2.substring(0, trailingCharsMatcher.start());
                Logger logger2 = logger;
                Level level = Level.FINER;
                String valueOf = String.valueOf(number2);
                logger2.log(level, valueOf.length() != 0 ? "Stripped trailing characters: ".concat(valueOf) : new String("Stripped trailing characters: "));
            }
            Matcher secondNumber = SECOND_NUMBER_START_PATTERN.matcher(number2);
            if (secondNumber.find()) {
                return number2.substring(0, secondNumber.start());
            }
            return number2;
        }
        return "";
    }

    static boolean isViablePhoneNumber(String number) {
        if (number.length() < 2) {
            return false;
        }
        Matcher m = VALID_PHONE_NUMBER_PATTERN.matcher(number);
        return m.matches();
    }

    static String normalize(String number) {
        Matcher m = VALID_ALPHA_PHONE_PATTERN.matcher(number);
        return m.matches() ? normalizeHelper(number, ALPHA_PHONE_MAPPINGS, true) : normalizeDigitsOnly(number);
    }

    static void normalize(StringBuilder number) {
        String normalizedNumber = normalize(number.toString());
        number.replace(0, number.length(), normalizedNumber);
    }

    public static String normalizeDigitsOnly(String number) {
        return normalizeDigits(number, false).toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static StringBuilder normalizeDigits(String number, boolean keepNonDigits) {
        StringBuilder normalizedDigits = new StringBuilder(number.length());
        char[] arr$ = number.toCharArray();
        for (char c : arr$) {
            int digit = Character.digit(c, 10);
            if (digit != -1) {
                normalizedDigits.append(digit);
            } else if (keepNonDigits) {
                normalizedDigits.append(c);
            }
        }
        return normalizedDigits;
    }

    static String normalizeDiallableCharsOnly(String number) {
        return normalizeHelper(number, DIALLABLE_CHAR_MAPPINGS, true);
    }

    public static String convertAlphaCharactersInNumber(String number) {
        return normalizeHelper(number, ALPHA_PHONE_MAPPINGS, false);
    }

    public int getLengthOfGeographicalAreaCode(Phonenumber.PhoneNumber number) {
        Phonemetadata.PhoneMetadata metadata = getMetadataForRegion(getRegionCodeForNumber(number));
        if (metadata == null) {
            return 0;
        }
        if ((!metadata.hasNationalPrefix() && !number.isItalianLeadingZero()) || !isNumberGeographical(number)) {
            return 0;
        }
        return getLengthOfNationalDestinationCode(number);
    }

    public int getLengthOfNationalDestinationCode(Phonenumber.PhoneNumber number) {
        Phonenumber.PhoneNumber copiedProto;
        if (number.hasExtension()) {
            copiedProto = new Phonenumber.PhoneNumber();
            copiedProto.mergeFrom(number);
            copiedProto.clearExtension();
        } else {
            copiedProto = number;
        }
        String nationalSignificantNumber = format(copiedProto, PhoneNumberFormat.INTERNATIONAL);
        String[] numberGroups = NON_DIGITS_PATTERN.split(nationalSignificantNumber);
        if (numberGroups.length <= 3) {
            return 0;
        }
        if (getNumberType(number) == PhoneNumberType.MOBILE) {
            String mobileToken = getCountryMobileToken(number.getCountryCode());
            if (!mobileToken.equals("")) {
                return numberGroups[2].length() + numberGroups[3].length();
            }
        }
        return numberGroups[2].length();
    }

    public static String getCountryMobileToken(int countryCallingCode) {
        return MOBILE_TOKEN_MAPPINGS.containsKey(Integer.valueOf(countryCallingCode)) ? MOBILE_TOKEN_MAPPINGS.get(Integer.valueOf(countryCallingCode)) : "";
    }

    private static String normalizeHelper(String number, Map<Character, Character> normalizationReplacements, boolean removeNonMatches) {
        StringBuilder normalizedNumber = new StringBuilder(number.length());
        for (int i = 0; i < number.length(); i++) {
            char character = number.charAt(i);
            Character newDigit = normalizationReplacements.get(Character.valueOf(Character.toUpperCase(character)));
            if (newDigit != null) {
                normalizedNumber.append(newDigit);
            } else if (!removeNonMatches) {
                normalizedNumber.append(character);
            }
        }
        return normalizedNumber.toString();
    }

    static synchronized void setInstance(PhoneNumberUtil util) {
        synchronized (PhoneNumberUtil.class) {
            instance = util;
        }
    }

    public Set<String> getSupportedRegions() {
        return Collections.unmodifiableSet(this.supportedRegions);
    }

    public Set<Integer> getSupportedGlobalNetworkCallingCodes() {
        return Collections.unmodifiableSet(this.countryCodesForNonGeographicalRegion);
    }

    public static synchronized PhoneNumberUtil getInstance() {
        PhoneNumberUtil phoneNumberUtil;
        synchronized (PhoneNumberUtil.class) {
            if (instance == null) {
                setInstance(createInstance(DEFAULT_METADATA_LOADER));
            }
            phoneNumberUtil = instance;
        }
        return phoneNumberUtil;
    }

    public static PhoneNumberUtil createInstance(MetadataLoader metadataLoader) {
        if (metadataLoader == null) {
            throw new IllegalArgumentException("metadataLoader could not be null.");
        }
        return new PhoneNumberUtil(META_DATA_FILE_PREFIX, metadataLoader, CountryCodeToRegionCodeMap.getCountryCodeToRegionCodeMap());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean formattingRuleHasFirstGroupOnly(String nationalPrefixFormattingRule) {
        return nationalPrefixFormattingRule.length() == 0 || FIRST_GROUP_ONLY_PREFIX_PATTERN.matcher(nationalPrefixFormattingRule).matches();
    }

    boolean isNumberGeographical(Phonenumber.PhoneNumber phoneNumber) {
        PhoneNumberType numberType = getNumberType(phoneNumber);
        return numberType == PhoneNumberType.FIXED_LINE || numberType == PhoneNumberType.FIXED_LINE_OR_MOBILE;
    }

    private boolean isValidRegionCode(String regionCode) {
        return regionCode != null && this.supportedRegions.contains(regionCode);
    }

    private boolean hasValidCountryCallingCode(int countryCallingCode) {
        return this.countryCallingCodeToRegionCodeMap.containsKey(Integer.valueOf(countryCallingCode));
    }

    public String format(Phonenumber.PhoneNumber number, PhoneNumberFormat numberFormat) {
        if (number.getNationalNumber() == 0 && number.hasRawInput()) {
            String rawInput = number.getRawInput();
            if (rawInput.length() > 0) {
                return rawInput;
            }
        }
        StringBuilder formattedNumber = new StringBuilder(20);
        format(number, numberFormat, formattedNumber);
        return formattedNumber.toString();
    }

    public void format(Phonenumber.PhoneNumber number, PhoneNumberFormat numberFormat, StringBuilder formattedNumber) {
        formattedNumber.setLength(0);
        int countryCallingCode = number.getCountryCode();
        String nationalSignificantNumber = getNationalSignificantNumber(number);
        if (numberFormat == PhoneNumberFormat.E164) {
            formattedNumber.append(nationalSignificantNumber);
            prefixNumberWithCountryCallingCode(countryCallingCode, PhoneNumberFormat.E164, formattedNumber);
        } else if (!hasValidCountryCallingCode(countryCallingCode)) {
            formattedNumber.append(nationalSignificantNumber);
        } else {
            String regionCode = getRegionCodeForCountryCode(countryCallingCode);
            Phonemetadata.PhoneMetadata metadata = getMetadataForRegionOrCallingCode(countryCallingCode, regionCode);
            formattedNumber.append(formatNsn(nationalSignificantNumber, metadata, numberFormat));
            maybeAppendFormattedExtension(number, metadata, numberFormat, formattedNumber);
            prefixNumberWithCountryCallingCode(countryCallingCode, numberFormat, formattedNumber);
        }
    }

    public String formatByPattern(Phonenumber.PhoneNumber number, PhoneNumberFormat numberFormat, List<Phonemetadata.NumberFormat> userDefinedFormats) {
        int countryCallingCode = number.getCountryCode();
        String nationalSignificantNumber = getNationalSignificantNumber(number);
        if (hasValidCountryCallingCode(countryCallingCode)) {
            String regionCode = getRegionCodeForCountryCode(countryCallingCode);
            Phonemetadata.PhoneMetadata metadata = getMetadataForRegionOrCallingCode(countryCallingCode, regionCode);
            StringBuilder formattedNumber = new StringBuilder(20);
            Phonemetadata.NumberFormat formattingPattern = chooseFormattingPatternForNumber(userDefinedFormats, nationalSignificantNumber);
            if (formattingPattern == null) {
                formattedNumber.append(nationalSignificantNumber);
            } else {
                Phonemetadata.NumberFormat numFormatCopy = new Phonemetadata.NumberFormat();
                numFormatCopy.mergeFrom(formattingPattern);
                String nationalPrefixFormattingRule = formattingPattern.getNationalPrefixFormattingRule();
                if (nationalPrefixFormattingRule.length() > 0) {
                    String nationalPrefix = metadata.getNationalPrefix();
                    if (nationalPrefix.length() > 0) {
                        numFormatCopy.setNationalPrefixFormattingRule(FG_PATTERN.matcher(NP_PATTERN.matcher(nationalPrefixFormattingRule).replaceFirst(nationalPrefix)).replaceFirst("\\$1"));
                    } else {
                        numFormatCopy.clearNationalPrefixFormattingRule();
                    }
                }
                formattedNumber.append(formatNsnUsingPattern(nationalSignificantNumber, numFormatCopy, numberFormat));
            }
            maybeAppendFormattedExtension(number, metadata, numberFormat, formattedNumber);
            prefixNumberWithCountryCallingCode(countryCallingCode, numberFormat, formattedNumber);
            return formattedNumber.toString();
        }
        return nationalSignificantNumber;
    }

    public String formatNationalNumberWithCarrierCode(Phonenumber.PhoneNumber number, String carrierCode) {
        int countryCallingCode = number.getCountryCode();
        String nationalSignificantNumber = getNationalSignificantNumber(number);
        if (hasValidCountryCallingCode(countryCallingCode)) {
            String regionCode = getRegionCodeForCountryCode(countryCallingCode);
            Phonemetadata.PhoneMetadata metadata = getMetadataForRegionOrCallingCode(countryCallingCode, regionCode);
            StringBuilder formattedNumber = new StringBuilder(20);
            formattedNumber.append(formatNsn(nationalSignificantNumber, metadata, PhoneNumberFormat.NATIONAL, carrierCode));
            maybeAppendFormattedExtension(number, metadata, PhoneNumberFormat.NATIONAL, formattedNumber);
            prefixNumberWithCountryCallingCode(countryCallingCode, PhoneNumberFormat.NATIONAL, formattedNumber);
            return formattedNumber.toString();
        }
        return nationalSignificantNumber;
    }

    private Phonemetadata.PhoneMetadata getMetadataForRegionOrCallingCode(int countryCallingCode, String regionCode) {
        return REGION_CODE_FOR_NON_GEO_ENTITY.equals(regionCode) ? getMetadataForNonGeographicalRegion(countryCallingCode) : getMetadataForRegion(regionCode);
    }

    public String formatNationalNumberWithPreferredCarrierCode(Phonenumber.PhoneNumber number, String fallbackCarrierCode) {
        if (number.hasPreferredDomesticCarrierCode()) {
            fallbackCarrierCode = number.getPreferredDomesticCarrierCode();
        }
        return formatNationalNumberWithCarrierCode(number, fallbackCarrierCode);
    }

    public String formatNumberForMobileDialing(Phonenumber.PhoneNumber number, String regionCallingFrom, boolean withFormatting) {
        int countryCallingCode = number.getCountryCode();
        if (!hasValidCountryCallingCode(countryCallingCode)) {
            return number.hasRawInput() ? number.getRawInput() : "";
        }
        String formattedNumber = "";
        Phonenumber.PhoneNumber numberNoExt = new Phonenumber.PhoneNumber().mergeFrom(number).clearExtension();
        String regionCode = getRegionCodeForCountryCode(countryCallingCode);
        PhoneNumberType numberType = getNumberType(numberNoExt);
        boolean isValidNumber = numberType != PhoneNumberType.UNKNOWN;
        if (regionCallingFrom.equals(regionCode)) {
            boolean isFixedLineOrMobile = numberType == PhoneNumberType.FIXED_LINE || numberType == PhoneNumberType.MOBILE || numberType == PhoneNumberType.FIXED_LINE_OR_MOBILE;
            if (regionCode.equals("CO") && numberType == PhoneNumberType.FIXED_LINE) {
                formattedNumber = formatNationalNumberWithCarrierCode(numberNoExt, COLOMBIA_MOBILE_TO_FIXED_LINE_PREFIX);
            } else if (regionCode.equals("BR") && isFixedLineOrMobile) {
                formattedNumber = numberNoExt.hasPreferredDomesticCarrierCode() ? formatNationalNumberWithPreferredCarrierCode(numberNoExt, "") : "";
            } else if (isValidNumber && regionCode.equals("HU")) {
                String valueOf = String.valueOf(String.valueOf(getNddPrefixForRegion(regionCode, true)));
                String valueOf2 = String.valueOf(String.valueOf(format(numberNoExt, PhoneNumberFormat.NATIONAL)));
                formattedNumber = new StringBuilder(valueOf.length() + 1 + valueOf2.length()).append(valueOf).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf2).toString();
            } else if (countryCallingCode == 1) {
                Phonemetadata.PhoneMetadata regionMetadata = getMetadataForRegion(regionCallingFrom);
                formattedNumber = (!canBeInternationallyDialled(numberNoExt) || isShorterThanPossibleNormalNumber(regionMetadata, getNationalSignificantNumber(numberNoExt))) ? format(numberNoExt, PhoneNumberFormat.NATIONAL) : format(numberNoExt, PhoneNumberFormat.INTERNATIONAL);
            } else {
                formattedNumber = ((regionCode.equals(REGION_CODE_FOR_NON_GEO_ENTITY) || ((regionCode.equals("MX") || regionCode.equals("CL")) && isFixedLineOrMobile)) && canBeInternationallyDialled(numberNoExt)) ? format(numberNoExt, PhoneNumberFormat.INTERNATIONAL) : format(numberNoExt, PhoneNumberFormat.NATIONAL);
            }
        } else if (isValidNumber && canBeInternationallyDialled(numberNoExt)) {
            return withFormatting ? format(numberNoExt, PhoneNumberFormat.INTERNATIONAL) : format(numberNoExt, PhoneNumberFormat.E164);
        }
        if (!withFormatting) {
            formattedNumber = normalizeDiallableCharsOnly(formattedNumber);
        }
        return formattedNumber;
    }

    public String formatOutOfCountryCallingNumber(Phonenumber.PhoneNumber number, String regionCallingFrom) {
        if (!isValidRegionCode(regionCallingFrom)) {
            Logger logger2 = logger;
            Level level = Level.WARNING;
            String valueOf = String.valueOf(String.valueOf(regionCallingFrom));
            logger2.log(level, new StringBuilder(valueOf.length() + 79).append("Trying to format number from invalid region ").append(valueOf).append(". International formatting applied.").toString());
            return format(number, PhoneNumberFormat.INTERNATIONAL);
        }
        int countryCallingCode = number.getCountryCode();
        String nationalSignificantNumber = getNationalSignificantNumber(number);
        if (hasValidCountryCallingCode(countryCallingCode)) {
            if (countryCallingCode == 1) {
                if (isNANPACountry(regionCallingFrom)) {
                    String valueOf2 = String.valueOf(String.valueOf(format(number, PhoneNumberFormat.NATIONAL)));
                    return new StringBuilder(valueOf2.length() + 12).append(countryCallingCode).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf2).toString();
                }
            } else if (countryCallingCode == getCountryCodeForValidRegion(regionCallingFrom)) {
                return format(number, PhoneNumberFormat.NATIONAL);
            }
            Phonemetadata.PhoneMetadata metadataForRegionCallingFrom = getMetadataForRegion(regionCallingFrom);
            String internationalPrefix = metadataForRegionCallingFrom.getInternationalPrefix();
            String internationalPrefixForFormatting = "";
            if (UNIQUE_INTERNATIONAL_PREFIX.matcher(internationalPrefix).matches()) {
                internationalPrefixForFormatting = internationalPrefix;
            } else if (metadataForRegionCallingFrom.hasPreferredInternationalPrefix()) {
                internationalPrefixForFormatting = metadataForRegionCallingFrom.getPreferredInternationalPrefix();
            }
            String regionCode = getRegionCodeForCountryCode(countryCallingCode);
            Phonemetadata.PhoneMetadata metadataForRegion = getMetadataForRegionOrCallingCode(countryCallingCode, regionCode);
            String formattedNationalNumber = formatNsn(nationalSignificantNumber, metadataForRegion, PhoneNumberFormat.INTERNATIONAL);
            StringBuilder formattedNumber = new StringBuilder(formattedNationalNumber);
            maybeAppendFormattedExtension(number, metadataForRegion, PhoneNumberFormat.INTERNATIONAL, formattedNumber);
            if (internationalPrefixForFormatting.length() > 0) {
                formattedNumber.insert(0, MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).insert(0, countryCallingCode).insert(0, MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).insert(0, internationalPrefixForFormatting);
            } else {
                prefixNumberWithCountryCallingCode(countryCallingCode, PhoneNumberFormat.INTERNATIONAL, formattedNumber);
            }
            return formattedNumber.toString();
        }
        return nationalSignificantNumber;
    }

    public String formatInOriginalFormat(Phonenumber.PhoneNumber number, String regionCallingFrom) {
        String formattedNumber;
        if (number.hasRawInput() && (hasUnexpectedItalianLeadingZero(number) || !hasFormattingPatternForNumber(number))) {
            return number.getRawInput();
        }
        if (!number.hasCountryCodeSource()) {
            return format(number, PhoneNumberFormat.NATIONAL);
        }
        switch (number.getCountryCodeSource()) {
            case FROM_NUMBER_WITH_PLUS_SIGN:
                formattedNumber = format(number, PhoneNumberFormat.INTERNATIONAL);
                break;
            case FROM_NUMBER_WITH_IDD:
                formattedNumber = formatOutOfCountryCallingNumber(number, regionCallingFrom);
                break;
            case FROM_NUMBER_WITHOUT_PLUS_SIGN:
                formattedNumber = format(number, PhoneNumberFormat.INTERNATIONAL).substring(1);
                break;
            default:
                String regionCode = getRegionCodeForCountryCode(number.getCountryCode());
                String nationalPrefix = getNddPrefixForRegion(regionCode, true);
                String nationalFormat = format(number, PhoneNumberFormat.NATIONAL);
                if (nationalPrefix == null || nationalPrefix.length() == 0) {
                    formattedNumber = nationalFormat;
                    break;
                } else if (rawInputContainsNationalPrefix(number.getRawInput(), nationalPrefix, regionCode)) {
                    formattedNumber = nationalFormat;
                    break;
                } else {
                    Phonemetadata.PhoneMetadata metadata = getMetadataForRegion(regionCode);
                    String nationalNumber = getNationalSignificantNumber(number);
                    Phonemetadata.NumberFormat formatRule = chooseFormattingPatternForNumber(metadata.numberFormats(), nationalNumber);
                    if (formatRule == null) {
                        formattedNumber = nationalFormat;
                        break;
                    } else {
                        String candidateNationalPrefixRule = formatRule.getNationalPrefixFormattingRule();
                        int indexOfFirstGroup = candidateNationalPrefixRule.indexOf("$1");
                        if (indexOfFirstGroup <= 0) {
                            formattedNumber = nationalFormat;
                            break;
                        } else if (normalizeDigitsOnly(candidateNationalPrefixRule.substring(0, indexOfFirstGroup)).length() == 0) {
                            formattedNumber = nationalFormat;
                            break;
                        } else {
                            Phonemetadata.NumberFormat numFormatCopy = new Phonemetadata.NumberFormat();
                            numFormatCopy.mergeFrom(formatRule);
                            numFormatCopy.clearNationalPrefixFormattingRule();
                            List<Phonemetadata.NumberFormat> numberFormats = new ArrayList<>(1);
                            numberFormats.add(numFormatCopy);
                            formattedNumber = formatByPattern(number, PhoneNumberFormat.NATIONAL, numberFormats);
                            break;
                        }
                    }
                }
        }
        String rawInput = number.getRawInput();
        if (formattedNumber != null && rawInput.length() > 0) {
            String normalizedFormattedNumber = normalizeDiallableCharsOnly(formattedNumber);
            String normalizedRawInput = normalizeDiallableCharsOnly(rawInput);
            if (!normalizedFormattedNumber.equals(normalizedRawInput)) {
                return rawInput;
            }
            return formattedNumber;
        }
        return formattedNumber;
    }

    private boolean rawInputContainsNationalPrefix(String rawInput, String nationalPrefix, String regionCode) {
        String normalizedNationalNumber = normalizeDigitsOnly(rawInput);
        if (normalizedNationalNumber.startsWith(nationalPrefix)) {
            try {
                return isValidNumber(parse(normalizedNationalNumber.substring(nationalPrefix.length()), regionCode));
            } catch (NumberParseException e) {
                return false;
            }
        }
        return false;
    }

    private boolean hasUnexpectedItalianLeadingZero(Phonenumber.PhoneNumber number) {
        return number.isItalianLeadingZero() && !isLeadingZeroPossible(number.getCountryCode());
    }

    private boolean hasFormattingPatternForNumber(Phonenumber.PhoneNumber number) {
        int countryCallingCode = number.getCountryCode();
        String phoneNumberRegion = getRegionCodeForCountryCode(countryCallingCode);
        Phonemetadata.PhoneMetadata metadata = getMetadataForRegionOrCallingCode(countryCallingCode, phoneNumberRegion);
        if (metadata == null) {
            return false;
        }
        String nationalNumber = getNationalSignificantNumber(number);
        Phonemetadata.NumberFormat formatRule = chooseFormattingPatternForNumber(metadata.numberFormats(), nationalNumber);
        return formatRule != null;
    }

    public String formatOutOfCountryKeepingAlphaChars(Phonenumber.PhoneNumber number, String regionCallingFrom) {
        int firstNationalNumberDigit;
        String rawInput = number.getRawInput();
        if (rawInput.length() == 0) {
            return formatOutOfCountryCallingNumber(number, regionCallingFrom);
        }
        int countryCode = number.getCountryCode();
        if (!hasValidCountryCallingCode(countryCode)) {
            return rawInput;
        }
        String rawInput2 = normalizeHelper(rawInput, ALL_PLUS_NUMBER_GROUPING_SYMBOLS, true);
        String nationalNumber = getNationalSignificantNumber(number);
        if (nationalNumber.length() > 3 && (firstNationalNumberDigit = rawInput2.indexOf(nationalNumber.substring(0, 3))) != -1) {
            rawInput2 = rawInput2.substring(firstNationalNumberDigit);
        }
        Phonemetadata.PhoneMetadata metadataForRegionCallingFrom = getMetadataForRegion(regionCallingFrom);
        if (countryCode == 1) {
            if (isNANPACountry(regionCallingFrom)) {
                String valueOf = String.valueOf(String.valueOf(rawInput2));
                return new StringBuilder(valueOf.length() + 12).append(countryCode).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf).toString();
            }
        } else if (metadataForRegionCallingFrom != null && countryCode == getCountryCodeForValidRegion(regionCallingFrom)) {
            Phonemetadata.NumberFormat formattingPattern = chooseFormattingPatternForNumber(metadataForRegionCallingFrom.numberFormats(), nationalNumber);
            if (formattingPattern == null) {
                return rawInput2;
            }
            Phonemetadata.NumberFormat newFormat = new Phonemetadata.NumberFormat();
            newFormat.mergeFrom(formattingPattern);
            newFormat.setPattern("(\\d+)(.*)");
            newFormat.setFormat("$1$2");
            return formatNsnUsingPattern(rawInput2, newFormat, PhoneNumberFormat.NATIONAL);
        }
        String internationalPrefixForFormatting = "";
        if (metadataForRegionCallingFrom != null) {
            String internationalPrefix = metadataForRegionCallingFrom.getInternationalPrefix();
            internationalPrefixForFormatting = UNIQUE_INTERNATIONAL_PREFIX.matcher(internationalPrefix).matches() ? internationalPrefix : metadataForRegionCallingFrom.getPreferredInternationalPrefix();
        }
        StringBuilder formattedNumber = new StringBuilder(rawInput2);
        String regionCode = getRegionCodeForCountryCode(countryCode);
        Phonemetadata.PhoneMetadata metadataForRegion = getMetadataForRegionOrCallingCode(countryCode, regionCode);
        maybeAppendFormattedExtension(number, metadataForRegion, PhoneNumberFormat.INTERNATIONAL, formattedNumber);
        if (internationalPrefixForFormatting.length() > 0) {
            formattedNumber.insert(0, MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).insert(0, countryCode).insert(0, MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).insert(0, internationalPrefixForFormatting);
        } else {
            Logger logger2 = logger;
            Level level = Level.WARNING;
            String valueOf2 = String.valueOf(String.valueOf(regionCallingFrom));
            logger2.log(level, new StringBuilder(valueOf2.length() + 79).append("Trying to format number from invalid region ").append(valueOf2).append(". International formatting applied.").toString());
            prefixNumberWithCountryCallingCode(countryCode, PhoneNumberFormat.INTERNATIONAL, formattedNumber);
        }
        return formattedNumber.toString();
    }

    public String getNationalSignificantNumber(Phonenumber.PhoneNumber number) {
        StringBuilder nationalNumber = new StringBuilder();
        if (number.isItalianLeadingZero()) {
            char[] zeros = new char[number.getNumberOfLeadingZeros()];
            Arrays.fill(zeros, '0');
            nationalNumber.append(new String(zeros));
        }
        nationalNumber.append(number.getNationalNumber());
        return nationalNumber.toString();
    }

    private void prefixNumberWithCountryCallingCode(int countryCallingCode, PhoneNumberFormat numberFormat, StringBuilder formattedNumber) {
        switch (numberFormat) {
            case E164:
                formattedNumber.insert(0, countryCallingCode).insert(0, PLUS_SIGN);
                return;
            case INTERNATIONAL:
                formattedNumber.insert(0, MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).insert(0, countryCallingCode).insert(0, PLUS_SIGN);
                return;
            case RFC3966:
                formattedNumber.insert(0, "-").insert(0, countryCallingCode).insert(0, PLUS_SIGN).insert(0, RFC3966_PREFIX);
                return;
            default:
                return;
        }
    }

    private String formatNsn(String number, Phonemetadata.PhoneMetadata metadata, PhoneNumberFormat numberFormat) {
        return formatNsn(number, metadata, numberFormat, null);
    }

    private String formatNsn(String number, Phonemetadata.PhoneMetadata metadata, PhoneNumberFormat numberFormat, String carrierCode) {
        List<Phonemetadata.NumberFormat> intlNumberFormats = metadata.intlNumberFormats();
        List<Phonemetadata.NumberFormat> availableFormats = (intlNumberFormats.size() == 0 || numberFormat == PhoneNumberFormat.NATIONAL) ? metadata.numberFormats() : metadata.intlNumberFormats();
        Phonemetadata.NumberFormat formattingPattern = chooseFormattingPatternForNumber(availableFormats, number);
        return formattingPattern == null ? number : formatNsnUsingPattern(number, formattingPattern, numberFormat, carrierCode);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Phonemetadata.NumberFormat chooseFormattingPatternForNumber(List<Phonemetadata.NumberFormat> availableFormats, String nationalNumber) {
        for (Phonemetadata.NumberFormat numFormat : availableFormats) {
            int size = numFormat.leadingDigitsPatternSize();
            if (size == 0 || this.regexCache.getPatternForRegex(numFormat.getLeadingDigitsPattern(size - 1)).matcher(nationalNumber).lookingAt()) {
                Matcher m = this.regexCache.getPatternForRegex(numFormat.getPattern()).matcher(nationalNumber);
                if (m.matches()) {
                    return numFormat;
                }
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String formatNsnUsingPattern(String nationalNumber, Phonemetadata.NumberFormat formattingPattern, PhoneNumberFormat numberFormat) {
        return formatNsnUsingPattern(nationalNumber, formattingPattern, numberFormat, null);
    }

    private String formatNsnUsingPattern(String nationalNumber, Phonemetadata.NumberFormat formattingPattern, PhoneNumberFormat numberFormat, String carrierCode) {
        String formattedNationalNumber;
        String numberFormatRule = formattingPattern.getFormat();
        Matcher m = this.regexCache.getPatternForRegex(formattingPattern.getPattern()).matcher(nationalNumber);
        if (numberFormat == PhoneNumberFormat.NATIONAL && carrierCode != null && carrierCode.length() > 0 && formattingPattern.getDomesticCarrierCodeFormattingRule().length() > 0) {
            String carrierCodeFormattingRule = formattingPattern.getDomesticCarrierCodeFormattingRule();
            formattedNationalNumber = m.replaceAll(FIRST_GROUP_PATTERN.matcher(numberFormatRule).replaceFirst(CC_PATTERN.matcher(carrierCodeFormattingRule).replaceFirst(carrierCode)));
        } else {
            String nationalPrefixFormattingRule = formattingPattern.getNationalPrefixFormattingRule();
            if (numberFormat == PhoneNumberFormat.NATIONAL && nationalPrefixFormattingRule != null && nationalPrefixFormattingRule.length() > 0) {
                Matcher firstGroupMatcher = FIRST_GROUP_PATTERN.matcher(numberFormatRule);
                formattedNationalNumber = m.replaceAll(firstGroupMatcher.replaceFirst(nationalPrefixFormattingRule));
            } else {
                formattedNationalNumber = m.replaceAll(numberFormatRule);
            }
        }
        if (numberFormat == PhoneNumberFormat.RFC3966) {
            Matcher matcher = SEPARATOR_PATTERN.matcher(formattedNationalNumber);
            if (matcher.lookingAt()) {
                formattedNationalNumber = matcher.replaceFirst("");
            }
            return matcher.reset(formattedNationalNumber).replaceAll("-");
        }
        return formattedNationalNumber;
    }

    public Phonenumber.PhoneNumber getExampleNumber(String regionCode) {
        return getExampleNumberForType(regionCode, PhoneNumberType.FIXED_LINE);
    }

    public Phonenumber.PhoneNumber getExampleNumberForType(String regionCode, PhoneNumberType type) {
        if (!isValidRegionCode(regionCode)) {
            Logger logger2 = logger;
            Level level = Level.WARNING;
            String valueOf = String.valueOf(regionCode);
            logger2.log(level, valueOf.length() != 0 ? "Invalid or unknown region code provided: ".concat(valueOf) : new String("Invalid or unknown region code provided: "));
            return null;
        }
        Phonemetadata.PhoneNumberDesc desc = getNumberDescByType(getMetadataForRegion(regionCode), type);
        try {
            if (desc.hasExampleNumber()) {
                return parse(desc.getExampleNumber(), regionCode);
            }
        } catch (NumberParseException e) {
            logger.log(Level.SEVERE, e.toString());
        }
        return null;
    }

    public Phonenumber.PhoneNumber getExampleNumberForNonGeoEntity(int countryCallingCode) {
        Phonemetadata.PhoneMetadata metadata = getMetadataForNonGeographicalRegion(countryCallingCode);
        if (metadata != null) {
            Phonemetadata.PhoneNumberDesc desc = metadata.getGeneralDesc();
            try {
                if (desc.hasExampleNumber()) {
                    String valueOf = String.valueOf(String.valueOf(desc.getExampleNumber()));
                    return parse(new StringBuilder(valueOf.length() + 12).append(Marker.ANY_NON_NULL_MARKER).append(countryCallingCode).append(valueOf).toString(), UNKNOWN_REGION);
                }
            } catch (NumberParseException e) {
                logger.log(Level.SEVERE, e.toString());
            }
        } else {
            logger.log(Level.WARNING, new StringBuilder(61).append("Invalid or unknown country calling code provided: ").append(countryCallingCode).toString());
        }
        return null;
    }

    private void maybeAppendFormattedExtension(Phonenumber.PhoneNumber number, Phonemetadata.PhoneMetadata metadata, PhoneNumberFormat numberFormat, StringBuilder formattedNumber) {
        if (number.hasExtension() && number.getExtension().length() > 0) {
            if (numberFormat == PhoneNumberFormat.RFC3966) {
                formattedNumber.append(RFC3966_EXTN_PREFIX).append(number.getExtension());
            } else if (metadata.hasPreferredExtnPrefix()) {
                formattedNumber.append(metadata.getPreferredExtnPrefix()).append(number.getExtension());
            } else {
                formattedNumber.append(DEFAULT_EXTN_PREFIX).append(number.getExtension());
            }
        }
    }

    Phonemetadata.PhoneNumberDesc getNumberDescByType(Phonemetadata.PhoneMetadata metadata, PhoneNumberType type) {
        switch (type) {
            case PREMIUM_RATE:
                return metadata.getPremiumRate();
            case TOLL_FREE:
                return metadata.getTollFree();
            case MOBILE:
                return metadata.getMobile();
            case FIXED_LINE:
            case FIXED_LINE_OR_MOBILE:
                return metadata.getFixedLine();
            case SHARED_COST:
                return metadata.getSharedCost();
            case VOIP:
                return metadata.getVoip();
            case PERSONAL_NUMBER:
                return metadata.getPersonalNumber();
            case PAGER:
                return metadata.getPager();
            case UAN:
                return metadata.getUan();
            case VOICEMAIL:
                return metadata.getVoicemail();
            default:
                return metadata.getGeneralDesc();
        }
    }

    public PhoneNumberType getNumberType(Phonenumber.PhoneNumber number) {
        String regionCode = getRegionCodeForNumber(number);
        Phonemetadata.PhoneMetadata metadata = getMetadataForRegionOrCallingCode(number.getCountryCode(), regionCode);
        if (metadata == null) {
            return PhoneNumberType.UNKNOWN;
        }
        String nationalSignificantNumber = getNationalSignificantNumber(number);
        return getNumberTypeHelper(nationalSignificantNumber, metadata);
    }

    private PhoneNumberType getNumberTypeHelper(String nationalNumber, Phonemetadata.PhoneMetadata metadata) {
        if (!isNumberMatchingDesc(nationalNumber, metadata.getGeneralDesc())) {
            return PhoneNumberType.UNKNOWN;
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getPremiumRate())) {
            return PhoneNumberType.PREMIUM_RATE;
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getTollFree())) {
            return PhoneNumberType.TOLL_FREE;
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getSharedCost())) {
            return PhoneNumberType.SHARED_COST;
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getVoip())) {
            return PhoneNumberType.VOIP;
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getPersonalNumber())) {
            return PhoneNumberType.PERSONAL_NUMBER;
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getPager())) {
            return PhoneNumberType.PAGER;
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getUan())) {
            return PhoneNumberType.UAN;
        }
        if (isNumberMatchingDesc(nationalNumber, metadata.getVoicemail())) {
            return PhoneNumberType.VOICEMAIL;
        }
        boolean isFixedLine = isNumberMatchingDesc(nationalNumber, metadata.getFixedLine());
        if (isFixedLine) {
            if (metadata.isSameMobileAndFixedLinePattern()) {
                return PhoneNumberType.FIXED_LINE_OR_MOBILE;
            }
            if (isNumberMatchingDesc(nationalNumber, metadata.getMobile())) {
                return PhoneNumberType.FIXED_LINE_OR_MOBILE;
            }
            return PhoneNumberType.FIXED_LINE;
        } else if (!metadata.isSameMobileAndFixedLinePattern() && isNumberMatchingDesc(nationalNumber, metadata.getMobile())) {
            return PhoneNumberType.MOBILE;
        } else {
            return PhoneNumberType.UNKNOWN;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Phonemetadata.PhoneMetadata getMetadataForRegion(String regionCode) {
        if (!isValidRegionCode(regionCode)) {
            return null;
        }
        synchronized (this.regionToMetadataMap) {
            if (!this.regionToMetadataMap.containsKey(regionCode)) {
                loadMetadataFromFile(this.currentFilePrefix, regionCode, 0, this.metadataLoader);
            }
        }
        return this.regionToMetadataMap.get(regionCode);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Phonemetadata.PhoneMetadata getMetadataForNonGeographicalRegion(int countryCallingCode) {
        synchronized (this.countryCodeToNonGeographicalMetadataMap) {
            if (!this.countryCallingCodeToRegionCodeMap.containsKey(Integer.valueOf(countryCallingCode))) {
                return null;
            }
            if (!this.countryCodeToNonGeographicalMetadataMap.containsKey(Integer.valueOf(countryCallingCode))) {
                loadMetadataFromFile(this.currentFilePrefix, REGION_CODE_FOR_NON_GEO_ENTITY, countryCallingCode, this.metadataLoader);
            }
            return this.countryCodeToNonGeographicalMetadataMap.get(Integer.valueOf(countryCallingCode));
        }
    }

    boolean isNumberPossibleForDesc(String nationalNumber, Phonemetadata.PhoneNumberDesc numberDesc) {
        Matcher possibleNumberPatternMatcher = this.regexCache.getPatternForRegex(numberDesc.getPossibleNumberPattern()).matcher(nationalNumber);
        return possibleNumberPatternMatcher.matches();
    }

    boolean isNumberMatchingDesc(String nationalNumber, Phonemetadata.PhoneNumberDesc numberDesc) {
        Matcher nationalNumberPatternMatcher = this.regexCache.getPatternForRegex(numberDesc.getNationalNumberPattern()).matcher(nationalNumber);
        return isNumberPossibleForDesc(nationalNumber, numberDesc) && nationalNumberPatternMatcher.matches();
    }

    public boolean isValidNumber(Phonenumber.PhoneNumber number) {
        String regionCode = getRegionCodeForNumber(number);
        return isValidNumberForRegion(number, regionCode);
    }

    public boolean isValidNumberForRegion(Phonenumber.PhoneNumber number, String regionCode) {
        int countryCode = number.getCountryCode();
        Phonemetadata.PhoneMetadata metadata = getMetadataForRegionOrCallingCode(countryCode, regionCode);
        if (metadata != null) {
            if (!REGION_CODE_FOR_NON_GEO_ENTITY.equals(regionCode) && countryCode != getCountryCodeForValidRegion(regionCode)) {
                return false;
            }
            String nationalSignificantNumber = getNationalSignificantNumber(number);
            return getNumberTypeHelper(nationalSignificantNumber, metadata) != PhoneNumberType.UNKNOWN;
        }
        return false;
    }

    public String getRegionCodeForNumber(Phonenumber.PhoneNumber number) {
        int countryCode = number.getCountryCode();
        List<String> regions = this.countryCallingCodeToRegionCodeMap.get(Integer.valueOf(countryCode));
        if (regions == null) {
            String numberString = getNationalSignificantNumber(number);
            Logger logger2 = logger;
            Level level = Level.WARNING;
            String valueOf = String.valueOf(String.valueOf(numberString));
            logger2.log(level, new StringBuilder(valueOf.length() + 54).append("Missing/invalid country_code (").append(countryCode).append(") for number ").append(valueOf).toString());
            return null;
        } else if (regions.size() == 1) {
            return regions.get(0);
        } else {
            return getRegionCodeForNumberFromRegionList(number, regions);
        }
    }

    private String getRegionCodeForNumberFromRegionList(Phonenumber.PhoneNumber number, List<String> regionCodes) {
        String nationalNumber = getNationalSignificantNumber(number);
        for (String regionCode : regionCodes) {
            Phonemetadata.PhoneMetadata metadata = getMetadataForRegion(regionCode);
            if (metadata.hasLeadingDigits()) {
                if (this.regexCache.getPatternForRegex(metadata.getLeadingDigits()).matcher(nationalNumber).lookingAt()) {
                    return regionCode;
                }
            } else if (getNumberTypeHelper(nationalNumber, metadata) != PhoneNumberType.UNKNOWN) {
                return regionCode;
            }
        }
        return null;
    }

    public String getRegionCodeForCountryCode(int countryCallingCode) {
        List<String> regionCodes = this.countryCallingCodeToRegionCodeMap.get(Integer.valueOf(countryCallingCode));
        return regionCodes == null ? UNKNOWN_REGION : regionCodes.get(0);
    }

    public List<String> getRegionCodesForCountryCode(int countryCallingCode) {
        List<String> regionCodes = this.countryCallingCodeToRegionCodeMap.get(Integer.valueOf(countryCallingCode));
        if (regionCodes == null) {
            regionCodes = new ArrayList<>(0);
        }
        return Collections.unmodifiableList(regionCodes);
    }

    public int getCountryCodeForRegion(String regionCode) {
        if (!isValidRegionCode(regionCode)) {
            Logger logger2 = logger;
            Level level = Level.WARNING;
            if (regionCode == null) {
                regionCode = "null";
            }
            String valueOf = String.valueOf(String.valueOf(regionCode));
            logger2.log(level, new StringBuilder(valueOf.length() + 43).append("Invalid or missing region code (").append(valueOf).append(") provided.").toString());
            return 0;
        }
        return getCountryCodeForValidRegion(regionCode);
    }

    private int getCountryCodeForValidRegion(String regionCode) {
        Phonemetadata.PhoneMetadata metadata = getMetadataForRegion(regionCode);
        if (metadata == null) {
            String valueOf = String.valueOf(regionCode);
            throw new IllegalArgumentException(valueOf.length() != 0 ? "Invalid region code: ".concat(valueOf) : new String("Invalid region code: "));
        }
        return metadata.getCountryCode();
    }

    public String getNddPrefixForRegion(String regionCode, boolean stripNonDigits) {
        Phonemetadata.PhoneMetadata metadata = getMetadataForRegion(regionCode);
        if (metadata == null) {
            Logger logger2 = logger;
            Level level = Level.WARNING;
            if (regionCode == null) {
                regionCode = "null";
            }
            String valueOf = String.valueOf(String.valueOf(regionCode));
            logger2.log(level, new StringBuilder(valueOf.length() + 43).append("Invalid or missing region code (").append(valueOf).append(") provided.").toString());
            return null;
        }
        String nationalPrefix = metadata.getNationalPrefix();
        if (nationalPrefix.length() == 0) {
            return null;
        }
        if (stripNonDigits) {
            return nationalPrefix.replace("~", "");
        }
        return nationalPrefix;
    }

    public boolean isNANPACountry(String regionCode) {
        return this.nanpaRegions.contains(regionCode);
    }

    boolean isLeadingZeroPossible(int countryCallingCode) {
        Phonemetadata.PhoneMetadata mainMetadataForCallingCode = getMetadataForRegionOrCallingCode(countryCallingCode, getRegionCodeForCountryCode(countryCallingCode));
        if (mainMetadataForCallingCode == null) {
            return false;
        }
        return mainMetadataForCallingCode.isLeadingZeroPossible();
    }

    public boolean isAlphaNumber(String number) {
        if (!isViablePhoneNumber(number)) {
            return false;
        }
        StringBuilder strippedNumber = new StringBuilder(number);
        maybeStripExtension(strippedNumber);
        return VALID_ALPHA_PHONE_PATTERN.matcher(strippedNumber).matches();
    }

    public boolean isPossibleNumber(Phonenumber.PhoneNumber number) {
        return isPossibleNumberWithReason(number) == ValidationResult.IS_POSSIBLE;
    }

    private ValidationResult testNumberLengthAgainstPattern(Pattern numberPattern, String number) {
        Matcher numberMatcher = numberPattern.matcher(number);
        if (numberMatcher.matches()) {
            return ValidationResult.IS_POSSIBLE;
        }
        if (numberMatcher.lookingAt()) {
            return ValidationResult.TOO_LONG;
        }
        return ValidationResult.TOO_SHORT;
    }

    private boolean isShorterThanPossibleNormalNumber(Phonemetadata.PhoneMetadata regionMetadata, String number) {
        Pattern possibleNumberPattern = this.regexCache.getPatternForRegex(regionMetadata.getGeneralDesc().getPossibleNumberPattern());
        return testNumberLengthAgainstPattern(possibleNumberPattern, number) == ValidationResult.TOO_SHORT;
    }

    public ValidationResult isPossibleNumberWithReason(Phonenumber.PhoneNumber number) {
        String nationalNumber = getNationalSignificantNumber(number);
        int countryCode = number.getCountryCode();
        if (!hasValidCountryCallingCode(countryCode)) {
            return ValidationResult.INVALID_COUNTRY_CODE;
        }
        String regionCode = getRegionCodeForCountryCode(countryCode);
        Phonemetadata.PhoneMetadata metadata = getMetadataForRegionOrCallingCode(countryCode, regionCode);
        Pattern possibleNumberPattern = this.regexCache.getPatternForRegex(metadata.getGeneralDesc().getPossibleNumberPattern());
        return testNumberLengthAgainstPattern(possibleNumberPattern, nationalNumber);
    }

    public boolean isPossibleNumber(String number, String regionDialingFrom) {
        try {
            return isPossibleNumber(parse(number, regionDialingFrom));
        } catch (NumberParseException e) {
            return false;
        }
    }

    public boolean truncateTooLongNumber(Phonenumber.PhoneNumber number) {
        if (isValidNumber(number)) {
            return true;
        }
        Phonenumber.PhoneNumber numberCopy = new Phonenumber.PhoneNumber();
        numberCopy.mergeFrom(number);
        long nationalNumber = number.getNationalNumber();
        do {
            nationalNumber /= 10;
            numberCopy.setNationalNumber(nationalNumber);
            if (isPossibleNumberWithReason(numberCopy) == ValidationResult.TOO_SHORT || nationalNumber == 0) {
                return false;
            }
        } while (!isValidNumber(numberCopy));
        number.setNationalNumber(nationalNumber);
        return true;
    }

    public AsYouTypeFormatter getAsYouTypeFormatter(String regionCode) {
        return new AsYouTypeFormatter(regionCode);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int extractCountryCode(StringBuilder fullNumber, StringBuilder nationalNumber) {
        if (fullNumber.length() == 0 || fullNumber.charAt(0) == '0') {
            return 0;
        }
        int numberLength = fullNumber.length();
        for (int i = 1; i <= 3 && i <= numberLength; i++) {
            int potentialCountryCode = Integer.parseInt(fullNumber.substring(0, i));
            if (this.countryCallingCodeToRegionCodeMap.containsKey(Integer.valueOf(potentialCountryCode))) {
                nationalNumber.append(fullNumber.substring(i));
                return potentialCountryCode;
            }
        }
        return 0;
    }

    int maybeExtractCountryCode(String number, Phonemetadata.PhoneMetadata defaultRegionMetadata, StringBuilder nationalNumber, boolean keepRawInput, Phonenumber.PhoneNumber phoneNumber) throws NumberParseException {
        if (number.length() == 0) {
            return 0;
        }
        StringBuilder fullNumber = new StringBuilder(number);
        String possibleCountryIddPrefix = "NonMatch";
        if (defaultRegionMetadata != null) {
            possibleCountryIddPrefix = defaultRegionMetadata.getInternationalPrefix();
        }
        Phonenumber.PhoneNumber.CountryCodeSource countryCodeSource = maybeStripInternationalPrefixAndNormalize(fullNumber, possibleCountryIddPrefix);
        if (keepRawInput) {
            phoneNumber.setCountryCodeSource(countryCodeSource);
        }
        if (countryCodeSource != Phonenumber.PhoneNumber.CountryCodeSource.FROM_DEFAULT_COUNTRY) {
            if (fullNumber.length() <= 2) {
                throw new NumberParseException(NumberParseException.ErrorType.TOO_SHORT_AFTER_IDD, "Phone number had an IDD, but after this was not long enough to be a viable phone number.");
            }
            int potentialCountryCode = extractCountryCode(fullNumber, nationalNumber);
            if (potentialCountryCode != 0) {
                phoneNumber.setCountryCode(potentialCountryCode);
                return potentialCountryCode;
            }
            throw new NumberParseException(NumberParseException.ErrorType.INVALID_COUNTRY_CODE, "Country calling code supplied was not recognised.");
        }
        if (defaultRegionMetadata != null) {
            int defaultCountryCode = defaultRegionMetadata.getCountryCode();
            String defaultCountryCodeString = String.valueOf(defaultCountryCode);
            String normalizedNumber = fullNumber.toString();
            if (normalizedNumber.startsWith(defaultCountryCodeString)) {
                StringBuilder potentialNationalNumber = new StringBuilder(normalizedNumber.substring(defaultCountryCodeString.length()));
                Phonemetadata.PhoneNumberDesc generalDesc = defaultRegionMetadata.getGeneralDesc();
                Pattern validNumberPattern = this.regexCache.getPatternForRegex(generalDesc.getNationalNumberPattern());
                maybeStripNationalPrefixAndCarrierCode(potentialNationalNumber, defaultRegionMetadata, null);
                Pattern possibleNumberPattern = this.regexCache.getPatternForRegex(generalDesc.getPossibleNumberPattern());
                if ((!validNumberPattern.matcher(fullNumber).matches() && validNumberPattern.matcher(potentialNationalNumber).matches()) || testNumberLengthAgainstPattern(possibleNumberPattern, fullNumber.toString()) == ValidationResult.TOO_LONG) {
                    nationalNumber.append((CharSequence) potentialNationalNumber);
                    if (keepRawInput) {
                        phoneNumber.setCountryCodeSource(Phonenumber.PhoneNumber.CountryCodeSource.FROM_NUMBER_WITHOUT_PLUS_SIGN);
                    }
                    phoneNumber.setCountryCode(defaultCountryCode);
                    return defaultCountryCode;
                }
            }
        }
        phoneNumber.setCountryCode(0);
        return 0;
    }

    private boolean parsePrefixAsIdd(Pattern iddPattern, StringBuilder number) {
        Matcher m = iddPattern.matcher(number);
        if (m.lookingAt()) {
            int matchEnd = m.end();
            Matcher digitMatcher = CAPTURING_DIGIT_PATTERN.matcher(number.substring(matchEnd));
            if (digitMatcher.find()) {
                String normalizedGroup = normalizeDigitsOnly(digitMatcher.group(1));
                if (normalizedGroup.equals(AppEventsConstants.EVENT_PARAM_VALUE_NO)) {
                    return false;
                }
            }
            number.delete(0, matchEnd);
            return true;
        }
        return false;
    }

    Phonenumber.PhoneNumber.CountryCodeSource maybeStripInternationalPrefixAndNormalize(StringBuilder number, String possibleIddPrefix) {
        if (number.length() == 0) {
            return Phonenumber.PhoneNumber.CountryCodeSource.FROM_DEFAULT_COUNTRY;
        }
        Matcher m = PLUS_CHARS_PATTERN.matcher(number);
        if (m.lookingAt()) {
            number.delete(0, m.end());
            normalize(number);
            return Phonenumber.PhoneNumber.CountryCodeSource.FROM_NUMBER_WITH_PLUS_SIGN;
        }
        Pattern iddPattern = this.regexCache.getPatternForRegex(possibleIddPrefix);
        normalize(number);
        return parsePrefixAsIdd(iddPattern, number) ? Phonenumber.PhoneNumber.CountryCodeSource.FROM_NUMBER_WITH_IDD : Phonenumber.PhoneNumber.CountryCodeSource.FROM_DEFAULT_COUNTRY;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean maybeStripNationalPrefixAndCarrierCode(StringBuilder number, Phonemetadata.PhoneMetadata metadata, StringBuilder carrierCode) {
        int numberLength = number.length();
        String possibleNationalPrefix = metadata.getNationalPrefixForParsing();
        if (numberLength == 0 || possibleNationalPrefix.length() == 0) {
            return false;
        }
        Matcher prefixMatcher = this.regexCache.getPatternForRegex(possibleNationalPrefix).matcher(number);
        if (!prefixMatcher.lookingAt()) {
            return false;
        }
        Pattern nationalNumberRule = this.regexCache.getPatternForRegex(metadata.getGeneralDesc().getNationalNumberPattern());
        boolean isViableOriginalNumber = nationalNumberRule.matcher(number).matches();
        int numOfGroups = prefixMatcher.groupCount();
        String transformRule = metadata.getNationalPrefixTransformRule();
        if (transformRule == null || transformRule.length() == 0 || prefixMatcher.group(numOfGroups) == null) {
            if (isViableOriginalNumber && !nationalNumberRule.matcher(number.substring(prefixMatcher.end())).matches()) {
                return false;
            }
            if (carrierCode != null && numOfGroups > 0 && prefixMatcher.group(numOfGroups) != null) {
                carrierCode.append(prefixMatcher.group(1));
            }
            number.delete(0, prefixMatcher.end());
            return true;
        }
        StringBuilder transformedNumber = new StringBuilder(number);
        transformedNumber.replace(0, numberLength, prefixMatcher.replaceFirst(transformRule));
        if (isViableOriginalNumber && !nationalNumberRule.matcher(transformedNumber.toString()).matches()) {
            return false;
        }
        if (carrierCode != null && numOfGroups > 1) {
            carrierCode.append(prefixMatcher.group(1));
        }
        number.replace(0, number.length(), transformedNumber.toString());
        return true;
    }

    String maybeStripExtension(StringBuilder number) {
        Matcher m = EXTN_PATTERN.matcher(number);
        if (m.find() && isViablePhoneNumber(number.substring(0, m.start()))) {
            int length = m.groupCount();
            for (int i = 1; i <= length; i++) {
                if (m.group(i) != null) {
                    String extension = m.group(i);
                    number.delete(m.start(), number.length());
                    return extension;
                }
            }
        }
        return "";
    }

    private boolean checkRegionForParsing(String numberToParse, String defaultRegion) {
        return isValidRegionCode(defaultRegion) || !(numberToParse == null || numberToParse.length() == 0 || !PLUS_CHARS_PATTERN.matcher(numberToParse).lookingAt());
    }

    public Phonenumber.PhoneNumber parse(String numberToParse, String defaultRegion) throws NumberParseException {
        Phonenumber.PhoneNumber phoneNumber = new Phonenumber.PhoneNumber();
        parse(numberToParse, defaultRegion, phoneNumber);
        return phoneNumber;
    }

    public void parse(String numberToParse, String defaultRegion, Phonenumber.PhoneNumber phoneNumber) throws NumberParseException {
        parseHelper(numberToParse, defaultRegion, false, true, phoneNumber);
    }

    public Phonenumber.PhoneNumber parseAndKeepRawInput(String numberToParse, String defaultRegion) throws NumberParseException {
        Phonenumber.PhoneNumber phoneNumber = new Phonenumber.PhoneNumber();
        parseAndKeepRawInput(numberToParse, defaultRegion, phoneNumber);
        return phoneNumber;
    }

    public void parseAndKeepRawInput(String numberToParse, String defaultRegion, Phonenumber.PhoneNumber phoneNumber) throws NumberParseException {
        parseHelper(numberToParse, defaultRegion, true, true, phoneNumber);
    }

    public Iterable<PhoneNumberMatch> findNumbers(CharSequence text, String defaultRegion) {
        return findNumbers(text, defaultRegion, Leniency.VALID, Long.MAX_VALUE);
    }

    public Iterable<PhoneNumberMatch> findNumbers(final CharSequence text, final String defaultRegion, final Leniency leniency, final long maxTries) {
        return new Iterable<PhoneNumberMatch>() { // from class: com.google.i18n.phonenumbers.PhoneNumberUtil.2
            @Override // java.lang.Iterable
            public Iterator<PhoneNumberMatch> iterator() {
                return new PhoneNumberMatcher(PhoneNumberUtil.this, text, defaultRegion, leniency, maxTries);
            }
        };
    }

    static void setItalianLeadingZerosForPhoneNumber(String nationalNumber, Phonenumber.PhoneNumber phoneNumber) {
        if (nationalNumber.length() > 1 && nationalNumber.charAt(0) == '0') {
            phoneNumber.setItalianLeadingZero(true);
            int numberOfLeadingZeros = 1;
            while (numberOfLeadingZeros < nationalNumber.length() - 1 && nationalNumber.charAt(numberOfLeadingZeros) == '0') {
                numberOfLeadingZeros++;
            }
            if (numberOfLeadingZeros != 1) {
                phoneNumber.setNumberOfLeadingZeros(numberOfLeadingZeros);
            }
        }
    }

    private void parseHelper(String numberToParse, String defaultRegion, boolean keepRawInput, boolean checkRegion, Phonenumber.PhoneNumber phoneNumber) throws NumberParseException {
        int countryCode;
        if (numberToParse == null) {
            throw new NumberParseException(NumberParseException.ErrorType.NOT_A_NUMBER, "The phone number supplied was null.");
        }
        if (numberToParse.length() > 250) {
            throw new NumberParseException(NumberParseException.ErrorType.TOO_LONG, "The string supplied was too long to parse.");
        }
        StringBuilder nationalNumber = new StringBuilder();
        buildNationalNumberForParsing(numberToParse, nationalNumber);
        if (!isViablePhoneNumber(nationalNumber.toString())) {
            throw new NumberParseException(NumberParseException.ErrorType.NOT_A_NUMBER, "The string supplied did not seem to be a phone number.");
        }
        if (checkRegion && !checkRegionForParsing(nationalNumber.toString(), defaultRegion)) {
            throw new NumberParseException(NumberParseException.ErrorType.INVALID_COUNTRY_CODE, "Missing or invalid default region.");
        }
        if (keepRawInput) {
            phoneNumber.setRawInput(numberToParse);
        }
        String extension = maybeStripExtension(nationalNumber);
        if (extension.length() > 0) {
            phoneNumber.setExtension(extension);
        }
        Phonemetadata.PhoneMetadata regionMetadata = getMetadataForRegion(defaultRegion);
        StringBuilder normalizedNationalNumber = new StringBuilder();
        try {
            countryCode = maybeExtractCountryCode(nationalNumber.toString(), regionMetadata, normalizedNationalNumber, keepRawInput, phoneNumber);
        } catch (NumberParseException e) {
            Matcher matcher = PLUS_CHARS_PATTERN.matcher(nationalNumber.toString());
            if (e.getErrorType() == NumberParseException.ErrorType.INVALID_COUNTRY_CODE && matcher.lookingAt()) {
                countryCode = maybeExtractCountryCode(nationalNumber.substring(matcher.end()), regionMetadata, normalizedNationalNumber, keepRawInput, phoneNumber);
                if (countryCode == 0) {
                    throw new NumberParseException(NumberParseException.ErrorType.INVALID_COUNTRY_CODE, "Could not interpret numbers after plus-sign.");
                }
            } else {
                throw new NumberParseException(e.getErrorType(), e.getMessage());
            }
        }
        if (countryCode != 0) {
            String phoneNumberRegion = getRegionCodeForCountryCode(countryCode);
            if (!phoneNumberRegion.equals(defaultRegion)) {
                regionMetadata = getMetadataForRegionOrCallingCode(countryCode, phoneNumberRegion);
            }
        } else {
            normalize(nationalNumber);
            normalizedNationalNumber.append((CharSequence) nationalNumber);
            if (defaultRegion != null) {
                phoneNumber.setCountryCode(regionMetadata.getCountryCode());
            } else if (keepRawInput) {
                phoneNumber.clearCountryCodeSource();
            }
        }
        if (normalizedNationalNumber.length() < 2) {
            throw new NumberParseException(NumberParseException.ErrorType.TOO_SHORT_NSN, "The string supplied is too short to be a phone number.");
        }
        if (regionMetadata != null) {
            StringBuilder carrierCode = new StringBuilder();
            StringBuilder potentialNationalNumber = new StringBuilder(normalizedNationalNumber);
            maybeStripNationalPrefixAndCarrierCode(potentialNationalNumber, regionMetadata, carrierCode);
            if (!isShorterThanPossibleNormalNumber(regionMetadata, potentialNationalNumber.toString())) {
                normalizedNationalNumber = potentialNationalNumber;
                if (keepRawInput) {
                    phoneNumber.setPreferredDomesticCarrierCode(carrierCode.toString());
                }
            }
        }
        int lengthOfNationalNumber = normalizedNationalNumber.length();
        if (lengthOfNationalNumber < 2) {
            throw new NumberParseException(NumberParseException.ErrorType.TOO_SHORT_NSN, "The string supplied is too short to be a phone number.");
        }
        if (lengthOfNationalNumber > 17) {
            throw new NumberParseException(NumberParseException.ErrorType.TOO_LONG, "The string supplied is too long to be a phone number.");
        }
        setItalianLeadingZerosForPhoneNumber(normalizedNationalNumber.toString(), phoneNumber);
        phoneNumber.setNationalNumber(Long.parseLong(normalizedNationalNumber.toString()));
    }

    private void buildNationalNumberForParsing(String numberToParse, StringBuilder nationalNumber) {
        int indexOfPhoneContext = numberToParse.indexOf(RFC3966_PHONE_CONTEXT);
        if (indexOfPhoneContext > 0) {
            int phoneContextStart = indexOfPhoneContext + RFC3966_PHONE_CONTEXT.length();
            if (numberToParse.charAt(phoneContextStart) == '+') {
                int phoneContextEnd = numberToParse.indexOf(59, phoneContextStart);
                if (phoneContextEnd > 0) {
                    nationalNumber.append(numberToParse.substring(phoneContextStart, phoneContextEnd));
                } else {
                    nationalNumber.append(numberToParse.substring(phoneContextStart));
                }
            }
            int indexOfRfc3966Prefix = numberToParse.indexOf(RFC3966_PREFIX);
            int indexOfNationalNumber = indexOfRfc3966Prefix >= 0 ? indexOfRfc3966Prefix + RFC3966_PREFIX.length() : 0;
            nationalNumber.append(numberToParse.substring(indexOfNationalNumber, indexOfPhoneContext));
        } else {
            nationalNumber.append(extractPossibleNumber(numberToParse));
        }
        int indexOfIsdn = nationalNumber.indexOf(RFC3966_ISDN_SUBADDRESS);
        if (indexOfIsdn > 0) {
            nationalNumber.delete(indexOfIsdn, nationalNumber.length());
        }
    }

    public MatchType isNumberMatch(Phonenumber.PhoneNumber firstNumberIn, Phonenumber.PhoneNumber secondNumberIn) {
        Phonenumber.PhoneNumber firstNumber = new Phonenumber.PhoneNumber();
        firstNumber.mergeFrom(firstNumberIn);
        Phonenumber.PhoneNumber secondNumber = new Phonenumber.PhoneNumber();
        secondNumber.mergeFrom(secondNumberIn);
        firstNumber.clearRawInput();
        firstNumber.clearCountryCodeSource();
        firstNumber.clearPreferredDomesticCarrierCode();
        secondNumber.clearRawInput();
        secondNumber.clearCountryCodeSource();
        secondNumber.clearPreferredDomesticCarrierCode();
        if (firstNumber.hasExtension() && firstNumber.getExtension().length() == 0) {
            firstNumber.clearExtension();
        }
        if (secondNumber.hasExtension() && secondNumber.getExtension().length() == 0) {
            secondNumber.clearExtension();
        }
        if (firstNumber.hasExtension() && secondNumber.hasExtension() && !firstNumber.getExtension().equals(secondNumber.getExtension())) {
            return MatchType.NO_MATCH;
        }
        int firstNumberCountryCode = firstNumber.getCountryCode();
        int secondNumberCountryCode = secondNumber.getCountryCode();
        if (firstNumberCountryCode != 0 && secondNumberCountryCode != 0) {
            if (firstNumber.exactlySameAs(secondNumber)) {
                return MatchType.EXACT_MATCH;
            }
            if (firstNumberCountryCode == secondNumberCountryCode && isNationalNumberSuffixOfTheOther(firstNumber, secondNumber)) {
                return MatchType.SHORT_NSN_MATCH;
            }
            return MatchType.NO_MATCH;
        }
        firstNumber.setCountryCode(secondNumberCountryCode);
        if (firstNumber.exactlySameAs(secondNumber)) {
            return MatchType.NSN_MATCH;
        }
        if (isNationalNumberSuffixOfTheOther(firstNumber, secondNumber)) {
            return MatchType.SHORT_NSN_MATCH;
        }
        return MatchType.NO_MATCH;
    }

    private boolean isNationalNumberSuffixOfTheOther(Phonenumber.PhoneNumber firstNumber, Phonenumber.PhoneNumber secondNumber) {
        String firstNumberNationalNumber = String.valueOf(firstNumber.getNationalNumber());
        String secondNumberNationalNumber = String.valueOf(secondNumber.getNationalNumber());
        return firstNumberNationalNumber.endsWith(secondNumberNationalNumber) || secondNumberNationalNumber.endsWith(firstNumberNationalNumber);
    }

    public MatchType isNumberMatch(String firstNumber, String secondNumber) {
        try {
            Phonenumber.PhoneNumber firstNumberAsProto = parse(firstNumber, UNKNOWN_REGION);
            return isNumberMatch(firstNumberAsProto, secondNumber);
        } catch (NumberParseException e) {
            if (e.getErrorType() == NumberParseException.ErrorType.INVALID_COUNTRY_CODE) {
                try {
                    Phonenumber.PhoneNumber secondNumberAsProto = parse(secondNumber, UNKNOWN_REGION);
                    return isNumberMatch(secondNumberAsProto, firstNumber);
                } catch (NumberParseException e2) {
                    if (e2.getErrorType() == NumberParseException.ErrorType.INVALID_COUNTRY_CODE) {
                        try {
                            Phonenumber.PhoneNumber firstNumberProto = new Phonenumber.PhoneNumber();
                            Phonenumber.PhoneNumber secondNumberProto = new Phonenumber.PhoneNumber();
                            parseHelper(firstNumber, null, false, false, firstNumberProto);
                            parseHelper(secondNumber, null, false, false, secondNumberProto);
                            return isNumberMatch(firstNumberProto, secondNumberProto);
                        } catch (NumberParseException e3) {
                            return MatchType.NOT_A_NUMBER;
                        }
                    }
                    return MatchType.NOT_A_NUMBER;
                }
            }
            return MatchType.NOT_A_NUMBER;
        }
    }

    public MatchType isNumberMatch(Phonenumber.PhoneNumber firstNumber, String secondNumber) {
        MatchType match;
        try {
            Phonenumber.PhoneNumber secondNumberAsProto = parse(secondNumber, UNKNOWN_REGION);
            return isNumberMatch(firstNumber, secondNumberAsProto);
        } catch (NumberParseException e) {
            if (e.getErrorType() == NumberParseException.ErrorType.INVALID_COUNTRY_CODE) {
                String firstNumberRegion = getRegionCodeForCountryCode(firstNumber.getCountryCode());
                try {
                    if (!firstNumberRegion.equals(UNKNOWN_REGION)) {
                        Phonenumber.PhoneNumber secondNumberWithFirstNumberRegion = parse(secondNumber, firstNumberRegion);
                        match = isNumberMatch(firstNumber, secondNumberWithFirstNumberRegion);
                        if (match == MatchType.EXACT_MATCH) {
                            match = MatchType.NSN_MATCH;
                        }
                    } else {
                        Phonenumber.PhoneNumber secondNumberProto = new Phonenumber.PhoneNumber();
                        parseHelper(secondNumber, null, false, false, secondNumberProto);
                        match = isNumberMatch(firstNumber, secondNumberProto);
                    }
                    return match;
                } catch (NumberParseException e2) {
                    return MatchType.NOT_A_NUMBER;
                }
            }
            return MatchType.NOT_A_NUMBER;
        }
    }

    boolean canBeInternationallyDialled(Phonenumber.PhoneNumber number) {
        Phonemetadata.PhoneMetadata metadata = getMetadataForRegion(getRegionCodeForNumber(number));
        if (metadata == null) {
            return true;
        }
        String nationalSignificantNumber = getNationalSignificantNumber(number);
        return !isNumberMatchingDesc(nationalSignificantNumber, metadata.getNoInternationalDialling());
    }

    public boolean isMobileNumberPortableRegion(String regionCode) {
        Phonemetadata.PhoneMetadata metadata = getMetadataForRegion(regionCode);
        if (metadata == null) {
            Logger logger2 = logger;
            Level level = Level.WARNING;
            String valueOf = String.valueOf(regionCode);
            logger2.log(level, valueOf.length() != 0 ? "Invalid or unknown region code provided: ".concat(valueOf) : new String("Invalid or unknown region code provided: "));
            return false;
        }
        return metadata.isMobileNumberPortableRegion();
    }
}
