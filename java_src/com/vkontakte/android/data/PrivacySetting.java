package com.vkontakte.android.data;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class PrivacySetting implements Parcelable {
    public CharSequence displayStringTmp;
    public String key;
    public List<String> possibleRules;
    public String sectionKey;
    public String title;
    public List<PrivacyRule> value;
    public static final PredefinedSet ALL = new PredefinedSet(VKApplication.context.getString(R.string.privacy_all), VKApplication.context.getString(R.string.privacy_all), "all");
    public static final PredefinedSet ONLY_ME = new PredefinedSet(VKApplication.context.getString(R.string.privacy_only_me), VKApplication.context.getString(R.string.privacy_only_me), NativeProtocol.AUDIENCE_ME);
    public static final PredefinedSet NOBODY = new PredefinedSet(VKApplication.context.getString(R.string.privacy_nobody), VKApplication.context.getString(R.string.privacy_nobody), "nobody");
    public static final PredefinedSet FRIENDS = new PredefinedSet(VKApplication.context.getString(R.string.privacy_friends), VKApplication.context.getString(R.string.privacy_friends), "friends");
    public static final PredefinedSet FRIENDS_OF_FRIENDS = new PredefinedSet(VKApplication.context.getString(R.string.privacy_friends_of_friends), VKApplication.context.getString(R.string.privacy_friends_of_friends), "friends_of_friends");
    public static final PredefinedSet FRIENDS_OF_FRIENDS_ONLY = new PredefinedSet(VKApplication.context.getString(R.string.privacy_friends_of_friends_only), VKApplication.context.getString(R.string.privacy_friends_of_friends_only), "friends_of_friends_only");
    public static final Parcelable.Creator<PrivacySetting> CREATOR = new Parcelable.Creator<PrivacySetting>() { // from class: com.vkontakte.android.data.PrivacySetting.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public PrivacySetting mo972createFromParcel(Parcel source) {
            return new PrivacySetting(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public PrivacySetting[] mo973newArray(int size) {
            return new PrivacySetting[size];
        }
    };

    /* loaded from: classes.dex */
    public static abstract class PrivacyRule extends Serializer.SerializableAdapter {
        public abstract List<String> apiValue();

        public abstract String displayValue();

        public abstract String getEditTitle();
    }

    /* loaded from: classes2.dex */
    public static abstract class UserListPrivacyRule extends PrivacyRule {
        public abstract void add(int i);

        public abstract int userCount();

        public abstract int userIdAt(int i);
    }

    public PrivacySetting() {
        this.value = new ArrayList();
        this.possibleRules = new ArrayList();
    }

    public PrivacySetting(JSONObject o) throws JSONException {
        this.value = new ArrayList();
        this.possibleRules = new ArrayList();
        this.key = o.getString("key");
        this.title = o.getString("title");
        this.sectionKey = o.getString(ServerKeys.SECTION);
        JSONArray val = o.getJSONArray("value");
        this.value.addAll(parseApiValue(val));
        JSONArray allowed = o.getJSONArray("supported_values");
        for (int i = 0; i < allowed.length(); i++) {
            this.possibleRules.add(allowed.getString(i));
        }
    }

    public PrivacySetting(PrivacySetting other) {
        this.value = new ArrayList();
        this.possibleRules = new ArrayList();
        this.key = other.key;
        this.title = other.title;
        this.sectionKey = other.sectionKey;
        this.value.addAll(other.value);
        this.possibleRules.addAll(other.possibleRules);
    }

    public String getApiValue() {
        ArrayList<String> v = new ArrayList<>();
        for (PrivacyRule rule : this.value) {
            v.addAll(rule.apiValue());
        }
        return TextUtils.join(",", v);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x002e, code lost:
        if (r7.equals("friends") != false) goto L4;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<com.vkontakte.android.data.PrivacySetting.PrivacyRule> parseApiValue(org.json.JSONArray r13) throws org.json.JSONException {
        /*
            Method dump skipped, instructions count: 322
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.data.PrivacySetting.parseApiValue(org.json.JSONArray):java.util.List");
    }

    public String getDisplayString() {
        if (this.value.size() == 1 && !(this.value.get(0) instanceof UserListPrivacyRule)) {
            String subtitle = this.value.get(0).displayValue();
            return subtitle;
        }
        StringBuilder buf = new StringBuilder();
        for (PrivacyRule rule : this.value) {
            buf.append(rule.displayValue());
            if (rule instanceof UserListPrivacyRule) {
                buf.append(' ');
                UserListPrivacyRule l = (UserListPrivacyRule) rule;
                for (int i = 0; i < l.userCount(); i++) {
                    int uid = l.userIdAt(i);
                    if (uid < 2000000000) {
                        UserProfile p = Friends.get(uid);
                        if (p != null) {
                            buf.append(p.fullName);
                        } else {
                            buf.append("id");
                            buf.append(uid);
                        }
                    } else {
                        int lid = uid - 2000000000;
                        Friends.Folder ff = Friends.getListById(lid);
                        if (ff != null) {
                            buf.append(ff.name);
                        } else {
                            buf.append(ArgKeys.LIST);
                            buf.append(lid);
                        }
                    }
                    if (i != l.userCount() - 1) {
                        buf.append(", ");
                    }
                }
            }
        }
        String subtitle2 = buf.toString();
        return subtitle2;
    }

    /* loaded from: classes2.dex */
    public static class Include extends UserListPrivacyRule {
        public static final Serializer.Creator<Include> CREATOR = new Serializer.CreatorAdapter<Include>() { // from class: com.vkontakte.android.data.PrivacySetting.Include.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Include mo1087createFromSerializer(Serializer s) {
                return new Include(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Include[] mo1088newArray(int size) {
                return new Include[size];
            }
        };
        private ArrayList<Integer> values;

        public Include() {
            this.values = new ArrayList<>();
        }

        @Override // com.vkontakte.android.data.PrivacySetting.UserListPrivacyRule
        public void add(int uid) {
            this.values.add(Integer.valueOf(uid));
        }

        @Override // com.vkontakte.android.data.PrivacySetting.UserListPrivacyRule
        public int userCount() {
            return this.values.size();
        }

        @Override // com.vkontakte.android.data.PrivacySetting.UserListPrivacyRule
        public int userIdAt(int i) {
            return this.values.get(i).intValue();
        }

        @Override // com.vkontakte.android.data.PrivacySetting.PrivacyRule
        public List<String> apiValue() {
            ArrayList<String> v = new ArrayList<>();
            Iterator<Integer> it = this.values.iterator();
            while (it.hasNext()) {
                int id = it.next().intValue();
                if (id < 2000000000) {
                    v.add(id + "");
                } else {
                    v.add(ArgKeys.LIST + (id - 2000000000));
                }
            }
            return v;
        }

        @Override // com.vkontakte.android.data.PrivacySetting.PrivacyRule
        public String displayValue() {
            boolean onlyLists = true;
            Iterator<Integer> it = this.values.iterator();
            while (it.hasNext()) {
                int v = it.next().intValue();
                if (v < 2000000000) {
                    onlyLists = false;
                }
            }
            return VKApplication.context.getString(onlyLists ? R.string.privacy_some_lists : R.string.privacy_some);
        }

        @Override // com.vkontakte.android.data.PrivacySetting.PrivacyRule
        public String getEditTitle() {
            return VKApplication.context.getString(R.string.privacy_edit_some);
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            s.writeInt(this.values.size());
            Iterator<Integer> it = this.values.iterator();
            while (it.hasNext()) {
                int v = it.next().intValue();
                s.writeInt(v);
            }
        }

        private Include(Serializer in) {
            this.values = new ArrayList<>();
            int l = in.readInt();
            for (int i = 0; i < l; i++) {
                this.values.add(Integer.valueOf(in.readInt()));
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class Exclude extends UserListPrivacyRule {
        public static final Serializer.Creator<Exclude> CREATOR = new Serializer.CreatorAdapter<Exclude>() { // from class: com.vkontakte.android.data.PrivacySetting.Exclude.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Exclude mo1087createFromSerializer(Serializer s) {
                return new Exclude(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Exclude[] mo1088newArray(int size) {
                return new Exclude[size];
            }
        };
        private ArrayList<Integer> values;

        public Exclude() {
            this.values = new ArrayList<>();
        }

        @Override // com.vkontakte.android.data.PrivacySetting.UserListPrivacyRule
        public void add(int uid) {
            this.values.add(Integer.valueOf(uid));
        }

        @Override // com.vkontakte.android.data.PrivacySetting.UserListPrivacyRule
        public int userCount() {
            return this.values.size();
        }

        @Override // com.vkontakte.android.data.PrivacySetting.UserListPrivacyRule
        public int userIdAt(int i) {
            return this.values.get(i).intValue();
        }

        @Override // com.vkontakte.android.data.PrivacySetting.PrivacyRule
        public List<String> apiValue() {
            ArrayList<String> v = new ArrayList<>();
            Iterator<Integer> it = this.values.iterator();
            while (it.hasNext()) {
                int id = it.next().intValue();
                if (id < 2000000000) {
                    v.add("-" + id + "");
                } else {
                    v.add("-list" + (id - 2000000000));
                }
            }
            return v;
        }

        @Override // com.vkontakte.android.data.PrivacySetting.PrivacyRule
        public String displayValue() {
            return VKApplication.context.getString(R.string.privacy_exclude);
        }

        @Override // com.vkontakte.android.data.PrivacySetting.PrivacyRule
        public String getEditTitle() {
            return "";
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            s.writeInt(this.values.size());
            Iterator<Integer> it = this.values.iterator();
            while (it.hasNext()) {
                int v = it.next().intValue();
                s.writeInt(v);
            }
        }

        private Exclude(Serializer in) {
            this.values = new ArrayList<>();
            int l = in.readInt();
            for (int i = 0; i < l; i++) {
                this.values.add(Integer.valueOf(in.readInt()));
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class PredefinedSet extends PrivacyRule {
        public static final Serializer.Creator<PredefinedSet> CREATOR = new Serializer.CreatorAdapter<PredefinedSet>() { // from class: com.vkontakte.android.data.PrivacySetting.PredefinedSet.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public PredefinedSet mo1087createFromSerializer(Serializer s) {
                return new PredefinedSet(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public PredefinedSet[] mo1088newArray(int size) {
                return new PredefinedSet[size];
            }
        };
        private String editTitle;
        private String title;
        private String value;

        public PredefinedSet(String title, String editTitle, String value) {
            this.title = title;
            this.value = value;
            this.editTitle = editTitle;
        }

        @Override // com.vkontakte.android.data.PrivacySetting.PrivacyRule
        public List<String> apiValue() {
            return Collections.singletonList(this.value);
        }

        @Override // com.vkontakte.android.data.PrivacySetting.PrivacyRule
        public String displayValue() {
            return this.title;
        }

        @Override // com.vkontakte.android.data.PrivacySetting.PrivacyRule
        public String getEditTitle() {
            return this.editTitle;
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            s.writeString(this.title);
            s.writeString(this.value);
            s.writeString(this.editTitle);
        }

        private PredefinedSet(Serializer in) {
            this.title = in.readString();
            this.value = in.readString();
            this.editTitle = in.readString();
        }

        public boolean equals(Object o) {
            return (o instanceof PredefinedSet) && this.value.equals(((PredefinedSet) o).value);
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.key);
        dest.writeString(this.title);
        dest.writeString(this.sectionKey);
        dest.writeInt(this.value.size());
        for (PrivacyRule r : this.value) {
            dest.writeParcelable(r, 0);
        }
        dest.writeInt(this.possibleRules.size());
        for (String v : this.possibleRules) {
            dest.writeString(v);
        }
    }

    private PrivacySetting(Parcel in) {
        this.value = new ArrayList();
        this.possibleRules = new ArrayList();
        this.key = in.readString();
        this.title = in.readString();
        this.sectionKey = in.readString();
        int l = in.readInt();
        for (int i = 0; i < l; i++) {
            this.value.add((PrivacyRule) in.readParcelable(PrivacyRule.class.getClassLoader()));
        }
        int l2 = in.readInt();
        for (int i2 = 0; i2 < l2; i2++) {
            this.possibleRules.add(in.readString());
        }
    }
}
