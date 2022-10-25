package com.vkontakte.android.fragments.discussions;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.Toast;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.BoardTopic;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.board.BoardCloseTopic;
import com.vkontakte.android.api.board.BoardDeleteTopic;
import com.vkontakte.android.api.board.BoardFixTopic;
import com.vkontakte.android.api.board.BoardGetTopics;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.CardRecyclerFragment;
import com.vkontakte.android.fragments.discussions.BoardTopicViewFragment;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.holder.DiscussionHolder;
import me.grishka.appkit.api.PaginatedList;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class BoardTopicsFragment extends CardRecyclerFragment<BoardTopic> implements DiscussionHolder.DiscussionClickable {
    private static final int CREATE_TOPIC_RESULT = 1;
    public static final int ORDER_CREATED_ASC = -2;
    public static final int ORDER_CREATED_DESC = 2;
    public static final int ORDER_UPDATED_ASC = -1;
    public static final int ORDER_UPDATED_DESC = 1;
    private TopicListAdapter adapter;
    private boolean canCreate;
    private int defaultOrder;
    private boolean refreshOnResume;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(int id) {
            super(BoardTopicsFragment.class);
            this.args.putInt("group_id", id);
        }
    }

    public BoardTopicsFragment() {
        super(20);
        this.refreshOnResume = false;
    }

    private int getGroupId() {
        return getArguments().getInt("group_id", 0);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        ActivityUtils.setBeamLink(act, "board" + getGroupId());
        loadData();
        setTitle(R.string.topics);
        setHasOptionsMenu(true);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public TopicListAdapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new TopicListAdapter();
        }
        return this.adapter;
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.topics_list, menu);
        menu.findItem(R.id.create).setVisible(this.canCreate);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.create) {
            showCreateBox();
            return true;
        }
        return true;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        if (this.currentRequest != null) {
            this.currentRequest.cancel();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void doLoadData(int offset, int count) {
        this.currentRequest = new BoardGetTopics(getGroupId(), offset, count).setCallback(new SimpleCallback<BoardGetTopics.Result>(this) { // from class: com.vkontakte.android.fragments.discussions.BoardTopicsFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(BoardGetTopics.Result res) {
                BoardTopicsFragment.this.onDataLoaded((PaginatedList) res.topics);
                BoardTopicsFragment.this.canCreate = res.canCreate;
                BoardTopicsFragment.this.invalidateOptionsMenu();
                BoardTopicsFragment.this.defaultOrder = res.order;
                BoardTopicsFragment.this.currentRequest = null;
            }
        }).exec((Context) getActivity());
    }

    private void showCreateBox() {
        EditText edit = new EditText(getActivity());
        edit.setHint(R.string.enter_topic_title);
        FrameLayout editWrap = new FrameLayout(getActivity());
        int pad = Global.scale(10.0f);
        editWrap.setPadding(pad, pad, pad, pad);
        editWrap.addView(edit);
        AlertDialog dlg = new VKAlertDialog.Builder(getActivity()).setTitle(R.string.create_topic).setView(editWrap).setPositiveButton(R.string.ok, BoardTopicsFragment$$Lambda$1.lambdaFactory$(this, edit)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).create();
        dlg.setOnShowListener(BoardTopicsFragment$$Lambda$2.lambdaFactory$(this, edit));
        dlg.show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showCreateBox$0(EditText edit, DialogInterface dialog, int which) {
        this.refreshOnResume = true;
        String title1 = edit.getText().toString();
        if (title1.length() != 0) {
            new BoardTopicViewFragment.Builder(-1, getGroupId(), title1).go(getActivity());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showCreateBox$1(EditText edit, DialogInterface dialog) {
        ((InputMethodManager) getActivity().getSystemService("input_method")).showSoftInput(edit, 1);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$updateList$2() {
        this.adapter.notifyDataSetChanged();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void updateList() {
        ViewUtils.runOnUiThread(BoardTopicsFragment$$Lambda$3.lambdaFactory$(this));
    }

    @Override // com.vkontakte.android.ui.holder.DiscussionHolder.DiscussionClickable
    public void onClick(BoardTopic topic, boolean showLast) {
        new BoardTopicViewFragment.Builder(topic.id, getGroupId(), topic.title).setIsAdmin(Groups.isGroupAdmin(getGroupId())).setIsClosed((topic.flags & 1) > 0).showLast(showLast, topic.numComments).go(getActivity());
    }

    @Override // com.vkontakte.android.ui.holder.DiscussionHolder.DiscussionClickable
    public boolean onLongClick(BoardTopic topic) {
        if (Groups.isGroupAdmin(getGroupId()) || topic.creator == VKAccountManager.getCurrent().getUid()) {
            VKAlertDialog.Builder builder = new VKAlertDialog.Builder(getActivity());
            String[] strArr = new String[3];
            strArr[0] = getResources().getString(R.string.delete);
            strArr[1] = getResources().getString((topic.flags & 1) > 0 ? R.string.open_topic : R.string.close_topic);
            strArr[2] = getResources().getString((topic.flags & 2) > 0 ? R.string.unfix_topic : R.string.fix_topic);
            builder.setItems(strArr, BoardTopicsFragment$$Lambda$4.lambdaFactory$(this, topic)).show();
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onLongClick$3(BoardTopic topic, DialogInterface dialog, int which) {
        switch (which) {
            case 0:
                confirmDeleteTopic(topic);
                return;
            case 1:
                toggleCloseTopic(topic);
                return;
            case 2:
                toggleFixTopic(topic);
                return;
            default:
                return;
        }
    }

    private void confirmDeleteTopic(BoardTopic topic) {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.delete_topic_title).setMessage(R.string.delete_topic_confirm).setPositiveButton(R.string.yes, BoardTopicsFragment$$Lambda$5.lambdaFactory$(this, topic)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$confirmDeleteTopic$4(BoardTopic topic, DialogInterface dialog, int which) {
        deleteTopic(topic);
    }

    private void deleteTopic(final BoardTopic topic) {
        new BoardDeleteTopic(getGroupId(), topic.id).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.discussions.BoardTopicsFragment.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                BoardTopicsFragment.this.data.remove(topic);
                BoardTopicsFragment.this.updateList();
            }
        }).wrapProgress(getActivity()).exec((View) this.contentView);
    }

    private void toggleCloseTopic(final BoardTopic topic) {
        boolean z = true;
        final boolean isClosed = (topic.flags & 1) > 0;
        int groupId = getGroupId();
        int i = topic.id;
        if (isClosed) {
            z = false;
        }
        new BoardCloseTopic(groupId, i, z).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.discussions.BoardTopicsFragment.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Toast.makeText(BoardTopicsFragment.this.getActivity(), isClosed ? R.string.topic_opened : R.string.topic_closed, 0).show();
                if (isClosed) {
                    topic.flags &= -2;
                } else {
                    topic.flags |= 1;
                }
                BoardTopicsFragment.this.updateList();
            }
        }).wrapProgress(getActivity()).exec((View) this.contentView);
    }

    private void toggleFixTopic(final BoardTopic topic) {
        boolean z = true;
        final boolean isFixed = (topic.flags & 2) > 0;
        int groupId = getGroupId();
        int i = topic.id;
        if (isFixed) {
            z = false;
        }
        new BoardFixTopic(groupId, i, z).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.discussions.BoardTopicsFragment.4
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Toast.makeText(BoardTopicsFragment.this.getActivity(), isFixed ? R.string.topic_unfixed : R.string.topic_fixed, 0).show();
                if (isFixed) {
                    topic.flags &= -3;
                } else {
                    topic.flags |= 2;
                }
                if (isFixed) {
                    BoardTopicsFragment.this.data.remove(topic);
                    boolean added = false;
                    for (int i2 = 0; i2 < BoardTopicsFragment.this.data.size() - 1; i2++) {
                        BoardTopic t1 = (BoardTopic) BoardTopicsFragment.this.data.get(i2);
                        BoardTopic t2 = (BoardTopic) BoardTopicsFragment.this.data.get(i2 + 1);
                        if ((t1.flags & 2) <= 0 && ((BoardTopicsFragment.this.defaultOrder == 1 && topic.updated < t1.updated && topic.updated >= t2.updated) || ((BoardTopicsFragment.this.defaultOrder == -1 && topic.updated < t2.updated && topic.updated >= t1.updated) || ((BoardTopicsFragment.this.defaultOrder == 2 && topic.created < t1.created && topic.created >= t2.created) || (BoardTopicsFragment.this.defaultOrder == -2 && topic.created < t2.created && topic.created >= t1.created))))) {
                            added = true;
                            BoardTopicsFragment.this.data.add(i2 + 1, topic);
                        }
                    }
                    if (!added) {
                        BoardTopicsFragment.this.data.add(topic);
                    }
                } else {
                    BoardTopicsFragment.this.data.remove(topic);
                    BoardTopicsFragment.this.data.add(0, topic);
                }
                BoardTopicsFragment.this.updateList();
            }
        }).wrapProgress(getActivity()).exec((View) this.contentView);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        if (requestCode == 1 && resultCode == -1) {
            BoardTopic topic = new BoardTopic();
            topic.id = intent.getIntExtra("id", 0);
            int currentTime = TimeUtils.getCurrentTime();
            topic.created = currentTime;
            topic.updated = currentTime;
            topic.title = intent.getStringExtra("title");
            topic.lastCommentUid = VKAccountManager.getCurrent().getUid();
            topic.numComments = 1;
            topic.creator = VKAccountManager.getCurrent().getUid();
            int i = 0;
            while (true) {
                if (i >= this.data.size()) {
                    break;
                } else if ((((BoardTopic) this.data.get(i)).flags & 2) != 0) {
                    i++;
                } else {
                    this.data.add(i, topic);
                    break;
                }
            }
            updateList();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public class TopicListAdapter extends UsableRecyclerView.Adapter<DiscussionHolder> implements CardItemDecorator.Provider {
        protected TopicListAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public DiscussionHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new DiscussionHolder(parent.getContext(), BoardTopicsFragment.this);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(DiscussionHolder holder, int position) {
            holder.bind(BoardTopicsFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return BoardTopicsFragment.this.data.size();
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            return 6;
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        updateList();
        if (this.refreshOnResume) {
            this.refreshOnResume = false;
            refresh();
        }
    }
}
