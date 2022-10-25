package com.vkontakte.android.ui;

import android.text.TextUtils;
import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.ViewGroup;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.friends.SearchIndexer;
import com.vkontakte.android.ui.holder.messages.MessageListItem;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class MentionsAdapter extends UsableRecyclerView.Adapter<MentionViewHolder> {
    private static final String EMPTY_QUERY = "%empty%";
    private MentionsManager mentionsManager;
    private ArrayList<UserProfile> userProfiles;
    private ArrayList<UserProfile> userProfilesFiltered;
    private SparseIntArray userPriorities = new SparseIntArray();
    private SearchIndexer<UserProfile> searchIndexer = new SearchIndexer<>(new SearchIndexer.SimpleProvider<UserProfile>() { // from class: com.vkontakte.android.ui.MentionsAdapter.1
        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public char[] getIndexChar(UserProfile from) {
            char c = ' ';
            char[] cArr = new char[5];
            cArr[0] = '%';
            cArr[1] = 'i';
            cArr[2] = TextUtils.isEmpty(from.firstName) ? ' ' : Character.toLowerCase(from.firstName.charAt(0));
            cArr[3] = TextUtils.isEmpty(from.lastName) ? ' ' : Character.toLowerCase(from.lastName.charAt(0));
            if (from.domain != null && from.getHasRealDomain()) {
                c = Character.toLowerCase(from.domain.charAt(0));
            }
            cArr[4] = c;
            return cArr;
        }

        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public boolean matches(String q, UserProfile item) {
            return q.equals(MentionsAdapter.EMPTY_QUERY) || (q.startsWith("id") && Integer.toString(item.uid).startsWith(q.substring(2))) || item.firstName.toLowerCase().startsWith(q) || item.lastName.toLowerCase().startsWith(q) || (item.getHasRealDomain() && item.domain.startsWith(q));
        }

        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.SimpleProvider, com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public boolean hasPriority() {
            return true;
        }

        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.SimpleProvider, com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public int priority(String query, UserProfile item) {
            return MentionsAdapter.this.userPriorities.get(item.uid, 0);
        }
    });

    public void setUsers(SparseArray<UserProfile> userProfiles) {
        if (userProfiles != null) {
            ArrayList<UserProfile> profilesArray = new ArrayList<>(userProfiles.size());
            for (int i = 0; i < userProfiles.size(); i++) {
                UserProfile up = userProfiles.valueAt(i);
                if (up != null && !VKAccountManager.isCurrentUser(up.uid)) {
                    profilesArray.add(userProfiles.valueAt(i));
                }
            }
            setUsers(profilesArray);
        }
    }

    public int findExactMatch(String query) {
        Iterator<UserProfile> it = this.userProfiles.iterator();
        while (it.hasNext()) {
            UserProfile up = it.next();
            if ((!query.isEmpty() && query.equalsIgnoreCase(up.domain)) || (query.startsWith("id") && Integer.toString(up.uid).equals(query.substring(2)))) {
                return up.uid;
            }
        }
        return 0;
    }

    public void buildUserPriorities(ArrayList<MessageListItem> messages) {
        this.userPriorities.clear();
        for (int i = Math.max(messages.size() - 100, 0); i < messages.size(); i++) {
            this.userPriorities.put(messages.get(i).sender, i);
        }
    }

    public void setUsers(ArrayList<UserProfile> userProfiles) {
        if (userProfiles != null) {
            this.userProfiles = userProfiles;
            this.searchIndexer.bind(userProfiles);
            this.searchIndexer.build();
            if (this.userProfilesFiltered == null) {
                this.userProfilesFiltered = userProfiles;
            }
            notifyDataSetChanged();
        }
    }

    public MentionsAdapter(MentionsManager mentionsManager) {
        this.mentionsManager = mentionsManager;
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder  reason: collision with other method in class */
    public MentionViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        return new MentionViewHolder(parent, this.mentionsManager);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(MentionViewHolder holder, int position) {
        holder.bind(this.userProfilesFiltered.get(position));
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        if (this.userProfilesFiltered == null) {
            return 0;
        }
        return this.userProfilesFiltered.size();
    }

    public void filterResults(String query) {
        SearchIndexer<UserProfile> searchIndexer = this.searchIndexer;
        if (query.isEmpty()) {
            query = EMPTY_QUERY;
        }
        ArrayList<UserProfile> filtered = searchIndexer.search(query);
        this.userProfilesFiltered = filtered;
        notifyDataSetChanged();
    }
}
