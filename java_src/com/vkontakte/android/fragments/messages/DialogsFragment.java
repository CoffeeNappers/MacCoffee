package com.vkontakte.android.fragments.messages;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.PorterDuff;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.widget.LinearLayoutManager;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.Global;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.Message;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.R;
import com.vkontakte.android.ShortcutManagerWrapper;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.users.GetOnlines;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.VKToolbarFragment;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.EmptyView;
import com.vkontakte.android.ui.ErrorViewHelper;
import com.vkontakte.android.ui.LoadMoreFooterView;
import com.vkontakte.android.ui.MessagesSearchSuggestionsPopup;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.holder.messages.DialogHolder;
import com.vkontakte.android.utils.ApiMethodsHelper;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class DialogsFragment extends VKToolbarFragment implements BackListener {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final int REQ_CREATE_CHAT = 323;
    private static final int REQ_SELECT_USER = 321;
    private static final int REQ_SELECT_USERS = 322;
    private static final int[] TEXTS;
    private DialogsAdapter adapter;
    @Nullable
    private FrameLayout contentWrap;
    @Nullable
    private View emptyView;
    @Nullable
    private ErrorViewHelper error;
    private FloatingActionButton floatingActionButton;
    @Nullable
    private LoadMoreFooterView footerView;
    @Nullable
    private UsableRecyclerView list;
    @Nullable
    private ProgressBar progress;
    public String searchQuery;
    private SearchViewWrapper searchView;
    public SelectionListener selListener;
    private MessagesSearchSuggestionsPopup suggester;
    private CharSequence title;
    @Nullable
    private View toolbarStatePanel;
    @Nullable
    private ProgressBar toolbarStatePanelProgress;
    @Nullable
    private TextView toolbarStatePanelText;
    private ArrayList<DialogEntry> dlgs = new ArrayList<>();
    private ArrayList<DialogEntry> searchResults = new ArrayList<>();
    private ArrayList<UserProfile> selectedTempUsers = new ArrayList<>();
    private ArrayList<DialogEntry> displayItems = this.dlgs;
    private boolean dataLoading = false;
    private BroadcastReceiver receiver = new AnonymousClass1();
    private boolean moreAvailable = true;
    private boolean isSearchExpanded = false;

    /* loaded from: classes3.dex */
    public interface SelectionListener {
        void onItemSelected(DialogEntry dialogEntry);
    }

    static {
        $assertionsDisabled = !DialogsFragment.class.desiredAssertionStatus();
        TEXTS = new int[]{R.string.state_no_connection, R.string.state_updating, R.string.state_connecting, R.string.state_connected};
    }

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(DialogsFragment.class);
        }

        public Builder setSelectMode() {
            this.args.putBoolean(ArgKeys.SELECT, true);
            return this;
        }
    }

    /* renamed from: com.vkontakte.android.fragments.messages.DialogsFragment$1 */
    /* loaded from: classes3.dex */
    public class AnonymousClass1 extends BroadcastReceiver {
        AnonymousClass1() {
            DialogsFragment.this = this$0;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (LongPollService.ACTION_NEW_MESSAGE.equals(intent.getAction())) {
                if (DialogsFragment.this.dlgs != null) {
                    Message msg = (Message) intent.getParcelableExtra("message");
                    int peer = intent.getIntExtra("peer_id", 0);
                    boolean found = false;
                    int j = 0;
                    while (true) {
                        if (j >= DialogsFragment.this.dlgs.size()) {
                            break;
                        }
                        DialogEntry e = (DialogEntry) DialogsFragment.this.dlgs.get(j);
                        if (e.profile == null || e.lastMessage == null || e.profile.uid != peer) {
                            j++;
                        } else {
                            if (!msg.out && !msg.readState) {
                                e.unreadCount++;
                            }
                            if (e.lastMessage.id > msg.id && e.lastMessage.id > 0 && msg.id > 0) {
                                DialogsFragment.this.updateList();
                                return;
                            }
                            e.lastMessage = msg;
                            e.lastMessagePhoto = intent.getStringExtra("sender_photo");
                            if (DialogsFragment.this.dlgs.size() > 1) {
                                DialogsFragment.this.dlgs.remove(e);
                                boolean wasAdd = false;
                                int i = 0;
                                while (true) {
                                    if (i >= DialogsFragment.this.dlgs.size()) {
                                        break;
                                    } else if (((DialogEntry) DialogsFragment.this.dlgs.get(i)).lastMessage.time <= e.lastMessage.time) {
                                        DialogsFragment.this.dlgs.add(Math.max(i - 1, 0), e);
                                        wasAdd = true;
                                        break;
                                    } else {
                                        i++;
                                    }
                                }
                                if (!wasAdd) {
                                    DialogsFragment.this.dlgs.add(e);
                                }
                            }
                            DialogsFragment.this.preventDuplicates();
                            DialogsFragment.this.updateList();
                            found = true;
                        }
                    }
                    if (!found) {
                        Messages.getUnreadCount(peer, DialogsFragment$1$$Lambda$1.lambdaFactory$(this, msg, intent));
                    }
                } else {
                    return;
                }
            }
            if (LongPollService.ACTION_UPDATE_MESSAGE.equals(intent.getAction())) {
                if (DialogsFragment.this.dlgs != null) {
                    Message msg2 = (Message) intent.getParcelableExtra("message");
                    int peer2 = intent.getIntExtra("peer_id", 0);
                    for (int j2 = 0; j2 < DialogsFragment.this.dlgs.size(); j2++) {
                        DialogEntry e2 = (DialogEntry) DialogsFragment.this.dlgs.get(j2);
                        if (e2.profile != null && e2.lastMessage != null && e2.profile.uid == peer2 && e2.lastMessage.id == msg2.id) {
                            e2.lastMessage = msg2;
                            DialogsFragment.this.updateList();
                            return;
                        }
                    }
                } else {
                    return;
                }
            }
            if (LongPollService.ACTION_MESSAGE_RSTATE_CHANGED.equals(intent.getAction())) {
                int msg3 = intent.getIntExtra(LongPollService.EXTRA_MSG_ID, 0);
                boolean state = intent.getBooleanExtra(LongPollService.EXTRA_READ_STATE, false);
                if (intent.hasExtra("le")) {
                    int peer3 = intent.getIntExtra("peer_id", 0);
                    boolean in = intent.getBooleanExtra("in", false);
                    boolean needUpdate = false;
                    for (int i2 = 0; i2 < DialogsFragment.this.dlgs.size(); i2++) {
                        DialogEntry e3 = (DialogEntry) DialogsFragment.this.dlgs.get(i2);
                        if (e3.lastMessage.peer == peer3 && e3.lastMessage.id <= msg3 && e3.lastMessage.out != in) {
                            e3.lastMessage.readState = state;
                            e3.unreadCount = 0;
                            needUpdate = true;
                        }
                    }
                    if (needUpdate) {
                        DialogsFragment.this.updateList();
                    }
                } else {
                    int i3 = 0;
                    while (true) {
                        if (i3 >= DialogsFragment.this.dlgs.size()) {
                            break;
                        }
                        DialogEntry e4 = (DialogEntry) DialogsFragment.this.dlgs.get(i3);
                        if (e4.lastMessage.id != msg3) {
                            i3++;
                        } else {
                            e4.lastMessage.readState = state;
                            DialogsFragment.this.updateList();
                            break;
                        }
                    }
                }
            }
            if (LongPollService.ACTION_REFRESH_DIALOGS_LIST.equals(intent.getAction())) {
                DialogsFragment.this.loadData(true);
            } else if (LongPollService.ACTION_USER_PRESENCE.equals(intent.getAction())) {
                int uid = intent.getIntExtra(ArgKeys.UID, 0);
                int online = intent.getIntExtra("online", 0);
                for (int i4 = 0; i4 < DialogsFragment.this.dlgs.size(); i4++) {
                    DialogEntry e5 = (DialogEntry) DialogsFragment.this.dlgs.get(i4);
                    if (e5.profile.uid == uid) {
                        e5.profile.online = online;
                        DialogsFragment.this.updateList();
                    }
                }
            } else if (LongPollService.ACTION_CHAT_CHANGED.equals(intent.getAction())) {
                int cid = intent.getIntExtra("id", 0);
                int i5 = 0;
                while (true) {
                    if (i5 >= DialogsFragment.this.dlgs.size()) {
                        break;
                    }
                    DialogEntry e6 = (DialogEntry) DialogsFragment.this.dlgs.get(i5);
                    if (e6.lastMessage.peer != 2000000000 + cid) {
                        i5++;
                    } else {
                        Messages.getChatUsers(cid, DialogsFragment$1$$Lambda$2.lambdaFactory$(this, e6));
                        break;
                    }
                }
            } else if (LongPollService.ACTION_DIALOG_CHANGED.equals(intent.getAction())) {
                int cid2 = intent.getIntExtra("id", 0);
                int i6 = 0;
                while (true) {
                    if (i6 >= DialogsFragment.this.dlgs.size()) {
                        break;
                    } else if (((DialogEntry) DialogsFragment.this.dlgs.get(i6)).lastMessage.peer == cid2) {
                        DialogsFragment.this.updateList(true);
                        break;
                    } else {
                        i6++;
                    }
                }
            } else if (LongPollService.ACTION_MUTE_CHANGED.equals(intent.getAction())) {
                DialogsFragment.this.updateList(true);
            } else if (LongPollService.ACTION_COMMUNITY_MESSAGES_BLOCK_CHANGED.equals(intent.getAction())) {
                int cid3 = intent.getIntExtra("id", 0);
                int i7 = 0;
                while (true) {
                    if (i7 >= DialogsFragment.this.dlgs.size()) {
                        break;
                    }
                    DialogEntry e7 = (DialogEntry) DialogsFragment.this.dlgs.get(i7);
                    if (e7.lastMessage.peer != cid3) {
                        i7++;
                    } else {
                        Bundle extra = e7.profile.extra;
                        if (extra == null) {
                            extra = new Bundle();
                        }
                        extra.putBoolean("is_messages_blocked", intent.getBooleanExtra("is_messages_blocked", false));
                        e7.profile.extra = extra;
                        DialogsFragment.this.updateList(true);
                    }
                }
            }
            if (LongPollService.ACTION_TYPING.equals(intent.getAction())) {
                int peerId = intent.getIntExtra(ArgKeys.UID, 0);
                for (int i8 = 0; i8 < DialogsFragment.this.dlgs.size(); i8++) {
                    DialogEntry e8 = (DialogEntry) DialogsFragment.this.dlgs.get(i8);
                    if (e8.lastMessage != null && e8.lastMessage.peer == peerId && LongPollService.longPollRunning && Global.longPoll != null) {
                        try {
                            Friends.getUsers(Global.longPoll.getTypings(peerId), DialogsFragment$1$$Lambda$3.lambdaFactory$(this, e8));
                        } catch (Exception e9) {
                        }
                    }
                }
            }
            if (LongPollService.ACTION_STATE_CHANGED.equals(intent.getAction())) {
                DialogsFragment.this.updateState(intent.getIntExtra("state", 0));
            }
        }

        public /* synthetic */ void lambda$onReceive$3(Message msg, Intent intent, int peer1, int unread) {
            if (peer1 < 2000000000) {
                if (DialogsFragment.this.getActivity() != null) {
                    DialogsFragment.this.getActivity().runOnUiThread(DialogsFragment$1$$Lambda$5.lambdaFactory$(this, msg, intent, unread));
                    return;
                }
                return;
            }
            DialogEntry e = new DialogEntry();
            e.lastMessage = msg;
            e.lastMessagePhoto = intent.getStringExtra("sender_photo");
            e.updateMutedState();
            Messages.getChatUsers(peer1 - 2000000000, DialogsFragment$1$$Lambda$6.lambdaFactory$(this, peer1, e, unread));
        }

        public /* synthetic */ void lambda$null$0(Message msg, Intent intent, int unread) {
            DialogEntry e = new DialogEntry();
            e.lastMessage = msg;
            e.lastMessagePhoto = intent.getStringExtra("sender_photo");
            e.profile = (UserProfile) intent.getParcelableExtra("peer_profile");
            e.unreadCount = unread;
            DialogsFragment.this.dlgs.add(0, e);
            DialogsFragment.this.preventDuplicates();
            DialogsFragment.this.updateList();
        }

        public /* synthetic */ void lambda$null$2(int peer1, DialogEntry e, int unread, ArrayList users, String title, String photo) {
            UserProfile p = new UserProfile();
            p.uid = peer1;
            p.photo = photo;
            p.fullName = title;
            e.profile = p;
            e.unreadCount = unread;
            if (DialogsFragment.this.getActivity() != null) {
                DialogsFragment.this.getActivity().runOnUiThread(DialogsFragment$1$$Lambda$7.lambdaFactory$(this, e));
            }
        }

        public /* synthetic */ void lambda$null$1(DialogEntry e) {
            DialogsFragment.this.dlgs.add(0, e);
            DialogsFragment.this.preventDuplicates();
            DialogsFragment.this.updateList();
        }

        public /* synthetic */ void lambda$onReceive$4(DialogEntry e, ArrayList users, String title, String photo) {
            e.profile.fullName = title;
            if (photo != null) {
                e.profile.photo = photo;
            }
            DialogsFragment.this.updateList(true);
        }

        public /* synthetic */ void lambda$onReceive$6(DialogEntry entry, ArrayList users) {
            if (DialogsFragment.this.getActivity() != null) {
                DialogsFragment.this.getActivity().runOnUiThread(DialogsFragment$1$$Lambda$4.lambdaFactory$(this, entry, users));
            }
        }

        public /* synthetic */ void lambda$null$5(DialogEntry entry, ArrayList users) {
            if (DialogsFragment.this.getActivity() != null) {
                entry.setWritesMessage(users);
                DialogsFragment.this.updateList();
            }
        }
    }

    public boolean isSelectMode() {
        return getArguments() != null && getArguments().getBoolean(ArgKeys.SELECT, false);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        IntentFilter filter = new IntentFilter();
        filter.addAction(LongPollService.ACTION_NEW_MESSAGE);
        filter.addAction(LongPollService.ACTION_UPDATE_MESSAGE);
        filter.addAction(LongPollService.ACTION_USER_PRESENCE);
        filter.addAction(LongPollService.ACTION_MESSAGE_RSTATE_CHANGED);
        filter.addAction(LongPollService.ACTION_REFRESH_DIALOGS_LIST);
        filter.addAction(LongPollService.ACTION_CHAT_CHANGED);
        filter.addAction(LongPollService.ACTION_DIALOG_CHANGED);
        filter.addAction(LongPollService.ACTION_MUTE_CHANGED);
        filter.addAction(LongPollService.ACTION_STATE_CHANGED);
        filter.addAction(LongPollService.ACTION_COMMUNITY_MESSAGES_BLOCK_CHANGED);
        filter.addAction(LongPollService.ACTION_TYPING);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        if (isSelectMode() && this.selListener == null) {
            setListener(DialogsFragment$$Lambda$1.lambdaFactory$(this));
        }
    }

    public /* synthetic */ void lambda$onCreate$0(DialogEntry e) {
        getActivity().setResult(-1, new Intent().putExtra("profile", e.profile));
        getActivity().finish();
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (!this.isSearchExpanded || this.searchView == null) {
            return false;
        }
        this.searchView.setExpanded(false);
        return true;
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        NotificationManager nm = (NotificationManager) getActivity().getSystemService("notification");
        nm.cancel(10);
        if (updateMutedStates()) {
            this.adapter.notifyDataSetChanged();
        }
    }

    @Override // com.vkontakte.android.fragments.VKToolbarFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.toolbarStatePanel = LayoutInflater.from(getActivity()).inflate(R.layout.toolbar_state_panel, (ViewGroup) null);
        this.toolbarStatePanelText = (TextView) this.toolbarStatePanel.findViewById(R.id.toolbar_state_panel_text);
        this.toolbarStatePanelProgress = (ProgressBar) this.toolbarStatePanel.findViewById(R.id.toolbar_state_panel_progress);
        this.toolbarStatePanelProgress.getIndeterminateDrawable().setColorFilter(-1, PorterDuff.Mode.SRC_ATOP);
        getToolbar().addView(this.toolbarStatePanel);
        updateState(LongPollService.getState());
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        Activity act = getActivity();
        ViewGroup contentView = (ViewGroup) inflater.inflate(R.layout.fr_dialogs, container, false);
        this.list = (UsableRecyclerView) contentView.findViewById(R.id.list);
        this.contentWrap = (FrameLayout) contentView.findViewById(R.id.contentWrap);
        this.emptyView = contentView.findViewById(R.id.emptyView);
        this.progress = (ProgressBar) contentView.findViewById(R.id.progress);
        this.error = new ErrorViewHelper(contentView.findViewById(R.id.error));
        this.floatingActionButton = (FloatingActionButton) contentView.findViewById(R.id.createNewDialog);
        this.footerView = new LoadMoreFooterView(act);
        if ($assertionsDisabled || this.emptyView != null) {
            this.emptyView.findViewById(R.id.empty_button).setVisibility(8);
            EmptyView.setText(this.emptyView, (int) R.string.no_messages);
            EmptyView.setButtonText(this.emptyView, (int) R.string.write_a_message);
            EmptyView.setButtonVisible(this.emptyView, true);
            EmptyView.setOnBtnClickListener(this.emptyView, DialogsFragment$$Lambda$2.lambdaFactory$(this, inflater));
            if (!$assertionsDisabled && this.list == null) {
                throw new AssertionError();
            }
            this.list.setLayoutManager(new LinearLayoutManager(act));
            this.list.setLayoutManager(new LinearLayoutManager(act));
            UsableRecyclerView usableRecyclerView = this.list;
            DialogsAdapter dialogsAdapter = new DialogsAdapter(VKAccountManager.getCurrent().getPhoto(), this);
            this.adapter = dialogsAdapter;
            usableRecyclerView.setAdapter(dialogsAdapter);
            this.list.addFooterView(this.footerView);
            this.list.setSelector(R.drawable.highlight);
            this.list.setEmptyView(this.emptyView);
            this.list.setListener(new UsableRecyclerView.Listener() { // from class: com.vkontakte.android.fragments.messages.DialogsFragment.2
                {
                    DialogsFragment.this = this;
                }

                @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
                public void onScrolledToLastItem() {
                    DialogsFragment.this.loadData(false);
                }

                @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
                public void onScrollStarted() {
                    Activity act2 = DialogsFragment.this.getActivity();
                    if (act2 != null && act2.getCurrentFocus() != null) {
                        InputMethodManager imm = (InputMethodManager) act2.getSystemService("input_method");
                        imm.hideSoftInputFromWindow(act2.getCurrentFocus().getWindowToken(), 0);
                        act2.getCurrentFocus().clearFocus();
                    }
                }
            });
            if (!$assertionsDisabled && this.error == null) {
                throw new AssertionError();
            }
            this.error.setOnRetryListener(DialogsFragment$$Lambda$3.lambdaFactory$(this));
            this.error.setVisibility(8);
            if (!$assertionsDisabled && this.floatingActionButton == null) {
                throw new AssertionError();
            }
            VoidF1<Long> f = DialogsFragment$$Lambda$4.lambdaFactory$(this, inflater);
            this.floatingActionButton.setVisibility(!isSelectMode() ? 0 : 8);
            this.floatingActionButton.setOnClickListener(DialogsFragment$$Lambda$5.lambdaFactory$(f));
            this.searchView = new SearchViewWrapper(getActivity(), new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.messages.DialogsFragment.3
                {
                    DialogsFragment.this = this;
                }

                @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
                public void onQueryConfirmed(String query) {
                }

                @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
                public void onQuerySubmitted(String query) {
                    if (!DialogsFragment.this.isSelectMode()) {
                        DialogsFragment.this.suggester.updateQuery("");
                        DialogsFragment.this.search(query);
                    }
                }

                @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
                public void onQueryChanged(String query) {
                    DialogsFragment.this.suggester.updateQuery(query);
                }
            });
            this.suggester = new MessagesSearchSuggestionsPopup(this.searchView, getActivity(), !isSelectMode());
            contentView.addView(this.suggester.getView());
            if (this.selListener != null) {
                this.suggester.setSelectionListener(this.selListener);
            }
            this.searchView.setStateListener(DialogsFragment$$Lambda$6.lambdaFactory$(this));
            this.adapter.setData(this.displayItems);
            loadData(false);
            return contentView;
        }
        throw new AssertionError();
    }

    public /* synthetic */ void lambda$onCreateContentView$1(LayoutInflater inflater, View v) {
        new FriendsFragment.Builder().setDisableSpinner().setGlobalSearch(true).setSelect().setTitle(inflater.getContext().getString(R.string.open_chat)).forResult(this, REQ_SELECT_USER);
    }

    public /* synthetic */ void lambda$onCreateContentView$2(View v) {
        ErrorViewHelper.setVisibility(this.error, 8);
        ViewUtils.setVisibility(this.progress, 0);
        loadData(true);
    }

    public /* synthetic */ void lambda$onCreateContentView$3(LayoutInflater inflater, Long l) {
        if (l.longValue() == 2147483647L) {
            new FriendsFragment.Builder().setDisableSpinner().setGlobalSearch(false).setMultiSelect().setSelect().setTitle(inflater.getContext().getString(R.string.create_conversation)).forResult(this, REQ_SELECT_USERS);
        } else if (l.longValue() == -2147483648L) {
            new FriendsFragment.Builder().setDisableSpinner().setGlobalSearch(false).setSelect().setTitle(inflater.getContext().getString(R.string.open_chat)).forResult(this, REQ_SELECT_USER);
        }
    }

    public /* synthetic */ void lambda$onCreateContentView$5(boolean expanded) {
        this.isSearchExpanded = expanded;
        if (!expanded) {
            search(null);
        }
        if (expanded) {
            this.suggester.updateSearchIndex();
        }
        if (this.floatingActionButton != null) {
            if (expanded) {
                this.floatingActionButton.hide();
            } else {
                this.floatingActionButton.show();
            }
        }
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.list = null;
        this.footerView = null;
        this.contentWrap = null;
        this.emptyView = null;
        this.progress = null;
        this.error = null;
        this.toolbarStatePanel = null;
        this.toolbarStatePanelText = null;
        this.toolbarStatePanelProgress = null;
        this.floatingActionButton = null;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(!isSelectMode() ? R.string.messages : R.string.select_recipient);
        setHasOptionsMenu(true);
        if (Global.longPoll == null && NetworkStateReceiver.isConnected()) {
            Intent intent = new Intent(getActivity(), LongPollService.class);
            getActivity().startService(intent);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void setTitle(CharSequence title) {
        if (this.toolbarStatePanel == null || this.toolbarStatePanel.getVisibility() == 8) {
            super.setTitle(title);
        }
        this.title = title;
    }

    public void updateState(int state) {
        if (this.toolbarStatePanel != null) {
            switch (state) {
                case 0:
                case 1:
                case 2:
                    super.setTitle((CharSequence) null);
                    ViewUtils.setText(this.toolbarStatePanelText, Integer.valueOf(state < TEXTS.length ? TEXTS[state] : TEXTS[0]), false);
                    ViewUtils.setVisibility(this.toolbarStatePanelProgress, 0);
                    this.toolbarStatePanel.setVisibility(0);
                    return;
                case 3:
                    ViewUtils.setText(this.toolbarStatePanelText, Integer.valueOf((int) R.string.state_connected), false);
                    ViewUtils.setVisibility(this.toolbarStatePanelProgress, 8);
                    if (isAdded()) {
                        super.setTitle(this.title);
                    }
                    ViewUtils.setVisibility(this.toolbarStatePanel, 8);
                    return;
                default:
                    return;
            }
        }
    }

    public boolean updateMutedStates() {
        boolean updated = false;
        for (int i = 0; i < this.dlgs.size(); i++) {
            updated = this.dlgs.get(i).updateMutedState() || updated;
        }
        return updated;
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (this.searchView != null) {
            this.searchView.onCreateOptionsMenu(menu);
        }
        super.onCreateOptionsMenu(menu, inflater);
    }

    public void search(String q) {
        this.searchQuery = q;
        ErrorViewHelper.setVisibility(this.error, 8);
        if (q == null) {
            this.displayItems = this.dlgs;
            this.moreAvailable = true;
            updateList();
            ErrorViewHelper.setVisibility(this.error, 8);
            ViewUtils.setVisibility(this.contentWrap, 0);
            if (this.emptyView != null) {
                EmptyView.setText(this.emptyView, (int) R.string.no_messages);
                EmptyView.setButtonVisible(this.emptyView, true);
            }
            if (this.dlgs.size() == 0) {
                ViewUtils.setVisibility(this.contentWrap, 8);
                loadData(true);
                return;
            }
            return;
        }
        if (this.emptyView != null) {
            EmptyView.setText(this.emptyView, (int) R.string.nothing_found);
            EmptyView.setButtonVisible(this.emptyView, false);
        }
        this.searchResults = new ArrayList<>();
        this.displayItems = this.searchResults;
        updateList();
        loadData(true);
        ViewUtils.setVisibility(this.contentWrap, 8);
        ViewUtils.setVisibility(this.progress, 0);
    }

    public void loadData(boolean refresh) {
        int i = 0;
        if (!this.dataLoading) {
            if (this.moreAvailable || refresh) {
                this.dataLoading = true;
                if (this.searchQuery == null) {
                    if (!refresh) {
                        i = this.dlgs.size();
                    }
                    Messages.getDialogs(i, 20, new AnonymousClass4(refresh));
                    return;
                }
                String str = this.searchQuery;
                if (!refresh) {
                    i = this.searchResults.size();
                }
                Messages.search(str, i, 20, new AnonymousClass5(refresh));
            }
        }
    }

    /* renamed from: com.vkontakte.android.fragments.messages.DialogsFragment$4 */
    /* loaded from: classes3.dex */
    public class AnonymousClass4 implements Messages.GetDialogsCallback {
        final /* synthetic */ boolean val$refresh;

        AnonymousClass4(boolean z) {
            DialogsFragment.this = this$0;
            this.val$refresh = z;
        }

        @Override // com.vkontakte.android.data.Messages.GetDialogsCallback
        public void onDialogsLoaded(ArrayList<DialogEntry> rdlgs) {
            if (rdlgs == null) {
                DialogsFragment.this.dataLoading = false;
            } else {
                ViewUtils.runOnUiThread(DialogsFragment.this.getActivity(), DialogsFragment$4$$Lambda$1.lambdaFactory$(this, this.val$refresh, rdlgs));
            }
        }

        public /* synthetic */ void lambda$onDialogsLoaded$0(boolean refresh, ArrayList rdlgs) {
            DialogsFragment.this.dataLoading = false;
            if (DialogsFragment.this.searchQuery == null) {
                if (refresh) {
                    DialogsFragment.this.dlgs.clear();
                }
                int prevSize = DialogsFragment.this.dlgs.size();
                DialogsFragment.this.dlgs.addAll(rdlgs);
                DialogsFragment.this.preventDuplicates();
                DialogsFragment.this.updateMutedStates();
                DialogsFragment.this.updateList();
                DialogsFragment.this.moreAvailable = rdlgs.size() != 0 && (prevSize != DialogsFragment.this.dlgs.size() || rdlgs.size() > 20);
                if (DialogsFragment.this.footerView != null) {
                    DialogsFragment.this.footerView.setVisible(DialogsFragment.this.moreAvailable);
                }
                if (DialogsFragment.this.contentWrap != null && DialogsFragment.this.contentWrap.getVisibility() != 0) {
                    ViewUtils.setVisibilityAnimated(DialogsFragment.this.contentWrap, 0);
                    ViewUtils.setVisibilityAnimated(DialogsFragment.this.progress, 8);
                }
                if (DialogsFragment.this.suggester != null) {
                    DialogsFragment.this.suggester.updateSearchIndex();
                }
                if (prevSize == 0) {
                    DialogsFragment.this.updateNonFriendsOnlines();
                }
            }
        }

        @Override // com.vkontakte.android.data.Messages.GetDialogsCallback
        public void onError(int ecode, String emsg) {
            if (DialogsFragment.this.getActivity() == null) {
                DialogsFragment.this.dataLoading = false;
            } else {
                DialogsFragment.this.getActivity().runOnUiThread(DialogsFragment$4$$Lambda$2.lambdaFactory$(this, ecode, emsg));
            }
        }

        public /* synthetic */ void lambda$onError$1(int ecode, String emsg) {
            DialogsFragment.this.dataLoading = false;
            if (DialogsFragment.this.searchQuery == null) {
                if (DialogsFragment.this.dlgs.size() == 0) {
                    if (DialogsFragment.this.error != null) {
                        DialogsFragment.this.error.setErrorInfo(ecode, emsg);
                    }
                    ErrorViewHelper.setVisibilityAnimated(DialogsFragment.this.error, 0);
                    ViewUtils.setVisibilityAnimated(DialogsFragment.this.progress, 8);
                    return;
                }
                APIUtils.showErrorToast(DialogsFragment.this.getActivity(), ecode, emsg);
            }
        }
    }

    /* renamed from: com.vkontakte.android.fragments.messages.DialogsFragment$5 */
    /* loaded from: classes3.dex */
    public class AnonymousClass5 implements Messages.SearchCallback {
        final /* synthetic */ boolean val$refresh;

        AnonymousClass5(boolean z) {
            DialogsFragment.this = this$0;
            this.val$refresh = z;
        }

        @Override // com.vkontakte.android.data.Messages.SearchCallback
        public void onError(int ecode, String emsg) {
            if (DialogsFragment.this.getActivity() == null) {
                DialogsFragment.this.dataLoading = false;
            } else {
                DialogsFragment.this.getActivity().runOnUiThread(DialogsFragment$5$$Lambda$1.lambdaFactory$(this, ecode, emsg));
            }
        }

        public /* synthetic */ void lambda$onError$0(int ecode, String emsg) {
            DialogsFragment.this.dataLoading = false;
            if (DialogsFragment.this.searchQuery != null) {
                if (DialogsFragment.this.searchResults.size() == 0) {
                    if (DialogsFragment.this.error != null) {
                        DialogsFragment.this.error.setErrorInfo(ecode, emsg);
                    }
                    ErrorViewHelper.setVisibilityAnimated(DialogsFragment.this.error, 0);
                    ViewUtils.setVisibilityAnimated(DialogsFragment.this.progress, 8);
                    return;
                }
                APIUtils.showErrorToast(DialogsFragment.this.getActivity(), ecode, emsg);
            }
        }

        @Override // com.vkontakte.android.data.Messages.SearchCallback
        public void onDialogsLoaded(ArrayList<DialogEntry> dlgs, int total) {
            if (dlgs == null || DialogsFragment.this.getActivity() == null) {
                DialogsFragment.this.dataLoading = false;
            } else {
                DialogsFragment.this.getActivity().runOnUiThread(DialogsFragment$5$$Lambda$2.lambdaFactory$(this, this.val$refresh, dlgs, total));
            }
        }

        public /* synthetic */ void lambda$onDialogsLoaded$1(boolean refresh, ArrayList dlgs, int total) {
            DialogsFragment.this.dataLoading = false;
            if (DialogsFragment.this.searchQuery != null) {
                if (refresh) {
                    DialogsFragment.this.searchResults.clear();
                }
                DialogsFragment.this.searchResults.addAll(dlgs);
                DialogsFragment.this.updateList();
                if (dlgs.size() == 0 || DialogsFragment.this.searchResults.size() >= total) {
                    DialogsFragment.this.moreAvailable = false;
                } else {
                    DialogsFragment.this.moreAvailable = true;
                }
                if (DialogsFragment.this.footerView != null) {
                    DialogsFragment.this.footerView.setVisible(DialogsFragment.this.moreAvailable);
                }
                if (DialogsFragment.this.contentWrap != null && DialogsFragment.this.contentWrap.getVisibility() != 0) {
                    ViewUtils.setVisibilityAnimated(DialogsFragment.this.contentWrap, 0);
                    ViewUtils.setVisibilityAnimated(DialogsFragment.this.progress, 8);
                }
            }
        }
    }

    public void updateNonFriendsOnlines() {
        ArrayList<Integer> ids = new ArrayList<>();
        for (int i = 0; i < this.dlgs.size(); i++) {
            DialogEntry dlg = this.dlgs.get(i);
            if (dlg.profile.uid > 0 && dlg.profile.uid < 2000000000 && !Friends.isFriend(dlg.profile.uid)) {
                ids.add(Integer.valueOf(dlg.profile.uid));
            }
        }
        if (ids.size() > 0) {
            new GetOnlines(ids).setCallback(new SimpleCallback<SparseArray<Integer>>() { // from class: com.vkontakte.android.fragments.messages.DialogsFragment.6
                {
                    DialogsFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(SparseArray<Integer> onlines) {
                    for (int i2 = 0; i2 < DialogsFragment.this.dlgs.size(); i2++) {
                        DialogEntry dlg2 = (DialogEntry) DialogsFragment.this.dlgs.get(i2);
                        if (Utils.containsKey(onlines, dlg2.profile.uid)) {
                            dlg2.profile.online = onlines.get(dlg2.profile.uid).intValue();
                        }
                    }
                    DialogsFragment.this.updateList();
                }
            }).setBackground(true).exec((Context) getActivity());
        }
    }

    public void setListener(SelectionListener l) {
        this.selListener = l;
        if (this.suggester != null) {
            this.suggester.setSelectionListener(l);
        }
    }

    public void updateList() {
        updateList(false);
    }

    public void updateList(boolean updateNotificationsSettings) {
        ViewUtils.runOnUiThread(DialogsFragment$$Lambda$7.lambdaFactory$(this, updateNotificationsSettings));
    }

    public /* synthetic */ void lambda$updateList$6(boolean updateNotificationsSettings) {
        if (this.dlgs.size() > 0) {
            ErrorViewHelper.setVisibility(this.error, 8);
        }
        if (this.adapter != null) {
            this.adapter.setData(this.displayItems);
        }
        if (updateNotificationsSettings && updateMutedStates()) {
            this.adapter.notifyDataSetChanged();
        }
        ShortcutManagerWrapper.getInstance().updateShortcuts(getActivity(), this.dlgs);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        ArrayList<UserProfile> users;
        switch (reqCode) {
            case REQ_SELECT_USER /* 321 */:
                if (resCode == -1) {
                    Bundle b = data.getExtras();
                    new ChatFragment.Builder(b.getInt(ArgKeys.UID), b.getString("name")).setPhoto(b.getString("photo")).go(getActivity());
                    return;
                }
                return;
            case REQ_SELECT_USERS /* 322 */:
                if (resCode == -1 && (users = data.getParcelableArrayListExtra("result")) != null && !users.isEmpty()) {
                    if (users.size() == 1) {
                        UserProfile p = users.get(0);
                        new ChatFragment.Builder(p.uid, p.fullName).setPhoto(p.photo).go(getActivity());
                        return;
                    }
                    this.selectedTempUsers = users;
                    Bundle args = new Bundle();
                    args.putParcelableArrayList("users", users);
                    args.putBoolean("create", true);
                    new Navigator(ChatMembersFragment.class, args).forResult(this, REQ_CREATE_CHAT);
                    return;
                }
                return;
            case REQ_CREATE_CHAT /* 323 */:
                if (resCode != -1) {
                    if (this.selectedTempUsers != null) {
                        int[] users2 = new int[this.selectedTempUsers.size()];
                        for (int i = 0; i < users2.length; i++) {
                            users2[i] = this.selectedTempUsers.get(i).uid;
                        }
                        new FriendsFragment.Builder().setDisableSpinner().setGlobalSearch(false).setMultiSelect().setPresetUsers(users2).setSelect().setTitle(getActivity().getString(R.string.create_conversation)).forResult(this, REQ_SELECT_USERS);
                    }
                    this.selectedTempUsers = null;
                    getActivity().overridePendingTransition(R.anim.activity_close_enter, R.anim.activity_close_exit);
                    return;
                }
                return;
            default:
                super.onActivityResult(reqCode, resCode, data);
                return;
        }
    }

    /* loaded from: classes3.dex */
    public static class DialogsAdapter extends UsableRecyclerView.Adapter<DialogHolder> {
        final DialogsFragment dialogsFragment;
        ArrayList<DialogEntry> displayItems = new ArrayList<>();
        final String userPhotoUrl;

        public DialogsAdapter(String userPhotoUrl, DialogsFragment dialogsFragment) {
            this.userPhotoUrl = userPhotoUrl;
            this.dialogsFragment = dialogsFragment;
        }

        public void setData(ArrayList<DialogEntry> displayItems) {
            this.displayItems = displayItems == null ? new ArrayList<>() : new ArrayList<>(displayItems);
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public DialogHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new DialogHolder(parent.getContext(), this.dialogsFragment, this.userPhotoUrl);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(DialogHolder holder, int position) {
            holder.bind(this.displayItems.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.displayItems.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            return (this.displayItems.get(item).lastMessage.out || this.displayItems.get(item).profile.uid > 2000000000) ? 2 : 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            return null;
        }
    }

    public void allowMessages(final DialogEntry e) {
        ApiMethodsHelper.allowMessagesFromGroup(getContext(), Math.abs(e.profile.uid), new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.fragments.messages.DialogsFragment.7
            {
                DialogsFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                Intent intent = new Intent(LongPollService.ACTION_COMMUNITY_MESSAGES_BLOCK_CHANGED);
                intent.putExtra("is_messages_blocked", false);
                intent.putExtra("id", e.lastMessage.peer);
                DialogsFragment.this.getContext().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            }
        });
    }

    public void denyMessages(final DialogEntry e) {
        ApiMethodsHelper.denyMessagesFromGroup(getContext(), Math.abs(e.profile.uid), new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.fragments.messages.DialogsFragment.8
            {
                DialogsFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                Intent intent = new Intent(LongPollService.ACTION_COMMUNITY_MESSAGES_BLOCK_CHANGED);
                intent.putExtra("is_messages_blocked", true);
                intent.putExtra("id", e.lastMessage.peer);
                DialogsFragment.this.getContext().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            }
        });
    }

    public void confirmAndClearHistory(DialogEntry e) {
        ApiMethodsHelper.clearHistory(getActivity(), e.profile.uid, e, DialogsFragment$$Lambda$8.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$confirmAndClearHistory$7(Integer uid, DialogEntry o) {
        this.dlgs.remove(o);
        Messages.removeDialog(uid.intValue());
        updateList();
    }

    public void createShortcut(DialogEntry e) {
        new Thread(DialogsFragment$$Lambda$9.lambdaFactory$(e)).start();
    }

    public static /* synthetic */ void lambda$createShortcut$9(DialogEntry e) {
        Runnable runnable;
        Intent intent = Messages.getShortcutIntent(e.profile);
        VKApplication.context.sendBroadcast(intent);
        runnable = DialogsFragment$$Lambda$10.instance;
        ViewUtils.post(runnable);
    }

    public void preventDuplicates() {
        ArrayList<Integer> ids = new ArrayList<>();
        Iterator<DialogEntry> itr = this.dlgs.iterator();
        while (itr.hasNext()) {
            DialogEntry de = itr.next();
            if (ids.contains(Integer.valueOf(de.lastMessage.peer))) {
                itr.remove();
            } else {
                ids.add(Integer.valueOf(de.lastMessage.peer));
            }
        }
    }
}
