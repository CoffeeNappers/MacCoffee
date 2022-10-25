package com.vkontakte.android.fragments.messages;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.CompoundButton;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.vkontakte.android.ChatUser;
import com.vkontakte.android.ImagePickerActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountSetSilenceMode;
import com.vkontakte.android.api.messages.MessagesAddChatUser;
import com.vkontakte.android.api.messages.MessagesCreateChat;
import com.vkontakte.android.api.messages.MessagesDeleteChatPhoto;
import com.vkontakte.android.api.messages.MessagesEditChat;
import com.vkontakte.android.api.users.GetOnlines;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.Cache;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.fragments.CardRecyclerFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.fragments.messages.ChatAttachmentHistoryFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.userlist.AddNewUserToChatFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.RecyclerSectionAdapter;
import com.vkontakte.android.ui.holder.commons.BackgroundHolder;
import com.vkontakte.android.ui.holder.commons.MaterialListButtonBlueHolder;
import com.vkontakte.android.ui.holder.commons.PreferenceCheckBoxHolder;
import com.vkontakte.android.ui.holder.commons.PreferenceIconItemHolder;
import com.vkontakte.android.ui.holder.commons.PreferenceSummaryHolder;
import com.vkontakte.android.ui.holder.commons.TitleHolder;
import com.vkontakte.android.ui.holder.messages.AddUserToChatHolder;
import com.vkontakte.android.ui.holder.messages.ChatInfoHolder;
import com.vkontakte.android.ui.holder.messages.RemovableChatUserViewHolder;
import com.vkontakte.android.upload.ChatPhotoUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.utils.ApiMethodsHelper;
import io.reactivex.annotations.SchedulerSupport;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class ChatMembersFragment extends CardRecyclerFragment<RecyclerSectionAdapter.Data> implements View.OnClickListener, CompoundButton.OnCheckedChangeListener, AddUserToChatHolder.AddUserToChatI {
    private static final int INVITE_RESULT = 38920;
    private static final int PHOTO_RESULT = 38919;
    private Adapter adapter;
    private int admin;
    private final PreferenceSummaryHolder.Ref chatDnd;
    private final ChatInfoHolder.Ref chatInfoData;
    private boolean create;
    private int id;
    private boolean left;
    private final PreferenceCheckBoxHolder.Ref notificationRef;
    private BroadcastReceiver receiver;
    private int uploadID;
    private ProgressDialog uploadProgress;

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    public Adapter mo1066getAdapter() {
        return this.adapter;
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setRefreshEnabled(false);
        if (this.create) {
            onDataLoaded(this.adapter.data, false);
        }
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        this.create = getArguments().getBoolean("create");
        this.id = getArguments().getInt("id");
        this.admin = getArguments().getInt("admin");
        getActivity().getWindow().setSoftInputMode(32);
        loadData();
        this.chatInfoData.setTitle(getArguments().getCharSequence("title"));
        this.chatInfoData.setOnEditorActionListener(ChatMembersFragment$$Lambda$1.lambdaFactory$(this, act));
        setTitle(this.create ? R.string.create_conversation : R.string.conversation);
        if (this.create) {
            ArrayList<UserProfile> users = getArguments().getParcelableArrayList("users");
            UserProfile cur = new UserProfile(VKAccountManager.getCurrent());
            Iterator<UserProfile> it = users.iterator();
            while (it.hasNext()) {
                UserProfile p = it.next();
                ChatUser cu = new ChatUser();
                cu.user = p;
                cu.inviter = cur;
                this.adapter.addChatUser(cu);
            }
            updateList();
            loadOnlines();
            setHasOptionsMenu(true);
        } else {
            updateChatUsers();
        }
        updateSettings();
        this.chatInfoData.setOnClickListener(this);
        if (!this.create) {
            IntentFilter filter = new IntentFilter();
            filter.addAction(LongPollService.ACTION_CHAT_CHANGED);
            filter.addAction(Upload.ACTION_UPLOAD_DONE);
            filter.addAction(Upload.ACTION_UPLOAD_PROGRESS);
            filter.addAction(Upload.ACTION_UPLOAD_FAILED);
            VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        }
    }

    public /* synthetic */ boolean lambda$onAttach$0(Activity act, TextView v, int actionId, KeyEvent event) {
        if (this.create) {
            createChat();
        } else {
            setChatTitle(this.chatInfoData.getTitle().toString());
            InputMethodManager imm = (InputMethodManager) getActivity().getSystemService("input_method");
            imm.hideSoftInputFromWindow(act.getCurrentFocus().getWindowToken(), 0);
            act.getCurrentFocus().clearFocus();
        }
        return true;
    }

    public ChatMembersFragment() {
        super(100);
        this.chatDnd = new PreferenceSummaryHolder.Ref(this, R.id.dnd_view, Integer.valueOf((int) R.string.chat_dnd));
        this.chatInfoData = new ChatInfoHolder.Ref();
        this.notificationRef = new PreferenceCheckBoxHolder.Ref(this, Integer.valueOf((int) R.string.chat_sound));
        this.adapter = new Adapter();
        this.left = false;
        this.uploadID = -1;
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.1
            {
                ChatMembersFragment.this = this;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (LongPollService.ACTION_CHAT_CHANGED.equals(intent.getAction())) {
                    int cid = intent.getIntExtra("id", 0);
                    Log.i("vk", "Received chat changed: " + cid);
                    if (cid == ChatMembersFragment.this.id) {
                        ChatMembersFragment.this.updateChatUsers();
                        ChatMembersFragment.this.updateSettings();
                    }
                }
                if (Upload.ACTION_UPLOAD_PROGRESS.equals(intent.getAction())) {
                    int id = intent.getIntExtra("id", 0);
                    if (id == ChatMembersFragment.this.uploadID) {
                        int done = intent.getIntExtra("done", 0);
                        int total = intent.getIntExtra(ArgKeys.TOTAL, 0);
                        if (ChatMembersFragment.this.uploadProgress != null) {
                            ChatMembersFragment.this.uploadProgress.setIndeterminate(false);
                            ChatMembersFragment.this.uploadProgress.setMax(total);
                            ChatMembersFragment.this.uploadProgress.setProgress(done);
                        }
                    }
                }
                if (Upload.ACTION_UPLOAD_DONE.equals(intent.getAction())) {
                    int id2 = intent.getIntExtra("id", 0);
                    if (id2 == ChatMembersFragment.this.uploadID) {
                        ViewUtils.dismissDialogSafety(ChatMembersFragment.this.uploadProgress);
                        ChatMembersFragment.this.uploadProgress = null;
                    }
                }
                if (Upload.ACTION_UPLOAD_FAILED.equals(intent.getAction())) {
                    int id3 = intent.getIntExtra("id", 0);
                    if (id3 == ChatMembersFragment.this.uploadID) {
                        ViewUtils.dismissDialogSafety(ChatMembersFragment.this.uploadProgress);
                        ChatMembersFragment.this.uploadProgress = null;
                        new AlertDialog.Builder(ChatMembersFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.uploading_photo_err_notify).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                    }
                }
            }
        };
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public void doLoadData() {
        if (!this.create) {
            updateChatUsers();
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        if (!this.create) {
            try {
                VKApplication.context.unregisterReceiver(this.receiver);
            } catch (Exception e) {
            }
        }
    }

    public void updateChatUsers() {
        Messages.getChatUsers(this.id, ChatMembersFragment$$Lambda$2.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$updateChatUsers$1(final ArrayList users, String title, String photo) {
        ChatInfoHolder.Ref ref = this.chatInfoData;
        if (photo != null && photo.startsWith("vkchatphoto:")) {
            photo = "";
        }
        ref.setPhoto(photo);
        if (getActivity() != null) {
            getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.2
                {
                    ChatMembersFragment.this = this;
                }

                @Override // java.lang.Runnable
                public void run() {
                    boolean z = true;
                    ChatMembersFragment.this.left = users.size() == 0;
                    ChatInfoHolder.Ref ref2 = ChatMembersFragment.this.chatInfoData;
                    if (ChatMembersFragment.this.left) {
                        z = false;
                    }
                    ref2.setEnable(z);
                    ChatMembersFragment.this.adapter.replaceChatUsers(users);
                    ChatMembersFragment.this.adapter.build();
                    ChatMembersFragment.this.onDataLoaded(ChatMembersFragment.this.adapter.data, false);
                    ChatMembersFragment.this.loadOnlines();
                }
            });
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.adapter.setIsCreate(this.create);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.create_new_chat, menu);
        super.onCreateOptionsMenu(menu, inflater);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.create_new_chat /* 2131756521 */:
                createChat();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    public void loadOnlines() {
        ArrayList<Integer> needOnlines = new ArrayList<>();
        Iterator<ChatUser> it = this.adapter.chatUsers.iterator();
        while (it.hasNext()) {
            ChatUser user = it.next();
            if (!Friends.isFriend(user.user.uid)) {
                needOnlines.add(Integer.valueOf(user.user.uid));
            } else {
                user.user.online = Friends.getOnlineStatus(user.user.uid);
            }
        }
        updateList();
        if (needOnlines.size() != 0) {
            new GetOnlines(needOnlines).setCallback(new SimpleCallback<SparseArray<Integer>>() { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.3
                {
                    ChatMembersFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(SparseArray<Integer> onlines) {
                    Iterator<ChatUser> it2 = ChatMembersFragment.this.adapter.chatUsers.iterator();
                    while (it2.hasNext()) {
                        ChatUser user2 = it2.next();
                        user2.user.online = onlines.get(user2.user.uid, 0).intValue();
                    }
                    ChatMembersFragment.this.updateList();
                }
            }).exec((Context) getActivity());
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void updateList() {
        this.adapter.build();
    }

    private void createChat() {
        final String originTitle = this.chatInfoData.getTitle().toString();
        String title = originTitle;
        if (title.length() == 0) {
            ArrayList<String> ttl = new ArrayList<>();
            for (int i = 0; i < Math.min(3, this.adapter.chatUsers.size()); i++) {
                ttl.add(this.adapter.chatUsers.get(i).user.firstName);
            }
            title = TextUtils.join(", ", ttl);
        }
        ArrayList<UserProfile> users = new ArrayList<>();
        Iterator<ChatUser> it = this.adapter.chatUsers.iterator();
        while (it.hasNext()) {
            ChatUser cu = it.next();
            users.add(cu.user);
        }
        new MessagesCreateChat(users, title).setCallback(new SimpleCallback<Integer>(this) { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.4
            {
                ChatMembersFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Integer chatID) {
                UserProfile profile = new UserProfile();
                profile.uid = 2000000000 + chatID.intValue();
                profile.fullName = originTitle;
                profile.online = VKAccountManager.getCurrent().getUid();
                profile.photo = Messages.createChatPhoto(ChatMembersFragment.this.adapter.chatUsers);
                ArrayList<UserProfile> al = new ArrayList<>();
                al.add(profile);
                Cache.updatePeers(al, false);
                new ChatFragment.Builder(profile.uid, profile.fullName).go(ChatMembersFragment.this.getActivity());
                ChatMembersFragment.this.getActivity().setResult(-1);
                ChatMembersFragment.this.getActivity().finish();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public void updateSettings() {
        SharedPreferences prefs = getActivity().getSharedPreferences("notify", 0);
        this.notificationRef.setChecked(!prefs.getBoolean(new StringBuilder().append("mute").append(this.id + 2000000000).toString(), false));
        this.chatDnd.setSummary(getDndText(prefs.getInt("dnd" + (this.id + 2000000000), 0)));
    }

    private String getDndText(int i) {
        int now = TimeUtils.getCurrentTime();
        if (i > now) {
            return i == Integer.MAX_VALUE ? getResources().getStringArray(R.array.dnd_options)[3] : TimeUtils.langDate(i);
        }
        return null;
    }

    private void setMute(boolean mute) {
        SharedPreferences prefs = getActivity().getSharedPreferences("notify", 0);
        if (mute) {
            prefs.edit().putBoolean("mute" + (this.id + 2000000000), true).apply();
        } else {
            prefs.edit().remove("mute" + (this.id + 2000000000)).apply();
        }
        updateServerSettings();
    }

    private void setDnd(int time) {
        SharedPreferences prefs = getActivity().getSharedPreferences("notify", 0);
        prefs.edit().putInt("dnd" + (2000000000 + this.id), time).apply();
        updateServerSettings();
    }

    private void updateServerSettings() {
        SharedPreferences prefs = getActivity().getSharedPreferences("notify", 0);
        boolean mute = prefs.getBoolean("mute" + (this.id + 2000000000), false);
        int dnd = prefs.getInt("dnd" + (this.id + 2000000000), 0);
        if (dnd != Integer.MAX_VALUE) {
            dnd -= TimeUtils.getCurrentTime();
        }
        VKAPIRequest req = new AccountSetSilenceMode(this.id + 2000000000, dnd, mute);
        ((AccountSetSilenceMode) req).setBackground(true).persist(null, null).exec();
    }

    private void showDndDialog() {
        SharedPreferences prefs = getActivity().getSharedPreferences("notify", 0);
        int dnd = prefs.getInt("dnd" + (2000000000 + this.id), 0);
        int now = TimeUtils.getCurrentTime();
        if (dnd > now) {
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.chat_dnd).setMessage(R.string.dnd_cancel).setPositiveButton(R.string.yes, ChatMembersFragment$$Lambda$3.lambdaFactory$(this)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
        } else {
            new VKAlertDialog.Builder(getActivity()).setItems(R.array.dnd_options, ChatMembersFragment$$Lambda$4.lambdaFactory$(this)).setTitle(R.string.chat_dnd).show();
        }
    }

    public /* synthetic */ void lambda$showDndDialog$2(DialogInterface dialog, int which) {
        setDnd(0);
        updateSettings();
    }

    public /* synthetic */ void lambda$showDndDialog$3(DialogInterface dialog, int which) {
        int t = 0;
        int now1 = TimeUtils.getCurrentTime();
        switch (which) {
            case 0:
                t = now1 + 3600;
                break;
            case 1:
                t = now1 + 86400;
                break;
            case 2:
                t = now1 + 604800;
                break;
            case 3:
                t = Integer.MAX_VALUE;
                break;
        }
        setDnd(t);
        updateSettings();
    }

    private void setChatTitle(String newTitle) {
        if (!getArguments().getCharSequence("title").toString().equals(newTitle) && newTitle.trim().length() != 0) {
            new MessagesEditChat(this.id, newTitle).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.5
                {
                    ChatMembersFragment.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    Toast.makeText(ChatMembersFragment.this.getActivity(), (int) R.string.chat_title_change_ok, 0).show();
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        }
    }

    private void addUserToChat(final UserProfile p, int uid) {
        int i = this.id;
        if (p != null) {
            uid = p.uid;
        }
        new MessagesAddChatUser(i, uid).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.6
            {
                ChatMembersFragment.this = this;
            }

            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                if (p == null) {
                    ChatMembersFragment.this.reload();
                    return;
                }
                ChatUser cu = new ChatUser();
                cu.inviter = new UserProfile();
                cu.inviter.uid = VKAccountManager.getCurrent().getUid();
                cu.inviter.fullName = VKAccountManager.getCurrent().getName();
                cu.user = p;
                ChatMembersFragment.this.adapter.addChatUser(cu);
                ChatMembersFragment.this.updateList();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                if (error.getCodeValue() == 15) {
                    String err = null;
                    if (error.message.contains("already left")) {
                        err = ChatMembersFragment.this.getString(R.string.chat_invite_error_left);
                    } else if (error.message.contains("already in")) {
                        err = ChatMembersFragment.this.getString(R.string.chat_invite_error_already_in);
                    }
                    if (err != null) {
                        new AlertDialog.Builder(ChatMembersFragment.this.getActivity()).setTitle(R.string.error).setMessage(err).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                        return;
                    }
                }
                super.fail(error);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        DialogInterface.OnClickListener onClickListener;
        if (resCode == -1) {
            if (reqCode == INVITE_RESULT) {
                addUserToChat((UserProfile) data.getParcelableExtra(ProfileGiftsFragment.Extra.User), 0);
            }
            if (reqCode == PHOTO_RESULT) {
                this.uploadProgress = new ProgressDialog(getActivity());
                this.uploadProgress.setProgressStyle(1);
                this.uploadProgress.setTitle(getString(R.string.uploading_photo));
                this.uploadProgress.setIndeterminate(true);
                ProgressDialog progressDialog = this.uploadProgress;
                String string = getString(R.string.cancel);
                onClickListener = ChatMembersFragment$$Lambda$5.instance;
                progressDialog.setButton(-3, string, onClickListener);
                this.uploadProgress.setOnCancelListener(ChatMembersFragment$$Lambda$6.lambdaFactory$(this));
                this.uploadProgress.show();
                ChatPhotoUploadTask task = new ChatPhotoUploadTask(getActivity(), data.getStringExtra(UriUtil.LOCAL_FILE_SCHEME), this.id);
                this.uploadID = task.getID();
                Upload.start(getActivity(), task);
            }
        }
        if (resCode == 1 && reqCode == PHOTO_RESULT) {
            new MessagesDeleteChatPhoto(this.id).setCallback(new SimpleCallback<Integer>(getActivity()) { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.7
                {
                    ChatMembersFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(Integer mid) {
                    ChatMembersFragment.this.chatInfoData.clearImage();
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        }
    }

    public /* synthetic */ void lambda$onActivityResult$5(DialogInterface dialog) {
        Upload.cancel(this.uploadID);
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        setMute(!isChecked);
    }

    @Override // com.vkontakte.android.ui.holder.messages.AddUserToChatHolder.AddUserToChatI
    public void addUserToChat() {
        int[] ids = new int[this.adapter.chatUsers.size()];
        for (int i = 0; i < ids.length; i++) {
            ids[i] = this.adapter.chatUsers.get(i).user.uid;
        }
        new AddNewUserToChatFragment.Builder(ids).setSelect().forResult(this, INVITE_RESULT);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.chat_image /* 2131755613 */:
                Intent intent = new Intent(getActivity(), ImagePickerActivity.class).putExtra("allow_album", false).putExtra(ArgKeys.LIMIT, 1);
                if (this.chatInfoData.hasChatPhoto()) {
                    ArrayList<String> al = new ArrayList<>();
                    al.add(getString(R.string.delete));
                    intent.putExtra(SchedulerSupport.CUSTOM, al);
                }
                intent.putExtra("no_thumbs", true);
                startActivityForResult(intent, PHOTO_RESULT);
                return;
            case R.id.flist_item_btn /* 2131756312 */:
                ApiMethodsHelper.removeUserFromChat(getActivity(), this.id, ((Integer) v.getTag()).intValue(), ChatMembersFragment$$Lambda$7.lambdaFactory$(this));
                return;
            case R.id.dnd_view /* 2131756369 */:
                showDndDialog();
                return;
            default:
                return;
        }
    }

    public /* synthetic */ void lambda$onClick$6(Integer uid) {
        this.adapter.removeChatUser(uid.intValue());
    }

    public void leave() {
        ApiMethodsHelper.removeUserFromChat(getActivity(), this.id, VKAccountManager.getCurrent().getUid(), null);
    }

    public void returnToChat() {
        addUserToChat(null, VKAccountManager.getCurrent().getUid());
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (!this.adapter.data.isEmpty() && this.adapter.data.get(0).type == 1) {
            if (this.isTablet) {
                this.adapter.data.set(0, RecyclerSectionAdapter.Data.top(1, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            } else {
                this.adapter.data.set(0, RecyclerSectionAdapter.Data.middle(1, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            }
        }
        updateDecorator();
    }

    public int getPeerID() {
        return this.id + 2000000000;
    }

    /* loaded from: classes3.dex */
    public class Adapter extends RecyclerSectionAdapter {
        public static final int TYPE_BG = 1;
        public static final int TYPE_BUTTON_ADD_USER_TO_CHAT = 4;
        public static final int TYPE_BUTTON_LEAVE_CHAT = 5;
        public static final int TYPE_BUTTON_RETURN_CHAT = 6;
        public static final int TYPE_CHAT_INFO = 8;
        public static final int TYPE_CHAT_NEW = 7;
        public static final int TYPE_CHECK_BOX_PREF = 2;
        public static final int TYPE_MESSAGE_ATTACHMENTS = 10;
        public static final int TYPE_REMOVABLE_CHAT_USER = 9;
        public static final int TYPE_SUMMARY_PREFS = 3;
        public static final int TYPE_TITLE = 0;
        RecyclerSectionAdapter.Data addUserToChat;
        RecyclerSectionAdapter.Data chatInfo;
        @NonNull
        ArrayList<ChatUser> chatUsers;
        RecyclerSectionAdapter.Data dnd;
        RecyclerSectionAdapter.Data leaveButton;
        RecyclerSectionAdapter.Data messageAttachments;
        RecyclerSectionAdapter.Data notificationTitle;
        RecyclerSectionAdapter.Data paddingBottom;
        RecyclerSectionAdapter.Data returnButton;
        RecyclerSectionAdapter.Data soundChat;
        ArrayList<RecyclerSectionAdapter.Data> usersList;
        RecyclerSectionAdapter.Data usersTitle;

        private Adapter() {
            ChatMembersFragment.this = r6;
            this.chatUsers = new ArrayList<>();
            this.messageAttachments = RecyclerSectionAdapter.Data.topBottom(10, new PreferenceIconItemHolder.IconPrefInfo(R.drawable.ic_msg_panel_attach, Integer.valueOf((int) R.string.chat_attachments)));
            this.notificationTitle = RecyclerSectionAdapter.Data.top(0, Integer.valueOf((int) R.string.sett_notifications));
            this.soundChat = RecyclerSectionAdapter.Data.middle(2, ChatMembersFragment.this.notificationRef);
            this.dnd = RecyclerSectionAdapter.Data.middle(3, ChatMembersFragment.this.chatDnd);
            this.usersTitle = RecyclerSectionAdapter.Data.top(0, Integer.valueOf((int) R.string.chat_members));
            this.addUserToChat = RecyclerSectionAdapter.Data.middle(4, ChatMembersFragment.this);
            this.usersList = new ArrayList<>();
            this.leaveButton = RecyclerSectionAdapter.Data.topBottom(5, Integer.valueOf((int) R.string.chat_leave));
            this.returnButton = RecyclerSectionAdapter.Data.topBottom(6, Integer.valueOf((int) R.string.return_to_chat));
            this.paddingBottom = RecyclerSectionAdapter.Data.bottom(1, Integer.valueOf((int) R.drawable.apps_top_padding_white_8));
        }

        public void setIsCreate(boolean isCreate) {
            this.chatInfo = RecyclerSectionAdapter.Data.bottom(isCreate ? 7 : 8, ChatMembersFragment.this.chatInfoData);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 1:
                    return new BackgroundHolder(parent);
                case 2:
                    return new PreferenceCheckBoxHolder(parent.getContext());
                case 3:
                    return new PreferenceSummaryHolder(parent);
                case 4:
                    return new AddUserToChatHolder(parent.getContext());
                case 5:
                    return new MaterialListButtonBlueHolder(parent) { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.Adapter.1
                        {
                            Adapter.this = this;
                        }

                        @Override // com.vkontakte.android.ui.holder.commons.MaterialListButtonBlueHolder, me.grishka.appkit.views.UsableRecyclerView.Clickable
                        public void onClick() {
                            ChatMembersFragment.this.leave();
                        }
                    };
                case 6:
                    return new MaterialListButtonBlueHolder(parent) { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.Adapter.2
                        {
                            Adapter.this = this;
                        }

                        @Override // com.vkontakte.android.ui.holder.commons.MaterialListButtonBlueHolder, me.grishka.appkit.views.UsableRecyclerView.Clickable
                        public void onClick() {
                            ChatMembersFragment.this.returnToChat();
                        }
                    };
                case 7:
                    return new ChatInfoHolder(parent.getContext(), true);
                case 8:
                    return new ChatInfoHolder(parent.getContext(), false);
                case 9:
                    RemovableChatUserViewHolder holder = new RemovableChatUserViewHolder(parent.getContext());
                    holder.setOnClickListenerAndIsCreate(ChatMembersFragment.this, ChatMembersFragment.this.create);
                    return holder;
                case 10:
                    return new PreferenceIconItemHolder<PreferenceIconItemHolder.IconPrefInfo>(parent, ChatMembersFragment$Adapter$$Lambda$1.lambdaFactory$(this)) { // from class: com.vkontakte.android.fragments.messages.ChatMembersFragment.Adapter.3
                        {
                            Adapter.this = this;
                        }

                        /* JADX INFO: Access modifiers changed from: protected */
                        @Override // com.vkontakte.android.ui.holder.commons.PreferenceIconItemHolder
                        public void onViewInit() {
                            super.onViewInit();
                            this.text.setPadding(V.dp(40.0f), this.text.getPaddingTop(), this.text.getPaddingRight(), this.text.getPaddingBottom());
                        }
                    };
                default:
                    return TitleHolder.darkGrayTitle(parent);
            }
        }

        public /* synthetic */ void lambda$onCreateViewHolder$0(PreferenceIconItemHolder.IconPrefInfo v) {
            new ChatAttachmentHistoryFragment.Builder(ChatMembersFragment.this.getPeerID()).go(ChatMembersFragment.this.getActivity());
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return this.data.get(position).type == 9 ? 1 : 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            if (this.data.get(position).type == 9) {
                return RemovableChatUserViewHolder.getImageUrl(this.data.get(position).object);
            }
            return null;
        }

        public void removeChatUser(int uid) {
            int index = -1;
            int i = 0;
            while (true) {
                if (i >= this.chatUsers.size()) {
                    break;
                } else if (this.chatUsers.get(i).user.uid != uid) {
                    i++;
                } else {
                    index = i;
                    break;
                }
            }
            if (index >= 0) {
                this.chatUsers.remove(index);
                this.usersList.remove(index);
                build();
            }
        }

        public void addChatUser(ChatUser chatUser) {
            chatUser.admin = ChatMembersFragment.this.admin;
            this.chatUsers.add(chatUser);
            this.usersList.add(RecyclerSectionAdapter.Data.middle(9, chatUser));
        }

        public void replaceChatUsers(ArrayList<ChatUser> chatUsers) {
            this.chatUsers = chatUsers;
            ArrayList<RecyclerSectionAdapter.Data> usersList = new ArrayList<>();
            int size = chatUsers.size();
            for (int i = 0; i < size; i++) {
                ChatUser chatUser = chatUsers.get(i);
                chatUser.admin = ChatMembersFragment.this.admin;
                usersList.add(RecyclerSectionAdapter.Data.middle(9, chatUser));
            }
            this.usersList = usersList;
        }

        public void build() {
            ArrayList<RecyclerSectionAdapter.Data> dataList = new ArrayList<>();
            if (ChatMembersFragment.this.isTablet) {
                dataList.add(RecyclerSectionAdapter.Data.top(1, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            } else {
                dataList.add(RecyclerSectionAdapter.Data.middle(1, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            }
            dataList.add(this.chatInfo);
            if (!ChatMembersFragment.this.left && !ChatMembersFragment.this.create) {
                dataList.add(this.notificationTitle);
                dataList.add(this.soundChat);
                dataList.add(this.dnd);
                dataList.add(this.paddingBottom);
            }
            if (!ChatMembersFragment.this.create) {
                dataList.add(this.messageAttachments);
            }
            if (!ChatMembersFragment.this.left) {
                dataList.add(this.usersTitle);
            }
            if (!ChatMembersFragment.this.left && !ChatMembersFragment.this.create) {
                dataList.add(this.addUserToChat);
            }
            if (!ChatMembersFragment.this.left) {
                dataList.addAll(this.usersList);
                dataList.add(this.paddingBottom);
            }
            if (!ChatMembersFragment.this.left && !ChatMembersFragment.this.create) {
                dataList.add(this.leaveButton);
            }
            if (ChatMembersFragment.this.left && !ChatMembersFragment.this.create) {
                dataList.add(this.returnButton);
            }
            setData(dataList);
        }
    }
}
