package com.vkontakte.android.ui.util;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* loaded from: classes3.dex */
public class AlphabetSegmenter extends SectionSegmenter {
    public static final CharSequence IMPORTANT_SECTION_TITLE = "★";

    /* loaded from: classes3.dex */
    public interface Converter<T> {
        char getIndex(T t);
    }

    public <T> void bind(List<T> objects, Comparator<T> comparator, Converter<T> converter, int importantSize, boolean buildIndex) {
        boolean buildSection;
        if (buildIndex) {
            if (importantSize > 0 && !objects.isEmpty()) {
                addSection(objects, IMPORTANT_SECTION_TITLE, 0, Math.min(objects.size(), importantSize));
            }
            Collections.sort(objects, comparator);
            int start = 0;
            char prevLetter = 0;
            for (int i = 0; i <= objects.size(); i++) {
                char currentLetter = 0;
                if (i < objects.size()) {
                    T object = objects.get(i);
                    currentLetter = converter.getIndex(object);
                    buildSection = prevLetter != currentLetter;
                } else {
                    buildSection = true;
                }
                if (buildSection) {
                    if (prevLetter != 0) {
                        addSection(objects, String.valueOf(prevLetter), start, i);
                    }
                    prevLetter = currentLetter;
                    start = i;
                }
            }
            return;
        }
        addItems(objects, false);
    }
}
