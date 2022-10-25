package org.mp4parser.aspectj.runtime.reflect;

import java.lang.ref.SoftReference;
import java.util.StringTokenizer;
import org.mp4parser.aspectj.lang.Signature;
/* loaded from: classes3.dex */
abstract class SignatureImpl implements Signature {
    static final String INNER_SEP = ":";
    static final char SEP = '-';
    Class declaringType;
    String declaringTypeName;
    ClassLoader lookupClassLoader;
    int modifiers;
    String name;
    Cache stringCache;
    private String stringRep;
    private static boolean useCache = true;
    static String[] EMPTY_STRING_ARRAY = new String[0];
    static Class[] EMPTY_CLASS_ARRAY = new Class[0];

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public interface Cache {
        String get(int i);

        void set(int i, String str);
    }

    protected abstract String createToString(StringMaker stringMaker);

    /* JADX INFO: Access modifiers changed from: package-private */
    public SignatureImpl(int modifiers, String name, Class declaringType) {
        this.modifiers = -1;
        this.lookupClassLoader = null;
        this.modifiers = modifiers;
        this.name = name;
        this.declaringType = declaringType;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String toString(StringMaker sm) {
        String result = null;
        if (useCache) {
            if (this.stringCache == null) {
                try {
                    this.stringCache = new CacheImpl();
                } catch (Throwable th) {
                    useCache = false;
                }
            } else {
                result = this.stringCache.get(sm.cacheOffset);
            }
        }
        if (result == null) {
            result = createToString(sm);
        }
        if (useCache) {
            this.stringCache.set(sm.cacheOffset, result);
        }
        return result;
    }

    @Override // org.mp4parser.aspectj.lang.Signature
    public final String toString() {
        return toString(StringMaker.middleStringMaker);
    }

    @Override // org.mp4parser.aspectj.lang.Signature
    public final String toShortString() {
        return toString(StringMaker.shortStringMaker);
    }

    @Override // org.mp4parser.aspectj.lang.Signature
    public final String toLongString() {
        return toString(StringMaker.longStringMaker);
    }

    @Override // org.mp4parser.aspectj.lang.Signature
    public int getModifiers() {
        if (this.modifiers == -1) {
            this.modifiers = extractInt(0);
        }
        return this.modifiers;
    }

    @Override // org.mp4parser.aspectj.lang.Signature
    public String getName() {
        if (this.name == null) {
            this.name = extractString(1);
        }
        return this.name;
    }

    @Override // org.mp4parser.aspectj.lang.Signature
    public Class getDeclaringType() {
        if (this.declaringType == null) {
            this.declaringType = extractType(2);
        }
        return this.declaringType;
    }

    @Override // org.mp4parser.aspectj.lang.Signature
    public String getDeclaringTypeName() {
        if (this.declaringTypeName == null) {
            this.declaringTypeName = getDeclaringType().getName();
        }
        return this.declaringTypeName;
    }

    String fullTypeName(Class type) {
        return type == null ? "ANONYMOUS" : type.isArray() ? new StringBuffer().append(fullTypeName(type.getComponentType())).append("[]").toString() : type.getName().replace('$', '.');
    }

    String stripPackageName(String name) {
        int dot = name.lastIndexOf(46);
        return dot == -1 ? name : name.substring(dot + 1);
    }

    String shortTypeName(Class type) {
        return type == null ? "ANONYMOUS" : type.isArray() ? new StringBuffer().append(shortTypeName(type.getComponentType())).append("[]").toString() : stripPackageName(type.getName()).replace('$', '.');
    }

    void addFullTypeNames(StringBuffer buf, Class[] types) {
        for (int i = 0; i < types.length; i++) {
            if (i > 0) {
                buf.append(", ");
            }
            buf.append(fullTypeName(types[i]));
        }
    }

    void addShortTypeNames(StringBuffer buf, Class[] types) {
        for (int i = 0; i < types.length; i++) {
            if (i > 0) {
                buf.append(", ");
            }
            buf.append(shortTypeName(types[i]));
        }
    }

    void addTypeArray(StringBuffer buf, Class[] types) {
        addFullTypeNames(buf, types);
    }

    public void setLookupClassLoader(ClassLoader loader) {
        this.lookupClassLoader = loader;
    }

    private ClassLoader getLookupClassLoader() {
        if (this.lookupClassLoader == null) {
            this.lookupClassLoader = getClass().getClassLoader();
        }
        return this.lookupClassLoader;
    }

    public SignatureImpl(String stringRep) {
        this.modifiers = -1;
        this.lookupClassLoader = null;
        this.stringRep = stringRep;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String extractString(int n) {
        int startIndex = 0;
        int endIndex = this.stringRep.indexOf(45);
        while (true) {
            int n2 = n;
            n = n2 - 1;
            if (n2 <= 0) {
                break;
            }
            startIndex = endIndex + 1;
            endIndex = this.stringRep.indexOf(45, startIndex);
        }
        if (endIndex == -1) {
            endIndex = this.stringRep.length();
        }
        return this.stringRep.substring(startIndex, endIndex);
    }

    int extractInt(int n) {
        String s = extractString(n);
        return Integer.parseInt(s, 16);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Class extractType(int n) {
        String s = extractString(n);
        return Factory.makeClass(s, getLookupClassLoader());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String[] extractStrings(int n) {
        String s = extractString(n);
        StringTokenizer st = new StringTokenizer(s, INNER_SEP);
        int N = st.countTokens();
        String[] ret = new String[N];
        for (int i = 0; i < N; i++) {
            ret[i] = st.nextToken();
        }
        return ret;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Class[] extractTypes(int n) {
        String s = extractString(n);
        StringTokenizer st = new StringTokenizer(s, INNER_SEP);
        int N = st.countTokens();
        Class[] ret = new Class[N];
        for (int i = 0; i < N; i++) {
            ret[i] = Factory.makeClass(st.nextToken(), getLookupClassLoader());
        }
        return ret;
    }

    static void setUseCache(boolean b) {
        useCache = b;
    }

    static boolean getUseCache() {
        return useCache;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static final class CacheImpl implements Cache {
        private SoftReference toStringCacheRef;

        public CacheImpl() {
            makeCache();
        }

        @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl.Cache
        public String get(int cacheOffset) {
            String[] cachedArray = array();
            if (cachedArray == null) {
                return null;
            }
            return cachedArray[cacheOffset];
        }

        @Override // org.mp4parser.aspectj.runtime.reflect.SignatureImpl.Cache
        public void set(int cacheOffset, String result) {
            String[] cachedArray = array();
            if (cachedArray == null) {
                cachedArray = makeCache();
            }
            cachedArray[cacheOffset] = result;
        }

        private String[] array() {
            return (String[]) this.toStringCacheRef.get();
        }

        private String[] makeCache() {
            String[] array = new String[3];
            this.toStringCacheRef = new SoftReference(array);
            return array;
        }
    }
}
