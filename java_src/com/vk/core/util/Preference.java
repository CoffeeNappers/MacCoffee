package com.vk.core.util;

import android.content.SharedPreferences;
import android.text.TextUtils;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
/* loaded from: classes2.dex */
public interface Preference {

    /* loaded from: classes2.dex */
    public static abstract class PreferenceValue<T> {
        final T mDefaultValue;
        final String mKey;
        final SharedPreferences mPreferences;

        /* renamed from: get */
        public abstract T mo473get();

        public abstract void set(T t);

        PreferenceValue(SharedPreferences preferences, String key, T defaultValue) {
            this.mPreferences = preferences;
            this.mKey = key;
            this.mDefaultValue = defaultValue;
        }

        public String getKey() {
            return this.mKey;
        }

        public T getDefaultValue() {
            return this.mDefaultValue;
        }

        public boolean has() {
            return this.mPreferences.contains(this.mKey);
        }

        public void remove() {
            edit().remove(this.mKey).apply();
        }

        protected SharedPreferences.Editor edit() {
            return this.mPreferences.edit();
        }
    }

    /* loaded from: classes2.dex */
    public static class PreferenceStringSet extends PreferenceValue<Set<String>> {
        public PreferenceStringSet(SharedPreferences preferences, String key, Set<String> defaultValue) {
            super(preferences, key, defaultValue);
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        /* renamed from: get  reason: collision with other method in class */
        public Set<String> mo473get() {
            return this.mPreferences.getStringSet(this.mKey, (Set) this.mDefaultValue);
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        public void set(Set<String> value) {
            edit().putStringSet(this.mKey, value).apply();
        }
    }

    /* loaded from: classes2.dex */
    public static class PreferenceString extends PreferenceValue<String> {
        public PreferenceString(SharedPreferences preferences, String key, String defaultValue) {
            super(preferences, key, defaultValue);
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        /* renamed from: get  reason: collision with other method in class */
        public String mo473get() {
            return this.mPreferences.getString(this.mKey, (String) this.mDefaultValue);
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        public void set(String value) {
            edit().putString(this.mKey, value).apply();
        }
    }

    /* loaded from: classes2.dex */
    public static class PreferenceLongArray extends PreferenceValue<Long[]> {
        public PreferenceLongArray(SharedPreferences preferences, String key, Long[] defaultValue) {
            super(preferences, key, defaultValue);
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        /* renamed from: get  reason: collision with other method in class */
        public Long[] mo473get() {
            String s = this.mPreferences.getString(this.mKey, "");
            if (TextUtils.isEmpty(s)) {
                return (Long[]) this.mDefaultValue;
            }
            String[] ss = s.split(",");
            Long[] longs = new Long[ss.length];
            for (int i = 0; i < ss.length; i++) {
                longs[i] = Long.valueOf(Long.parseLong(ss[i]));
            }
            return longs;
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        public void set(Long[] value) {
            if (value == null || value.length == 0) {
                edit().putString(this.mKey, "").apply();
            } else {
                edit().putString(this.mKey, TextUtils.join(",", value)).apply();
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class PreferencePercent extends PreferenceInteger {
        public PreferencePercent(SharedPreferences preferences, String key, Integer defaultValue) {
            super(preferences, key, defaultValue);
        }

        public float getAsFloat() {
            Integer value = mo473get();
            if (value == null) {
                return 0.0f;
            }
            return value.intValue() / 100.0f;
        }

        public float getAsFloatInverted() {
            return 1.0f - getAsFloat();
        }
    }

    /* loaded from: classes2.dex */
    public static class PreferenceLong extends PreferenceValue<Long> {
        public PreferenceLong(SharedPreferences preferences, String key, Long defaultValue) {
            super(preferences, key, defaultValue);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vk.core.util.Preference.PreferenceValue
        /* renamed from: get */
        public Long mo473get() {
            return Long.valueOf(this.mPreferences.getLong(this.mKey, ((Long) this.mDefaultValue).longValue()));
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        public void set(Long value) {
            edit().putLong(this.mKey, value.longValue()).apply();
        }

        public void add(int value) {
            set(Long.valueOf(mo473get().longValue() + value));
        }
    }

    /* loaded from: classes2.dex */
    public static class PreferenceInteger extends PreferenceValue<Integer> {
        public PreferenceInteger(SharedPreferences preferences, String key, Integer defaultValue) {
            super(preferences, key, defaultValue);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vk.core.util.Preference.PreferenceValue
        /* renamed from: get */
        public Integer mo473get() {
            return Integer.valueOf(this.mPreferences.getInt(this.mKey, ((Integer) this.mDefaultValue).intValue()));
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        public void set(Integer value) {
            edit().putInt(this.mKey, value.intValue()).apply();
        }

        public void add(int value) {
            set(Integer.valueOf(mo473get().intValue() + value));
        }
    }

    /* loaded from: classes2.dex */
    public static class PreferenceEnumSet<T extends Enum<T>> extends PreferenceValue<EnumSet<T>> {
        private final Class<T> mClass;

        @Override // com.vk.core.util.Preference.PreferenceValue
        public /* bridge */ /* synthetic */ void set(Object obj) {
            set((EnumSet) ((EnumSet) obj));
        }

        public PreferenceEnumSet(SharedPreferences preferences, String key, Class<T> cls) {
            super(preferences, key, null);
            this.mClass = cls;
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        /* renamed from: get  reason: collision with other method in class */
        public EnumSet<T> mo473get() {
            EnumSet<T> enumSet = EnumSet.noneOf(this.mClass);
            Set<String> set = this.mPreferences.getStringSet(this.mKey, null);
            if (set != null) {
                for (String name : set) {
                    enumSet.add(Enum.valueOf(this.mClass, name));
                }
            }
            return enumSet;
        }

        public void set(EnumSet<T> value) {
            if (value == null || value.isEmpty()) {
                edit().remove(this.mKey).apply();
                return;
            }
            Set<String> set = new HashSet<>(value.size());
            Iterator it = value.iterator();
            while (it.hasNext()) {
                set.add(((Enum) it.next()).name());
            }
            edit().putStringSet(this.mKey, set).apply();
        }

        public int getCount() {
            Set<String> set = this.mPreferences.getStringSet(this.mKey, null);
            if (set == null) {
                return 0;
            }
            return set.size();
        }

        public boolean isEmpty() {
            return getCount() == 0;
        }
    }

    /* loaded from: classes2.dex */
    public static class PreferenceEnum<T extends Enum<T>> extends PreferenceValue<T> {
        private final Class<T> mClass;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.vk.core.util.Preference.PreferenceValue
        public /* bridge */ /* synthetic */ void set(Object obj) {
            set((PreferenceEnum<T>) ((Enum) obj));
        }

        public PreferenceEnum(SharedPreferences preferences, String key, T defaultValue, Class<T> cls) {
            super(preferences, key, defaultValue);
            this.mClass = cls;
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        /* renamed from: get */
        public T mo473get() {
            if (!this.mPreferences.contains(this.mKey)) {
                return (T) this.mDefaultValue;
            }
            try {
                return (T) Enum.valueOf(this.mClass, this.mPreferences.getString(this.mKey, null));
            } catch (Exception e) {
                e.printStackTrace();
                return (T) this.mDefaultValue;
            }
        }

        public void set(T value) {
            edit().putString(this.mKey, value.name()).apply();
        }
    }

    /* loaded from: classes2.dex */
    public static class PreferenceBoolean extends PreferenceValue<Boolean> {
        public PreferenceBoolean(SharedPreferences preferences, String key, Boolean defaultValue) {
            super(preferences, key, defaultValue);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vk.core.util.Preference.PreferenceValue
        /* renamed from: get */
        public Boolean mo473get() {
            return Boolean.valueOf(this.mPreferences.getBoolean(this.mKey, ((Boolean) this.mDefaultValue).booleanValue()));
        }

        @Override // com.vk.core.util.Preference.PreferenceValue
        public void set(Boolean value) {
            edit().putBoolean(this.mKey, value.booleanValue()).apply();
        }
    }
}
