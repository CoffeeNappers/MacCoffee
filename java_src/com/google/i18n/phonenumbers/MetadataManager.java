package com.google.i18n.phonenumbers;

import com.google.i18n.phonenumbers.Phonemetadata;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
/* loaded from: classes2.dex */
class MetadataManager {
    private static final String ALTERNATE_FORMATS_FILE_PREFIX = "/com/google/i18n/phonenumbers/data/PhoneNumberAlternateFormatsProto";
    private static final String SHORT_NUMBER_METADATA_FILE_PREFIX = "/com/google/i18n/phonenumbers/data/ShortNumberMetadataProto";
    private static final Logger LOGGER = Logger.getLogger(MetadataManager.class.getName());
    private static final Map<Integer, Phonemetadata.PhoneMetadata> callingCodeToAlternateFormatsMap = Collections.synchronizedMap(new HashMap());
    private static final Map<String, Phonemetadata.PhoneMetadata> regionCodeToShortNumberMetadataMap = Collections.synchronizedMap(new HashMap());
    private static final Set<Integer> countryCodeSet = AlternateFormatsCountryCodeSet.getCountryCodeSet();
    private static final Set<String> regionCodeSet = ShortNumbersRegionCodeSet.getRegionCodeSet();

    private MetadataManager() {
    }

    private static void close(InputStream in) {
        if (in != null) {
            try {
                in.close();
            } catch (IOException e) {
                LOGGER.log(Level.WARNING, e.toString());
            }
        }
    }

    private static void loadAlternateFormatsMetadataFromFile(int countryCallingCode) {
        ObjectInputStream in;
        String valueOf = String.valueOf(String.valueOf("/com/google/i18n/phonenumbers/data/PhoneNumberAlternateFormatsProto_"));
        InputStream source = PhoneNumberMatcher.class.getResourceAsStream(new StringBuilder(valueOf.length() + 11).append(valueOf).append(countryCallingCode).toString());
        ObjectInputStream in2 = null;
        try {
            try {
                in = new ObjectInputStream(source);
            } catch (IOException e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            Phonemetadata.PhoneMetadataCollection alternateFormats = new Phonemetadata.PhoneMetadataCollection();
            alternateFormats.readExternal(in);
            for (Phonemetadata.PhoneMetadata metadata : alternateFormats.getMetadataList()) {
                callingCodeToAlternateFormatsMap.put(Integer.valueOf(metadata.getCountryCode()), metadata);
            }
            close(in);
        } catch (IOException e2) {
            e = e2;
            in2 = in;
            LOGGER.log(Level.WARNING, e.toString());
            close(in2);
        } catch (Throwable th2) {
            th = th2;
            in2 = in;
            close(in2);
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Phonemetadata.PhoneMetadata getAlternateFormatsForCountry(int countryCallingCode) {
        if (!countryCodeSet.contains(Integer.valueOf(countryCallingCode))) {
            return null;
        }
        synchronized (callingCodeToAlternateFormatsMap) {
            if (!callingCodeToAlternateFormatsMap.containsKey(Integer.valueOf(countryCallingCode))) {
                loadAlternateFormatsMetadataFromFile(countryCallingCode);
            }
        }
        return callingCodeToAlternateFormatsMap.get(Integer.valueOf(countryCallingCode));
    }

    private static void loadShortNumberMetadataFromFile(String regionCode) {
        ObjectInputStream in;
        String valueOf = String.valueOf("/com/google/i18n/phonenumbers/data/ShortNumberMetadataProto_");
        String valueOf2 = String.valueOf(regionCode);
        InputStream source = PhoneNumberMatcher.class.getResourceAsStream(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
        ObjectInputStream in2 = null;
        try {
            try {
                in = new ObjectInputStream(source);
            } catch (IOException e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            Phonemetadata.PhoneMetadataCollection shortNumberMetadata = new Phonemetadata.PhoneMetadataCollection();
            shortNumberMetadata.readExternal(in);
            for (Phonemetadata.PhoneMetadata metadata : shortNumberMetadata.getMetadataList()) {
                regionCodeToShortNumberMetadataMap.put(regionCode, metadata);
            }
            close(in);
        } catch (IOException e2) {
            e = e2;
            in2 = in;
            LOGGER.log(Level.WARNING, e.toString());
            close(in2);
        } catch (Throwable th2) {
            th = th2;
            in2 = in;
            close(in2);
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Set<String> getShortNumberMetadataSupportedRegions() {
        return regionCodeSet;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Phonemetadata.PhoneMetadata getShortNumberMetadataForRegion(String regionCode) {
        if (!regionCodeSet.contains(regionCode)) {
            return null;
        }
        synchronized (regionCodeToShortNumberMetadataMap) {
            if (!regionCodeToShortNumberMetadataMap.containsKey(regionCode)) {
                loadShortNumberMetadataFromFile(regionCode);
            }
        }
        return regionCodeToShortNumberMetadataMap.get(regionCode);
    }
}
