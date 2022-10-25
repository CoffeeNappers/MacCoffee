package com.vkontakte.android.fragments.friends;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.SparseArray;
import com.vk.stories.StoriesProcessor;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public class SearchIndexer<T> {
    private List<T> mData;
    private final Provider<? super T> mProvider;
    private final Object mLock = new Object();
    private final SparseArray<List<T>> mIndex = new SparseArray<>();

    /* loaded from: classes2.dex */
    public interface Provider<T> {
        char[] getIndexChar(T t);

        boolean hasPriority();

        boolean matches(String str, T t);

        int priority(String str, T t);
    }

    public SearchIndexer(@Nullable Provider<? super T> provider) {
        this.mProvider = provider;
    }

    public void bind(List<T> data) {
        this.mData = data;
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [com.vkontakte.android.fragments.friends.SearchIndexer$1] */
    public void build() {
        if (this.mData == null) {
            throw new IllegalStateException("Object list is null");
        }
        new Thread() { // from class: com.vkontakte.android.fragments.friends.SearchIndexer.1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                synchronized (SearchIndexer.this.mLock) {
                    SearchIndexer.this.mIndex.clear();
                    for (int i = 0; i < SearchIndexer.this.mData.size(); i++) {
                        SearchIndexer.this.add(SearchIndexer.this.mData.get(i));
                    }
                }
            }
        }.start();
    }

    public void add(T item) {
        if (this.mProvider != null) {
            char[] chars = this.mProvider.getIndexChar(item);
            for (char c : chars) {
                List<T> items = this.mIndex.get(c);
                if (items == null) {
                    items = new ArrayList<>();
                    this.mIndex.put(c, items);
                }
                if (!items.contains(item)) {
                    items.add(item);
                }
            }
        }
    }

    @NonNull
    public ArrayList<T> search(String query) {
        String finalQuery = query.toLowerCase();
        ArrayList<T> result = new ArrayList<>();
        search(translitToRus(finalQuery), result);
        search(translitToEng(finalQuery), result);
        if (this.mProvider != null && this.mProvider.hasPriority()) {
            Collections.sort(result, SearchIndexer$$Lambda$1.lambdaFactory$(this, finalQuery));
        }
        return result;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ int lambda$search$0(String finalQuery, Object lhs, Object rhs) {
        int left = this.mProvider.priority(finalQuery, lhs);
        int right = this.mProvider.priority(finalQuery, rhs);
        if (left > right) {
            return -1;
        }
        return left == right ? 0 : 1;
    }

    private void search(String query, List<T> result) {
        if (!TextUtils.isEmpty(query) && this.mProvider != null) {
            char firstChar = query.charAt(0);
            synchronized (this.mLock) {
                List<T> m = this.mIndex.get(firstChar);
                if (m != null) {
                    if (query.length() == 1) {
                        for (int i = 0; i < m.size(); i++) {
                            T item = m.get(i);
                            if (!result.contains(item)) {
                                result.add(item);
                            }
                        }
                    } else {
                        for (int i2 = 0; i2 < m.size(); i2++) {
                            T item2 = m.get(i2);
                            if (this.mProvider.matches(query, item2) && !result.contains(item2)) {
                                result.add(item2);
                            }
                        }
                    }
                }
            }
        }
    }

    public void clear() {
        synchronized (this.mLock) {
            this.mIndex.clear();
            this.mData = null;
        }
    }

    /* loaded from: classes2.dex */
    public static abstract class SimpleProvider<T> implements Provider<T> {
        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public int priority(String query, T item) {
            return 0;
        }

        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public boolean hasPriority() {
            return false;
        }
    }

    private static void rusToEng(char character, StringBuilder to) {
        switch (character) {
            case 1072:
                to.append('a');
                return;
            case 1073:
                to.append('b');
                return;
            case 1074:
                to.append('v');
                return;
            case 1075:
                to.append('g');
                return;
            case 1076:
                to.append('d');
                return;
            case 1077:
                to.append('e');
                return;
            case 1078:
                to.append("zh");
                return;
            case 1079:
                to.append('z');
                return;
            case StoriesProcessor.MAX_PHOTO_WIDTH /* 1080 */:
                to.append('i');
                return;
            case 1081:
                to.append('j');
                return;
            case 1082:
                to.append('k');
                return;
            case 1083:
                to.append('l');
                return;
            case 1084:
                to.append('m');
                return;
            case 1085:
                to.append('n');
                return;
            case 1086:
                to.append('o');
                return;
            case 1087:
                to.append('p');
                return;
            case 1088:
                to.append('r');
                return;
            case 1089:
                to.append('s');
                return;
            case 1090:
                to.append('t');
                return;
            case 1091:
                to.append('u');
                return;
            case 1092:
                to.append('f');
                return;
            case 1093:
                to.append('h');
                return;
            case 1094:
                to.append('c');
                return;
            case 1095:
                to.append("ch");
                return;
            case 1096:
                to.append("sh");
                return;
            case 1097:
                to.append("sch");
                return;
            case 1098:
            case 1100:
                return;
            case 1099:
                to.append('y');
                return;
            case 1101:
                to.append('e');
                return;
            case 1102:
                to.append("yu");
                return;
            case 1103:
                to.append("ya");
                return;
            default:
                to.append(character);
                return;
        }
    }

    private static int engToRus(String string, int position, StringBuilder to) {
        char character = string.charAt(position);
        switch (character) {
            case 'a':
                to.append((char) 1072);
                return 1;
            case 'b':
                to.append((char) 1073);
                return 1;
            case 'c':
                if (position + 1 < string.length() && string.charAt(position + 1) == 'h') {
                    to.append((char) 1095);
                    return 2;
                }
                to.append((char) 1094);
                return 1;
            case 'd':
                to.append((char) 1076);
                return 1;
            case 'e':
                to.append((char) 1077);
                return 1;
            case 'f':
                to.append((char) 1092);
                return 1;
            case 'g':
                to.append((char) 1075);
                return 1;
            case 'h':
                to.append((char) 1093);
                return 1;
            case 'i':
                to.append((char) 1080);
                return 1;
            case 'j':
                to.append((char) 1081);
                return 1;
            case 'k':
                to.append((char) 1082);
                return 1;
            case 'l':
                to.append((char) 1083);
                return 1;
            case 'm':
                to.append((char) 1084);
                return 1;
            case 'n':
                to.append((char) 1085);
                return 1;
            case 'o':
                to.append((char) 1086);
                return 1;
            case 'p':
                to.append((char) 1087);
                return 1;
            case 'q':
            case 'w':
            case 'x':
            default:
                to.append(character);
                return 1;
            case 'r':
                to.append((char) 1088);
                return 1;
            case 's':
                if (position + 1 < string.length() && string.charAt(position + 1) == 'h') {
                    to.append((char) 1096);
                    return 2;
                } else if (position + 2 < string.length() && string.charAt(position + 1) == 'c' && string.charAt(position + 2) == 'h') {
                    to.append((char) 1097);
                    return 3;
                } else {
                    to.append((char) 1089);
                    return 1;
                }
            case 't':
                to.append((char) 1090);
                return 1;
            case 'u':
                to.append((char) 1091);
                return 1;
            case 'v':
                to.append((char) 1074);
                return 1;
            case 'y':
                if (position + 1 < string.length()) {
                    if (string.charAt(position + 1) == 'u') {
                        to.append((char) 1102);
                        return 2;
                    } else if (string.charAt(position + 1) == 'a') {
                        to.append((char) 1103);
                        return 2;
                    }
                }
                to.append((char) 1099);
                return 1;
            case 'z':
                if (position + 1 < string.length() && string.charAt(position + 1) == 'h') {
                    to.append((char) 1078);
                    return 2;
                }
                to.append((char) 1079);
                return 1;
        }
    }

    private static String translitToEng(String source) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < source.length(); i++) {
            rusToEng(source.charAt(i), result);
        }
        return result.toString();
    }

    private static String translitToRus(String source) {
        StringBuilder result = new StringBuilder();
        int i = 0;
        while (i < source.length()) {
            i += engToRus(source, i, result);
        }
        return result.toString();
    }
}
