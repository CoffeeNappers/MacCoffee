package com.vkontakte.android;

import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.Indexable;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Semaphore;
/* loaded from: classes2.dex */
public class SearchIndexer<T extends Indexable> {
    private static final String[] translit1 = {"щ", "ж", "ч", "ш", "ю", "я", "а", "б", "в", "г", "д", "е", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ъ", "ы", "ь", "э"};
    private static final String[] translit2 = {"sch", "zh", "ch", "sh", "yu", "ya", "a", "b", "v", "g", "d", "e", "z", "i", "j", "k", "l", "m", "n", "o", TtmlNode.TAG_P, "r", "s", "t", "u", "f", "h", "c", "", "y", "", "e"};
    private List<T> objects;
    private HashMap<String, ArrayList<T>> index = new HashMap<>();
    private Semaphore semaphore = new Semaphore(1, true);

    public SearchIndexer<T> bind(List<T> list) {
        this.objects = list;
        return this;
    }

    public void build() {
        if (this.objects == null) {
            throw new IllegalStateException("Object list is null");
        }
        new Thread(new Runnable() { // from class: com.vkontakte.android.SearchIndexer.1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.lang.Runnable
            public void run() {
                try {
                    SearchIndexer.this.semaphore.acquire();
                    SearchIndexer.this.index.clear();
                    for (Indexable indexable : SearchIndexer.this.objects) {
                        SearchIndexer.this.add(indexable);
                    }
                    SearchIndexer.this.semaphore.release();
                } catch (Exception e) {
                    SearchIndexer.this.index.clear();
                }
            }
        }).start();
    }

    public void add(T obj) {
        char[] chars = obj.getIndexChars();
        for (char c : chars) {
            String s = Character.toString(c);
            try {
                if (!this.index.containsKey(s) || this.index.get(s) == null) {
                    this.index.put(s, new ArrayList<>());
                }
                if (!this.index.get(s).contains(obj)) {
                    this.index.get(s).add(obj);
                }
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }
    }

    public List<T> search(String q) {
        String qTranslit;
        String q2 = q.toLowerCase();
        String qTranslit1 = q2;
        String qTranslit2 = q2;
        for (int i = 0; i < translit1.length; i++) {
            qTranslit1 = qTranslit1.replace(translit1[i], translit2[i]);
            if (translit2[i].length() > 0) {
                qTranslit2 = qTranslit2.replace(translit2[i], translit1[i]);
            }
        }
        if (qTranslit1.equals(q2)) {
            qTranslit = qTranslit2;
        } else {
            qTranslit = qTranslit1;
        }
        ArrayList<T> result = new ArrayList<>();
        if (q2 != null && q2.length() > 0) {
            String firstChar = q2.substring(0, 1);
            ArrayList<T> m = this.index.get(firstChar);
            if (m != null) {
                try {
                    this.semaphore.acquire();
                } catch (Exception e) {
                }
                Iterator<T> it = m.iterator();
                while (it.hasNext()) {
                    T obj = it.next();
                    if (obj != null && obj.matches(q2)) {
                        result.add(obj);
                    }
                }
                this.semaphore.release();
            }
            if (qTranslit.length() > 0) {
                String firstChar2 = qTranslit.substring(0, 1);
                ArrayList<T> m2 = this.index.get(firstChar2);
                if (m2 != null) {
                    try {
                        this.semaphore.acquire();
                    } catch (Exception e2) {
                    }
                    Iterator<T> it2 = m2.iterator();
                    while (it2.hasNext()) {
                        T obj2 = it2.next();
                        if (obj2 != null && obj2.matches(qTranslit) && !result.contains(obj2)) {
                            result.add(obj2);
                        }
                    }
                    this.semaphore.release();
                }
            }
        } else {
            result.addAll(this.objects);
        }
        return result;
    }
}
