package com.google.i18n.phonenumbers;

import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonemetadata;
import com.google.i18n.phonenumbers.Phonenumber;
import com.vk.media.camera.CameraUtilsEffects;
import java.lang.Character;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.slf4j.Marker;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class PhoneNumberMatcher implements Iterator<PhoneNumberMatch> {
    private static final Pattern LEAD_CLASS;
    private static final Pattern MATCHING_BRACKETS;
    private static final Pattern PATTERN;
    private final PhoneNumberUtil.Leniency leniency;
    private long maxTries;
    private final PhoneNumberUtil phoneUtil;
    private final String preferredRegion;
    private final CharSequence text;
    private static final Pattern PUB_PAGES = Pattern.compile("\\d{1,5}-+\\d{1,5}\\s{0,4}\\(\\d{1,4}");
    private static final Pattern SLASH_SEPARATED_DATES = Pattern.compile("(?:(?:[0-3]?\\d/[01]?\\d)|(?:[01]?\\d/[0-3]?\\d))/(?:[12]\\d)?\\d{2}");
    private static final Pattern TIME_STAMPS = Pattern.compile("[12]\\d{3}[-/]?[01]\\d[-/]?[0-3]\\d +[0-2]\\d$");
    private static final Pattern TIME_STAMPS_SUFFIX = Pattern.compile(":[0-5]\\d");
    private static final Pattern[] INNER_MATCHES = {Pattern.compile("/+(.*)"), Pattern.compile("(\\([^(]*)"), Pattern.compile("(?:\\p{Z}-|-\\p{Z})\\p{Z}*(.+)"), Pattern.compile("[‒-―－]\\p{Z}*(.+)"), Pattern.compile("\\.+\\p{Z}*([^.]+)"), Pattern.compile("\\p{Z}+(\\P{Z}+)")};
    private State state = State.NOT_READY;
    private PhoneNumberMatch lastMatch = null;
    private int searchIndex = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface NumberGroupingChecker {
        boolean checkGroups(PhoneNumberUtil phoneNumberUtil, Phonenumber.PhoneNumber phoneNumber, StringBuilder sb, String[] strArr);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public enum State {
        NOT_READY,
        READY,
        DONE
    }

    static {
        String valueOf = String.valueOf(String.valueOf("(\\[（［"));
        String valueOf2 = String.valueOf(String.valueOf(")\\]）］"));
        String nonParens = new StringBuilder(valueOf.length() + 3 + valueOf2.length()).append("[^").append(valueOf).append(valueOf2).append("]").toString();
        String bracketPairLimit = limit(0, 3);
        String valueOf3 = String.valueOf(String.valueOf("(\\[（［"));
        String valueOf4 = String.valueOf(String.valueOf(nonParens));
        String valueOf5 = String.valueOf(String.valueOf(")\\]）］"));
        String valueOf6 = String.valueOf(String.valueOf(nonParens));
        String valueOf7 = String.valueOf(String.valueOf("(\\[（［"));
        String valueOf8 = String.valueOf(String.valueOf(nonParens));
        String valueOf9 = String.valueOf(String.valueOf(")\\]）］"));
        String valueOf10 = String.valueOf(String.valueOf(bracketPairLimit));
        String valueOf11 = String.valueOf(String.valueOf(nonParens));
        MATCHING_BRACKETS = Pattern.compile(new StringBuilder(valueOf3.length() + 26 + valueOf4.length() + valueOf5.length() + valueOf6.length() + valueOf7.length() + valueOf8.length() + valueOf9.length() + valueOf10.length() + valueOf11.length()).append("(?:[").append(valueOf3).append("])?").append("(?:").append(valueOf4).append(Marker.ANY_NON_NULL_MARKER).append("[").append(valueOf5).append("])?").append(valueOf6).append(Marker.ANY_NON_NULL_MARKER).append("(?:[").append(valueOf7).append("]").append(valueOf8).append("+[").append(valueOf9).append("])").append(valueOf10).append(valueOf11).append(Marker.ANY_MARKER).toString());
        String leadLimit = limit(0, 2);
        String punctuationLimit = limit(0, 4);
        String blockLimit = limit(0, 20);
        String valueOf12 = String.valueOf("[-x‐-―−ー－-／  \u00ad\u200b\u2060\u3000()（）［］.\\[\\]/~⁓∼～]");
        String valueOf13 = String.valueOf(punctuationLimit);
        String punctuation = valueOf13.length() != 0 ? valueOf12.concat(valueOf13) : new String(valueOf12);
        String valueOf14 = String.valueOf(limit(1, 20));
        String digitSequence = valueOf14.length() != 0 ? "\\p{Nd}".concat(valueOf14) : new String("\\p{Nd}");
        String valueOf15 = String.valueOf("(\\[（［");
        String valueOf16 = String.valueOf("+＋");
        String leadClassChars = valueOf16.length() != 0 ? valueOf15.concat(valueOf16) : new String(valueOf15);
        String valueOf17 = String.valueOf(String.valueOf(leadClassChars));
        String leadClass = new StringBuilder(valueOf17.length() + 2).append("[").append(valueOf17).append("]").toString();
        LEAD_CLASS = Pattern.compile(leadClass);
        String valueOf18 = String.valueOf(String.valueOf(leadClass));
        String valueOf19 = String.valueOf(String.valueOf(punctuation));
        String valueOf20 = String.valueOf(String.valueOf(leadLimit));
        String valueOf21 = String.valueOf(String.valueOf(digitSequence));
        String valueOf22 = String.valueOf(String.valueOf(punctuation));
        String valueOf23 = String.valueOf(String.valueOf(digitSequence));
        String valueOf24 = String.valueOf(String.valueOf(blockLimit));
        String valueOf25 = String.valueOf(String.valueOf(PhoneNumberUtil.EXTN_PATTERNS_FOR_MATCHING));
        PATTERN = Pattern.compile(new StringBuilder(valueOf18.length() + 13 + valueOf19.length() + valueOf20.length() + valueOf21.length() + valueOf22.length() + valueOf23.length() + valueOf24.length() + valueOf25.length()).append("(?:").append(valueOf18).append(valueOf19).append(")").append(valueOf20).append(valueOf21).append("(?:").append(valueOf22).append(valueOf23).append(")").append(valueOf24).append("(?:").append(valueOf25).append(")?").toString(), 66);
    }

    private static String limit(int lower, int upper) {
        if (lower < 0 || upper <= 0 || upper < lower) {
            throw new IllegalArgumentException();
        }
        return new StringBuilder(25).append("{").append(lower).append(",").append(upper).append("}").toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PhoneNumberMatcher(PhoneNumberUtil util, String text, String country, PhoneNumberUtil.Leniency leniency, long maxTries) {
        if (util == null || leniency == null) {
            throw new NullPointerException();
        }
        if (maxTries < 0) {
            throw new IllegalArgumentException();
        }
        this.phoneUtil = util;
        this.text = text == null ? "" : text;
        this.preferredRegion = country;
        this.leniency = leniency;
        this.maxTries = maxTries;
    }

    private PhoneNumberMatch find(int index) {
        Matcher matcher = PATTERN.matcher(this.text);
        while (this.maxTries > 0 && matcher.find(index)) {
            int start = matcher.start();
            CharSequence candidate = trimAfterFirstMatch(PhoneNumberUtil.SECOND_NUMBER_START_PATTERN, this.text.subSequence(start, matcher.end()));
            PhoneNumberMatch match = extractMatch(candidate, start);
            if (match == null) {
                index = start + candidate.length();
                this.maxTries--;
            } else {
                return match;
            }
        }
        return null;
    }

    private static CharSequence trimAfterFirstMatch(Pattern pattern, CharSequence candidate) {
        Matcher trailingCharsMatcher = pattern.matcher(candidate);
        if (trailingCharsMatcher.find()) {
            return candidate.subSequence(0, trailingCharsMatcher.start());
        }
        return candidate;
    }

    static boolean isLatinLetter(char letter) {
        if (Character.isLetter(letter) || Character.getType(letter) == 6) {
            Character.UnicodeBlock block = Character.UnicodeBlock.of(letter);
            return block.equals(Character.UnicodeBlock.BASIC_LATIN) || block.equals(Character.UnicodeBlock.LATIN_1_SUPPLEMENT) || block.equals(Character.UnicodeBlock.LATIN_EXTENDED_A) || block.equals(Character.UnicodeBlock.LATIN_EXTENDED_ADDITIONAL) || block.equals(Character.UnicodeBlock.LATIN_EXTENDED_B) || block.equals(Character.UnicodeBlock.COMBINING_DIACRITICAL_MARKS);
        }
        return false;
    }

    private static boolean isInvalidPunctuationSymbol(char character) {
        return character == '%' || Character.getType(character) == 26;
    }

    private PhoneNumberMatch extractMatch(CharSequence candidate, int offset) {
        if (SLASH_SEPARATED_DATES.matcher(candidate).find()) {
            return null;
        }
        if (TIME_STAMPS.matcher(candidate).find()) {
            String followingText = this.text.toString().substring(candidate.length() + offset);
            if (TIME_STAMPS_SUFFIX.matcher(followingText).lookingAt()) {
                return null;
            }
        }
        String rawString = candidate.toString();
        PhoneNumberMatch match = parseAndVerify(rawString, offset);
        return match == null ? extractInnerMatch(rawString, offset) : match;
    }

    private PhoneNumberMatch extractInnerMatch(String candidate, int offset) {
        Pattern[] arr$ = INNER_MATCHES;
        for (Pattern possibleInnerMatch : arr$) {
            Matcher groupMatcher = possibleInnerMatch.matcher(candidate);
            boolean isFirstMatch = true;
            while (groupMatcher.find() && this.maxTries > 0) {
                if (isFirstMatch) {
                    CharSequence group = trimAfterFirstMatch(PhoneNumberUtil.UNWANTED_END_CHAR_PATTERN, candidate.substring(0, groupMatcher.start()));
                    PhoneNumberMatch match = parseAndVerify(group.toString(), offset);
                    if (match == null) {
                        this.maxTries--;
                        isFirstMatch = false;
                    } else {
                        return match;
                    }
                }
                CharSequence group2 = trimAfterFirstMatch(PhoneNumberUtil.UNWANTED_END_CHAR_PATTERN, groupMatcher.group(1));
                PhoneNumberMatch match2 = parseAndVerify(group2.toString(), groupMatcher.start(1) + offset);
                if (match2 != null) {
                    return match2;
                }
                this.maxTries--;
            }
        }
        return null;
    }

    private PhoneNumberMatch parseAndVerify(String candidate, int offset) {
        try {
            if (!MATCHING_BRACKETS.matcher(candidate).matches() || PUB_PAGES.matcher(candidate).find()) {
                return null;
            }
            if (this.leniency.compareTo(PhoneNumberUtil.Leniency.VALID) >= 0) {
                if (offset > 0 && !LEAD_CLASS.matcher(candidate).lookingAt()) {
                    char previousChar = this.text.charAt(offset - 1);
                    if (isInvalidPunctuationSymbol(previousChar) || isLatinLetter(previousChar)) {
                        return null;
                    }
                }
                int lastCharIndex = offset + candidate.length();
                if (lastCharIndex < this.text.length()) {
                    char nextChar = this.text.charAt(lastCharIndex);
                    if (isInvalidPunctuationSymbol(nextChar) || isLatinLetter(nextChar)) {
                        return null;
                    }
                }
            }
            Phonenumber.PhoneNumber number = this.phoneUtil.parseAndKeepRawInput(candidate, this.preferredRegion);
            if (this.phoneUtil.getRegionCodeForCountryCode(number.getCountryCode()).equals("IL") && this.phoneUtil.getNationalSignificantNumber(number).length() == 4) {
                if (offset == 0) {
                    return null;
                }
                if (offset > 0 && this.text.charAt(offset - 1) != '*') {
                    return null;
                }
            }
            if (!this.leniency.verify(number, candidate, this.phoneUtil)) {
                return null;
            }
            number.clearCountryCodeSource();
            number.clearRawInput();
            number.clearPreferredDomesticCarrierCode();
            return new PhoneNumberMatch(offset, candidate, number);
        } catch (NumberParseException e) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean allNumberGroupsRemainGrouped(PhoneNumberUtil util, Phonenumber.PhoneNumber number, StringBuilder normalizedCandidate, String[] formattedNumberGroups) {
        int fromIndex = 0;
        if (number.getCountryCodeSource() != Phonenumber.PhoneNumber.CountryCodeSource.FROM_DEFAULT_COUNTRY) {
            String countryCode = Integer.toString(number.getCountryCode());
            fromIndex = normalizedCandidate.indexOf(countryCode) + countryCode.length();
        }
        for (int i = 0; i < formattedNumberGroups.length; i++) {
            int fromIndex2 = normalizedCandidate.indexOf(formattedNumberGroups[i], fromIndex);
            if (fromIndex2 < 0) {
                return false;
            }
            fromIndex = fromIndex2 + formattedNumberGroups[i].length();
            if (i == 0 && fromIndex < normalizedCandidate.length()) {
                String region = util.getRegionCodeForCountryCode(number.getCountryCode());
                if (util.getNddPrefixForRegion(region, true) != null && Character.isDigit(normalizedCandidate.charAt(fromIndex))) {
                    String nationalSignificantNumber = util.getNationalSignificantNumber(number);
                    return normalizedCandidate.substring(fromIndex - formattedNumberGroups[i].length()).startsWith(nationalSignificantNumber);
                }
            }
        }
        return normalizedCandidate.substring(fromIndex).contains(number.getExtension());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean allNumberGroupsAreExactlyPresent(PhoneNumberUtil util, Phonenumber.PhoneNumber number, StringBuilder normalizedCandidate, String[] formattedNumberGroups) {
        String[] candidateGroups = PhoneNumberUtil.NON_DIGITS_PATTERN.split(normalizedCandidate.toString());
        int candidateNumberGroupIndex = number.hasExtension() ? candidateGroups.length - 2 : candidateGroups.length - 1;
        if (candidateGroups.length == 1 || candidateGroups[candidateNumberGroupIndex].contains(util.getNationalSignificantNumber(number))) {
            return true;
        }
        int formattedNumberGroupIndex = formattedNumberGroups.length - 1;
        while (formattedNumberGroupIndex > 0 && candidateNumberGroupIndex >= 0) {
            if (!candidateGroups[candidateNumberGroupIndex].equals(formattedNumberGroups[formattedNumberGroupIndex])) {
                return false;
            }
            formattedNumberGroupIndex--;
            candidateNumberGroupIndex--;
        }
        return candidateNumberGroupIndex >= 0 && candidateGroups[candidateNumberGroupIndex].endsWith(formattedNumberGroups[0]);
    }

    private static String[] getNationalNumberGroups(PhoneNumberUtil util, Phonenumber.PhoneNumber number, Phonemetadata.NumberFormat formattingPattern) {
        if (formattingPattern == null) {
            String rfc3966Format = util.format(number, PhoneNumberUtil.PhoneNumberFormat.RFC3966);
            int endIndex = rfc3966Format.indexOf(59);
            if (endIndex < 0) {
                endIndex = rfc3966Format.length();
            }
            int startIndex = rfc3966Format.indexOf(45) + 1;
            return rfc3966Format.substring(startIndex, endIndex).split("-");
        }
        String nationalSignificantNumber = util.getNationalSignificantNumber(number);
        return util.formatNsnUsingPattern(nationalSignificantNumber, formattingPattern, PhoneNumberUtil.PhoneNumberFormat.RFC3966).split("-");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean checkNumberGroupingIsValid(Phonenumber.PhoneNumber number, String candidate, PhoneNumberUtil util, NumberGroupingChecker checker) {
        StringBuilder normalizedCandidate = PhoneNumberUtil.normalizeDigits(candidate, true);
        String[] formattedNumberGroups = getNationalNumberGroups(util, number, null);
        if (checker.checkGroups(util, number, normalizedCandidate, formattedNumberGroups)) {
            return true;
        }
        Phonemetadata.PhoneMetadata alternateFormats = MetadataManager.getAlternateFormatsForCountry(number.getCountryCode());
        if (alternateFormats != null) {
            for (Phonemetadata.NumberFormat alternateFormat : alternateFormats.numberFormats()) {
                String[] formattedNumberGroups2 = getNationalNumberGroups(util, number, alternateFormat);
                if (checker.checkGroups(util, number, normalizedCandidate, formattedNumberGroups2)) {
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean containsMoreThanOneSlashInNationalNumber(Phonenumber.PhoneNumber number, String candidate) {
        int secondSlashInBodyIndex;
        int firstSlashInBodyIndex = candidate.indexOf(47);
        if (firstSlashInBodyIndex >= 0 && (secondSlashInBodyIndex = candidate.indexOf(47, firstSlashInBodyIndex + 1)) >= 0) {
            boolean candidateHasCountryCode = number.getCountryCodeSource() == Phonenumber.PhoneNumber.CountryCodeSource.FROM_NUMBER_WITH_PLUS_SIGN || number.getCountryCodeSource() == Phonenumber.PhoneNumber.CountryCodeSource.FROM_NUMBER_WITHOUT_PLUS_SIGN;
            if (candidateHasCountryCode && PhoneNumberUtil.normalizeDigitsOnly(candidate.substring(0, firstSlashInBodyIndex)).equals(Integer.toString(number.getCountryCode()))) {
                return candidate.substring(secondSlashInBodyIndex + 1).contains(CameraUtilsEffects.FILE_DELIM);
            }
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean containsOnlyValidXChars(Phonenumber.PhoneNumber number, String candidate, PhoneNumberUtil util) {
        int index = 0;
        while (index < candidate.length() - 1) {
            char charAtIndex = candidate.charAt(index);
            if (charAtIndex == 'x' || charAtIndex == 'X') {
                char charAtNextIndex = candidate.charAt(index + 1);
                if (charAtNextIndex == 'x' || charAtNextIndex == 'X') {
                    index++;
                    if (util.isNumberMatch(number, candidate.substring(index)) != PhoneNumberUtil.MatchType.NSN_MATCH) {
                        return false;
                    }
                } else if (!PhoneNumberUtil.normalizeDigitsOnly(candidate.substring(index)).equals(number.getExtension())) {
                    return false;
                }
            }
            index++;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isNationalPrefixPresentIfRequired(Phonenumber.PhoneNumber number, PhoneNumberUtil util) {
        if (number.getCountryCodeSource() != Phonenumber.PhoneNumber.CountryCodeSource.FROM_DEFAULT_COUNTRY) {
            return true;
        }
        String phoneNumberRegion = util.getRegionCodeForCountryCode(number.getCountryCode());
        Phonemetadata.PhoneMetadata metadata = util.getMetadataForRegion(phoneNumberRegion);
        if (metadata == null) {
            return true;
        }
        String nationalNumber = util.getNationalSignificantNumber(number);
        Phonemetadata.NumberFormat formatRule = util.chooseFormattingPatternForNumber(metadata.numberFormats(), nationalNumber);
        if (formatRule == null || formatRule.getNationalPrefixFormattingRule().length() <= 0 || formatRule.isNationalPrefixOptionalWhenFormatting() || PhoneNumberUtil.formattingRuleHasFirstGroupOnly(formatRule.getNationalPrefixFormattingRule())) {
            return true;
        }
        String rawInputCopy = PhoneNumberUtil.normalizeDigitsOnly(number.getRawInput());
        StringBuilder rawInput = new StringBuilder(rawInputCopy);
        return util.maybeStripNationalPrefixAndCarrierCode(rawInput, metadata, null);
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        if (this.state == State.NOT_READY) {
            this.lastMatch = find(this.searchIndex);
            if (this.lastMatch == null) {
                this.state = State.DONE;
            } else {
                this.searchIndex = this.lastMatch.end();
                this.state = State.READY;
            }
        }
        return this.state == State.READY;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Iterator
    /* renamed from: next */
    public PhoneNumberMatch mo410next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        PhoneNumberMatch result = this.lastMatch;
        this.lastMatch = null;
        this.state = State.NOT_READY;
        return result;
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException();
    }
}
