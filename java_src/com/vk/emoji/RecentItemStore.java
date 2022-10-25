package com.vk.emoji;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class RecentItemStore {
    private static final int ITERATION_LEN = 5;
    private Context context;
    private boolean countUses;
    private int maxItems;
    private String prefsName;
    private HashMap<String, Float> useCounts = new HashMap<>();
    private ArrayList<String> items = new ArrayList<>();

    public RecentItemStore(Context c, String name, int max, boolean count) {
        this.countUses = true;
        this.context = c;
        this.prefsName = name;
        this.maxItems = max;
        this.countUses = count;
    }

    public void add(String c) {
        if (this.countUses) {
            int updateCount = this.context.getSharedPreferences("emoji", 0).getInt("update_count_" + this.prefsName, 0) + 1;
            this.context.getSharedPreferences("emoji", 0).edit().putInt("update_count_" + this.prefsName, updateCount).commit();
            if (updateCount > 0 && updateCount % 5 == 0) {
                Set<String> keys = this.useCounts.keySet();
                for (String key : keys) {
                    this.useCounts.put(key, Float.valueOf(this.useCounts.get(key).floatValue() / 1.3f));
                }
            }
            if (!this.useCounts.containsKey(c)) {
                this.useCounts.put(c, Float.valueOf(1.0f));
            } else {
                this.useCounts.put(c, Float.valueOf(this.useCounts.get(c).floatValue() + 1.0f));
            }
        }
        this.items.remove(c);
        this.items.add(0, c);
        save();
    }

    public String[] update() {
        String[] data;
        if (this.countUses) {
            ArrayList<RecentItem> r = new ArrayList<>();
            Set<String> keys = this.useCounts.keySet();
            for (String key : keys) {
                RecentItem i = new RecentItem();
                i.code = key;
                i.count = this.useCounts.get(key).floatValue();
                r.add(i);
            }
            Collections.sort(r, new Comparator<RecentItem>() { // from class: com.vk.emoji.RecentItemStore.1
                @Override // java.util.Comparator
                public int compare(RecentItem lhs, RecentItem rhs) {
                    if (lhs.count == rhs.count) {
                        return 0;
                    }
                    return lhs.count > rhs.count ? -1 : 1;
                }
            });
            data = new String[r.size()];
            for (int i2 = 0; i2 < r.size(); i2++) {
                data[i2] = r.get(i2).code;
            }
        } else {
            data = new String[this.items.size()];
            for (int i3 = 0; i3 < data.length; i3++) {
                data[i3] = this.items.get(i3);
            }
        }
        return data;
    }

    private void save() {
        ArrayList<String> sdata = new ArrayList<>();
        if (this.countUses) {
            Set<String> keys = this.useCounts.keySet();
            int i = 0;
            for (String key : keys) {
                if (i >= 50) {
                    break;
                }
                sdata.add(this.useCounts.get(key) + "\t" + key);
                i++;
            }
        }
        SharedPreferences prefs = this.context.getSharedPreferences("emoji", 0);
        SharedPreferences.Editor edit = prefs.edit();
        String str = this.prefsName;
        if (!this.countUses) {
            sdata = this.items;
        }
        edit.putString(str, TextUtils.join(",", sdata)).apply();
    }

    public String[] load() {
        String r = this.context.getSharedPreferences("emoji", 0).getString(this.prefsName, "");
        if (r != null && r.length() > 0 && r.contains("\t")) {
            List<String> sp = Arrays.asList(r.split(","));
            Collections.sort(sp);
            Collections.reverse(sp);
            String[] data = new String[sp.size()];
            this.useCounts.clear();
            int i = 0;
            for (String s : sp) {
                String[] ss = s.split("\t");
                String code = ss[1];
                if (ss.length > 1) {
                    float count = Float.parseFloat(ss[0]);
                    this.useCounts.put(code, Float.valueOf(count));
                }
                this.items.add(code);
                data[i] = code;
                i++;
            }
        }
        if (!this.countUses) {
            try {
                this.items.clear();
                for (String s2 : Arrays.asList(r.split(","))) {
                    this.items.add(s2);
                }
                Log.i("vk", "LOADED " + this.items);
            } catch (Exception x) {
                Log.w("vk", x);
            }
        }
        return update();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class RecentItem {
        String code;
        float count;

        private RecentItem() {
        }
    }
}
