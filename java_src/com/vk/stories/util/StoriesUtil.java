package com.vk.stories.util;

import com.vk.stories.model.StoriesContainer;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class StoriesUtil {
    public static String getCounterText(int counterValue) {
        if (counterValue < 1000) {
            return String.valueOf(counterValue);
        }
        if (counterValue < 1000000) {
            float fValue = counterValue / 1000.0f;
            int iValue = counterValue / 1000;
            if (fValue - iValue < 0.1d) {
                return iValue + "k";
            }
            return String.format("%.1fk", Float.valueOf(fValue - 0.05f));
        }
        float fValue2 = counterValue / 1000000.0f;
        int iValue2 = counterValue / 1000000;
        if (fValue2 - iValue2 < 0.1d) {
            return iValue2 + "m";
        }
        return String.format("%.1fm", Float.valueOf(fValue2 - 0.05f));
    }

    public static ArrayList<StoriesContainer> filterStoriesWithNewContent(ArrayList<StoriesContainer> storiesContainers) {
        ArrayList<StoriesContainer> res = new ArrayList<>();
        if (storiesContainers != null) {
            for (int i = 0; i < storiesContainers.size(); i++) {
                if (storiesContainers.get(i).hasNewStories()) {
                    res.add(storiesContainers.get(i));
                }
            }
            if (res.size() == 0) {
                res.addAll(storiesContainers);
            }
        }
        return res;
    }

    public static ArrayList<StoriesContainer> filterStories(ArrayList<StoriesContainer> storiesContainers) {
        ArrayList<StoriesContainer> res = new ArrayList<>();
        if (storiesContainers != null) {
            for (int i = 0; i < storiesContainers.size(); i++) {
                if (storiesContainers.get(i).hasValidStories()) {
                    res.add(storiesContainers.get(i));
                }
            }
        }
        return res;
    }

    public static StoriesContainer findStoryByAuthorId(ArrayList<StoriesContainer> storiesContainers, int uid) {
        for (int i = 0; i < storiesContainers.size(); i++) {
            if (storiesContainers.get(i).getAuthorId() == uid) {
                return storiesContainers.get(i);
            }
        }
        return null;
    }
}
