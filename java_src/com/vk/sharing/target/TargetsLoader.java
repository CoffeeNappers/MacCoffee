package com.vk.sharing.target;

import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Messages;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public final class TargetsLoader {
    public static final int TARGETS_PORTION = 10;
    @Nullable
    private Callback callback;
    private volatile boolean loadingDialogs;
    private volatile boolean loadingGroups;
    @NonNull
    private final Handler mainHandler = new Handler(VKApplication.context.getMainLooper());
    private volatile boolean searching;

    /* loaded from: classes2.dex */
    public interface Callback {
        void onDialogLoadingCompleted(@NonNull ArrayList<Target> arrayList);

        void onDialogLoadingFailed();

        void onDialogSearchingCompleted(@NonNull ArrayList<Target> arrayList);

        void onDialogSearchingFailed();

        void onGroupLoadingCompleted(@NonNull ArrayList<Target> arrayList);

        void onGroupLoadingFailed();

        void onGroupSearchingCompleted(@NonNull ArrayList<Target> arrayList);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @NonNull
    public static ArrayList<Target> mapDialogEntries(@Nullable Collection<DialogEntry> dialogEntries) {
        ArrayList<Target> targets = new ArrayList<>();
        if (dialogEntries != null) {
            for (DialogEntry dialogEntry : dialogEntries) {
                targets.add(new Target(dialogEntry.profile));
            }
        }
        return targets;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @NonNull
    public static ArrayList<Target> mapUserProfiles(@Nullable Collection<UserProfile> userProfiles) {
        ArrayList<Target> targets = new ArrayList<>();
        if (userProfiles != null) {
            for (UserProfile userProfile : userProfiles) {
                targets.add(new Target(userProfile));
            }
        }
        return targets;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @NonNull
    public static ArrayList<Target> mapGroups(@Nullable Collection<Group> groups) {
        ArrayList<Target> targets = new ArrayList<>();
        if (groups != null) {
            for (Group group : groups) {
                if (group.deactivation == null || group.deactivation.isEmpty()) {
                    targets.add(new Target(group));
                }
            }
        }
        return targets;
    }

    public void setCallback(@Nullable Callback callback) {
        this.callback = callback;
    }

    public void loadDialogs(int offset) {
        if (!this.loadingDialogs) {
            toggleLoadingDialogs();
            Messages.getDialogs(offset, 10, new AnonymousClass1());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.sharing.target.TargetsLoader$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements Messages.GetDialogsCallback {
        AnonymousClass1() {
        }

        @Override // com.vkontakte.android.data.Messages.GetDialogsCallback
        public void onDialogsLoaded(ArrayList<DialogEntry> dlgs) {
            TargetsLoader.this.toggleLoadingDialogs();
            ArrayList<Target> targets = TargetsLoader.mapDialogEntries(dlgs);
            TargetsLoader.this.mainHandler.post(TargetsLoader$1$$Lambda$1.lambdaFactory$(this, targets));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onDialogsLoaded$0(ArrayList targets) {
            TargetsLoader.this.callbackDialogLoadingCompleted(targets);
        }

        @Override // com.vkontakte.android.data.Messages.GetDialogsCallback
        public void onError(int ecode, String emsg) {
            TargetsLoader.this.toggleLoadingDialogs();
            TargetsLoader.this.mainHandler.post(TargetsLoader$1$$Lambda$2.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onError$1() {
            TargetsLoader.this.callbackDialogLoadingError();
        }
    }

    public void loadGroups() {
        if (!this.loadingGroups) {
            toggleLoadingGroups();
            Groups.getGroups(2, new AnonymousClass2());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.sharing.target.TargetsLoader$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements Groups.GetGroupsCallback {
        AnonymousClass2() {
        }

        @Override // com.vkontakte.android.data.Groups.GetGroupsCallback
        public void onResult(@NonNull List<Group> groups) {
            TargetsLoader.this.toggleLoadingGroups();
            ArrayList<Target> targets = TargetsLoader.mapGroups(groups);
            TargetsLoader.this.mainHandler.post(TargetsLoader$2$$Lambda$1.lambdaFactory$(this, targets));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onResult$0(ArrayList targets) {
            TargetsLoader.this.callbackGroupLoadingCompleted(targets);
        }

        @Override // com.vkontakte.android.data.Groups.GetGroupsCallback
        public void onError() {
            TargetsLoader.this.toggleLoadingGroups();
            TargetsLoader.this.mainHandler.post(TargetsLoader$2$$Lambda$2.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onError$1() {
            TargetsLoader.this.callbackGroupLoadingError();
        }
    }

    public void loadGroupsForImpersonation(int adminedGroupId) {
        if (!this.loadingGroups) {
            toggleLoadingGroups();
            GroupsForCommentsImpersonation.getInstance().load(new AnonymousClass3(adminedGroupId));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.sharing.target.TargetsLoader$3  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass3 implements com.vkontakte.android.api.Callback<ArrayList<Group>> {
        final /* synthetic */ int val$adminedGroupId;

        AnonymousClass3(int i) {
            this.val$adminedGroupId = i;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: com.vk.sharing.target.TargetsLoader$3$1  reason: invalid class name */
        /* loaded from: classes2.dex */
        public class AnonymousClass1 implements Groups.GetGroupsCallback {
            final /* synthetic */ ArrayList val$impersGroups;

            AnonymousClass1(ArrayList arrayList) {
                this.val$impersGroups = arrayList;
            }

            @Override // com.vkontakte.android.data.Groups.GetGroupsCallback
            public void onResult(@NonNull List<Group> adminedGroups) {
                TargetsLoader.this.toggleLoadingGroups();
                Group admGroup = new Group();
                admGroup.id = AnonymousClass3.this.val$adminedGroupId;
                if (!this.val$impersGroups.contains(admGroup)) {
                    Iterator<Group> it = adminedGroups.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        Group g = it.next();
                        if (g.id == AnonymousClass3.this.val$adminedGroupId) {
                            this.val$impersGroups.add(g);
                            break;
                        }
                    }
                }
                ArrayList<Target> targets = TargetsLoader.mapGroups(this.val$impersGroups);
                TargetsLoader.this.mainHandler.post(TargetsLoader$3$1$$Lambda$1.lambdaFactory$(this, targets));
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            public /* synthetic */ void lambda$onResult$0(ArrayList targets) {
                TargetsLoader.this.callbackGroupLoadingCompleted(targets);
            }

            @Override // com.vkontakte.android.data.Groups.GetGroupsCallback
            public void onError() {
                TargetsLoader.this.toggleLoadingGroups();
                TargetsLoader.this.mainHandler.post(TargetsLoader$3$1$$Lambda$2.lambdaFactory$(this));
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            public /* synthetic */ void lambda$onError$1() {
                TargetsLoader.this.callbackGroupLoadingError();
            }
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(ArrayList<Group> impersGroups) {
            Groups.getGroups(2, new AnonymousClass1(impersGroups));
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            TargetsLoader.this.toggleLoadingGroups();
            TargetsLoader.this.mainHandler.post(TargetsLoader$3$$Lambda$1.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$0() {
            TargetsLoader.this.callbackGroupLoadingError();
        }
    }

    public void searchDialogs(@NonNull String query) {
        if (!this.searching) {
            toggleSearching();
            Messages.searchDialogs(query, new AnonymousClass4());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.sharing.target.TargetsLoader$4  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass4 implements Messages.SearchDialogsCallback {
        AnonymousClass4() {
        }

        @Override // com.vkontakte.android.data.Messages.SearchDialogsCallback
        public void onResult(List<UserProfile> dlgs) {
            TargetsLoader.this.toggleSearching();
            ArrayList<Target> targets = TargetsLoader.mapUserProfiles(dlgs);
            TargetsLoader.this.mainHandler.post(TargetsLoader$4$$Lambda$1.lambdaFactory$(this, targets));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onResult$0(ArrayList targets) {
            TargetsLoader.this.callbackDialogSearchCompleted(targets);
        }

        @Override // com.vkontakte.android.data.Messages.SearchDialogsCallback
        public void onError(int ecode, String emsg) {
            TargetsLoader.this.toggleSearching();
            TargetsLoader.this.mainHandler.post(TargetsLoader$4$$Lambda$2.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onError$1() {
            TargetsLoader.this.callbackDialogSearchFailed();
        }
    }

    public void searchGroups(@NonNull String query) {
        if (!this.searching) {
            toggleSearching();
            Groups.search(query, 2, TargetsLoader$$Lambda$1.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$searchGroups$1(List groups) {
        toggleSearching();
        ArrayList<Target> targets = mapGroups(groups);
        this.mainHandler.post(TargetsLoader$$Lambda$2.lambdaFactory$(this, targets));
    }

    public boolean isLoadingDialogs() {
        return this.loadingDialogs;
    }

    public boolean isLoadingGroups() {
        return this.loadingGroups;
    }

    public boolean isSearching() {
        return this.searching;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void callbackDialogLoadingCompleted(@NonNull ArrayList<Target> targets) {
        if (this.callback != null) {
            this.callback.onDialogLoadingCompleted(targets);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void callbackDialogLoadingError() {
        if (this.callback != null) {
            this.callback.onDialogLoadingFailed();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void callbackDialogSearchCompleted(@NonNull ArrayList<Target> targets) {
        if (this.callback != null) {
            this.callback.onDialogSearchingCompleted(targets);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void callbackDialogSearchFailed() {
        if (this.callback != null) {
            this.callback.onDialogSearchingFailed();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void callbackGroupLoadingCompleted(@NonNull ArrayList<Target> targets) {
        if (this.callback != null) {
            this.callback.onGroupLoadingCompleted(targets);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void callbackGroupLoadingError() {
        if (this.callback != null) {
            this.callback.onGroupLoadingFailed();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: callbackGroupSearchCompleted */
    public void lambda$null$0(@NonNull ArrayList<Target> targets) {
        if (this.callback != null) {
            this.callback.onGroupSearchingCompleted(targets);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void toggleLoadingDialogs() {
        this.loadingDialogs = !this.loadingDialogs;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void toggleLoadingGroups() {
        this.loadingGroups = !this.loadingGroups;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void toggleSearching() {
        this.searching = !this.searching;
    }
}
