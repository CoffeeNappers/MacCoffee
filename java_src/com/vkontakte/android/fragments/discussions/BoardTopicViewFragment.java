package com.vkontakte.android.fragments.discussions;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.text.ClipboardManager;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.KeyboardUtils;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ZhukovLayout;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.board.BoardAddComment;
import com.vkontakte.android.api.board.BoardComment;
import com.vkontakte.android.api.board.BoardCommentLike;
import com.vkontakte.android.api.board.BoardCommentsLoader;
import com.vkontakte.android.api.board.BoardDeleteComment;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.attachments.PendingAttachment;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.VKToolbarFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.stickers.KeyboardPopup;
import com.vkontakte.android.stickers.StickersView;
import com.vkontakte.android.ui.PaginationView;
import com.vkontakte.android.ui.WriteBar;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.comments.CommentViewHolder;
import com.vkontakte.android.ui.holder.commons.LoaderHolder;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.UploadListener;
import com.vkontakte.android.upload.UploadTask;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class BoardTopicViewFragment extends VKToolbarFragment implements PaginationView.Listener, BoardCommentsLoader.BoardCommentsLoaderListener, CommentViewHolder.CommentViewHolderListener<BoardComment>, BackListener, StickersView.Listener {
    private static final int COUNT_OF_PAGE = 20;
    private static final int EDIT_COMMENT_REQUEST = 4329;
    View bigProgress;
    WriteBar commentBar;
    BoardCommentsLoader commentsLoader;
    View createHint;
    KeyboardPopup keyboardPopup;
    LinearLayoutManager layoutManager;
    PaginationView paginationView;
    boolean replyFromGroup;
    StickersView stickersView;
    CommentsAdapter commentsAdapter = new CommentsAdapter();
    PollAdapter pollAdapter = new PollAdapter();
    int bigProgressVisibility = 8;
    int replyTo = -1;
    int replyToUid = -1;
    String replyToName = null;
    boolean sendingComment = false;

    @Override // com.vkontakte.android.stickers.StickersView.Listener
    public void onStickerSelected(int packId, int stickerId, String url, String stickerReferrer) {
        StickerAttachment att = new StickerAttachment();
        att.id = stickerId;
        att.images = new String[]{url, null, null};
        String[] strArr = att.images;
        String[] strArr2 = att.images;
        String str = att.images[0];
        strArr2[2] = str;
        strArr[1] = str;
        att.packID = packId;
        att.stickerReferrer = stickerReferrer;
        sendAttachmentComment(att);
    }

    @Override // com.vk.emoji.EmojiKeyboardListener
    public void onEmojiSelected(String s) {
        EditText edit = (EditText) this.commentBar.findViewById(R.id.writebar_edit);
        int pos = edit.getSelectionEnd();
        edit.getText().insert(pos, s);
        int pos2 = pos + s.length();
        edit.setSelection(pos2, pos2);
    }

    @Override // com.vk.emoji.EmojiKeyboardListener
    public void onBackspace() {
        this.commentBar.findViewById(R.id.writebar_edit).dispatchKeyEvent(new KeyEvent(0, 67));
    }

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        private static String SHOW_LAST_COMMENT = "show_last_comment";
        private static String COMMENTS_COUNT = "comments_count";

        public Builder(int id, int groupId, String title) {
            super(BoardTopicViewFragment.class);
            this.args.putInt("id", id);
            this.args.putInt("group_id", groupId);
            this.args.putString("title", title);
        }

        public Builder setOffset(int offset) {
            this.args.putInt("offset", offset);
            return this;
        }

        public Builder setIsClosed(boolean isClosed) {
            this.args.putBoolean(ArgKeys.IS_CLOSED, isClosed);
            return this;
        }

        public Builder setIsAdmin(boolean isAdmin) {
            this.args.putBoolean(ArgKeys.IS_ADMIN, isAdmin);
            return this;
        }

        public Builder showLast(boolean b, int commentsCount) {
            this.args.putBoolean(SHOW_LAST_COMMENT, b);
            this.args.putInt(COMMENTS_COUNT, commentsCount);
            return this;
        }
    }

    public int getGroupId() {
        return getArguments().getInt("group_id", 0);
    }

    public int getTopicId() {
        return getArguments().getInt("id");
    }

    private int getStartOffset() {
        if (isShowLastComment()) {
            int offsetForLastComment = getCommentsCount() - 20;
            if (offsetForLastComment < 0) {
                return 0;
            }
            return offsetForLastComment;
        }
        return getArguments().getInt("offset", 0);
    }

    private int getCommentsCount() {
        return getArguments().getInt(Builder.COMMENTS_COUNT, 0);
    }

    private boolean isShowLastComment() {
        return getArguments().getBoolean(Builder.SHOW_LAST_COMMENT, false);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if (getArguments().containsKey("title")) {
            setTitle(getArguments().getString("title"));
        }
        ActivityUtils.setBeamLink(activity, "topic-" + getGroupId() + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + getTopicId());
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration cfg) {
        if (this.keyboardPopup != null) {
            this.keyboardPopup.show(false);
            this.keyboardPopup.notifyLayoutHasChanged();
            this.stickersView.dispatchConfigurationChanged(cfg);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.layoutManager = new LinearLayoutManager(getActivity());
        this.commentsLoader = new BoardCommentsLoader(getGroupId(), getTopicId(), 20, this, isShowLastComment()).show(getStartOffset(), getActivity());
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.commentBar = null;
        this.paginationView = null;
        this.keyboardPopup = null;
        this.stickersView = null;
        this.bigProgress = null;
        this.createHint = null;
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.commentsLoader.cancel();
    }

    public boolean canWrite() {
        return !getArguments().getBoolean(ArgKeys.IS_CLOSED, false);
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fr_discussion_view, container, false);
        this.bigProgress = view.findViewById(R.id.bigProgress);
        this.bigProgress.setVisibility(this.bigProgressVisibility);
        this.createHint = view.findViewById(R.id.createHint);
        if (getTopicId() == -1) {
            this.createHint.setVisibility(0);
        }
        UsableRecyclerView list = (UsableRecyclerView) view.findViewById(R.id.list);
        list.setLayoutManager(this.layoutManager);
        DividerItemDecoration dividers = new DividerItemDecoration(new ColorDrawable(637534208), V.dp(0.5f));
        list.addItemDecoration(dividers);
        MergeRecyclerAdapter adapter = new MergeRecyclerAdapter();
        adapter.addAdapter(this.pollAdapter);
        adapter.addAdapter(this.commentsAdapter);
        list.setAdapter(adapter);
        list.setListener(new UsableRecyclerView.ExtendedListener() { // from class: com.vkontakte.android.fragments.discussions.BoardTopicViewFragment.1
            {
                BoardTopicViewFragment.this = this;
            }

            @Override // me.grishka.appkit.views.UsableRecyclerView.ExtendedListener
            public void onScroll(int firstItem, int visibleCount, int total) {
                int firstOffset;
                if (firstItem < 6) {
                    BoardTopicViewFragment.this.commentsLoader.loadTop(BoardTopicViewFragment.this.getActivity());
                } else if (firstItem + visibleCount > total - 6) {
                    BoardTopicViewFragment.this.commentsLoader.loadDown(BoardTopicViewFragment.this.getActivity());
                }
                if (BoardTopicViewFragment.this.paginationView != null && (firstOffset = BoardTopicViewFragment.this.commentsAdapter.getItemOffset(firstItem + visibleCount)) >= 0) {
                    BoardTopicViewFragment.this.paginationView.setCurrentPage((firstOffset == 0 ? 0 : firstOffset / 20) + 1);
                }
            }

            @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
            public void onScrolledToLastItem() {
            }

            @Override // me.grishka.appkit.views.UsableRecyclerView.Listener
            public void onScrollStarted() {
            }
        });
        view.addOnLayoutChangeListener(BoardTopicViewFragment$$Lambda$1.lambdaFactory$(this));
        this.commentBar = (WriteBar) view.findViewById(R.id.commentBar);
        if (!canWrite()) {
            this.commentBar.setVisibility(8);
        }
        this.stickersView = new StickersView(getActivity(), this);
        this.keyboardPopup = new KeyboardPopup(getActivity(), view, this.stickersView);
        this.keyboardPopup.attachToAnchor(this.commentBar.getAnchor(), -1315086);
        this.keyboardPopup.setOnVisibilityChangedListener(this.commentBar);
        this.commentBar.setAutoSuggestPopupListener(this);
        this.commentBar.setGraffitiAllowed(true);
        this.commentBar.setGraffitiSender(BoardTopicViewFragment$$Lambda$2.lambdaFactory$(this));
        this.commentBar.setKeyboardPopup(this.keyboardPopup);
        this.commentBar.findViewById(R.id.writebar_edit).setOnKeyListener(BoardTopicViewFragment$$Lambda$3.lambdaFactory$(this));
        this.commentBar.findViewById(R.id.writebar_send).setOnLongClickListener(BoardTopicViewFragment$$Lambda$4.lambdaFactory$(this));
        this.commentBar.setOnSendClickListener(BoardTopicViewFragment$$Lambda$5.lambdaFactory$(this));
        this.commentBar.setFragment(this);
        this.commentBar.setUploadType(true, -getGroupId());
        this.commentBar.setAttachLimits(10, false);
        this.paginationView = (PaginationView) view.findViewById(R.id.paginationView);
        this.paginationView.setListener(this);
        fillPageCount();
        return view;
    }

    public /* synthetic */ void lambda$onCreateContentView$0(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
        if (left != oldLeft || right != oldRight || top != oldTop || bottom != oldBottom) {
            this.keyboardPopup.notifyLayoutHasChanged();
        }
    }

    public /* synthetic */ void lambda$onCreateContentView$1(GraffitiAttachment graffiti) {
        if (graffiti instanceof PendingAttachment) {
            sendPendingAttachmentComment((PendingAttachment) graffiti);
        } else {
            sendAttachmentComment(graffiti);
        }
    }

    public /* synthetic */ boolean lambda$onCreateContentView$2(View v, int keyCode, KeyEvent event) {
        if (keyCode != 4 || this.keyboardPopup == null || !this.keyboardPopup.isShowing()) {
            return false;
        }
        if (event.getAction() != 1) {
            return true;
        }
        this.keyboardPopup.show(false);
        return true;
    }

    public /* synthetic */ boolean lambda$onCreateContentView$4(View view1) {
        if (Groups.getAdminLevel(getGroupId()) < 2) {
            return false;
        }
        PopupMenu menu = new PopupMenu(getActivity(), this.commentBar.findViewById(R.id.writebar_send));
        menu.getMenu().add(R.string.reply_from_group);
        menu.setOnMenuItemClickListener(BoardTopicViewFragment$$Lambda$11.lambdaFactory$(this));
        menu.show();
        return true;
    }

    public /* synthetic */ boolean lambda$null$3(MenuItem menuItem) {
        this.replyFromGroup = true;
        if (this.commentBar.isUploading()) {
            waitAndSendComment();
        } else {
            sendComment();
        }
        return true;
    }

    public /* synthetic */ void lambda$onCreateContentView$5(View v) {
        if (this.commentBar.isUploading()) {
            waitAndSendComment();
        } else {
            sendComment();
        }
    }

    public void sendAttachmentComment(Attachment att) {
        sendComment("", Collections.singletonList(att), false);
    }

    private void sendPendingAttachmentComment(PendingAttachment att) {
        if (getActivity() != null) {
            final ProgressDialog progress = new ProgressDialog(getActivity());
            progress.setMessage(getString(R.string.loading));
            progress.setCancelable(true);
            progress.setCanceledOnTouchOutside(false);
            progress.show();
            UploadListener uploadListener = new UploadListener(att.getUploadId(), new UploadListener.UploadListenerCallback() { // from class: com.vkontakte.android.fragments.discussions.BoardTopicViewFragment.2
                {
                    BoardTopicViewFragment.this = this;
                }

                @Override // com.vkontakte.android.upload.UploadListener.UploadListenerCallback
                public void onProgress(int id, int done, int total) {
                }

                @Override // com.vkontakte.android.upload.UploadListener.UploadListenerCallback
                public void onDone(int id, Attachment attachment) {
                    progress.setOnCancelListener(null);
                    ViewUtils.dismissDialogSafety(progress);
                    BoardTopicViewFragment.this.sendAttachmentComment(attachment);
                }

                @Override // com.vkontakte.android.upload.UploadListener.UploadListenerCallback
                public void onFailed(int id, Attachment attachment) {
                    progress.setOnCancelListener(null);
                    ViewUtils.dismissDialogSafety(progress);
                    Toast.makeText(BoardTopicViewFragment.this.getActivity(), (int) R.string.error, 0).show();
                }
            });
            UploadTask task = att.mo901createUploadTask(getActivity());
            progress.setOnCancelListener(BoardTopicViewFragment$$Lambda$6.lambdaFactory$(task, uploadListener));
            uploadListener.startListener();
            Upload.start(getActivity(), task);
        }
    }

    public static /* synthetic */ void lambda$sendPendingAttachmentComment$6(UploadTask task, UploadListener uploadListener, DialogInterface dialog) {
        Upload.cancel(task.getID());
        uploadListener.stopListener();
    }

    @Override // com.vkontakte.android.ui.PaginationView.Listener
    public void onPageSelected(int num) {
        L.e(Integer.valueOf(num));
        if (num > 0) {
            this.paginationView.setCurrentPage(num);
            showOffset((num - 1) * 20);
            return;
        }
        TextView tv = new TextView(getActivity());
        tv.setText(getResources().getString(R.string.page_explain, Integer.valueOf(this.paginationView.getPageCount())));
        EditText edit = new EditText(getActivity());
        edit.setInputType(8192);
        edit.setWidth(Global.scale(200.0f));
        edit.setText(String.valueOf(this.paginationView.getCurrentPage()));
        edit.setInputType(2);
        edit.setSelection(edit.getText().length());
        LinearLayout ll = new LinearLayout(getActivity());
        ll.setOrientation(1);
        ll.addView(tv);
        ll.addView(edit);
        int padding = Global.scale(10.0f);
        ll.setPadding(padding, padding, padding, padding);
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.jump_to_page).setView(ll).setPositiveButton(R.string.ok, BoardTopicViewFragment$$Lambda$7.lambdaFactory$(this, edit)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
        KeyboardUtils.showKeyboard(edit);
    }

    public /* synthetic */ void lambda$onPageSelected$7(EditText edit, DialogInterface dialog, int which) {
        try {
            int n = Integer.parseInt(edit.getText().toString());
            if (n > 0 && n <= this.paginationView.getPageCount()) {
                onPageSelected(n);
            }
        } catch (Exception e) {
        }
    }

    @Override // com.vkontakte.android.ui.holder.comments.CommentViewHolder.CommentViewHolderListener
    public void likeComment(final BoardComment comm) {
        boolean z = true;
        Context activity = getActivity();
        if (activity != null) {
            VKAPIRequest request = new BoardCommentLike(comm.isLiked(), comm.ownerId, comm.getId()).setCallback(new Callback<BoardCommentLike.Result>() { // from class: com.vkontakte.android.fragments.discussions.BoardTopicViewFragment.3
                {
                    BoardTopicViewFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(BoardCommentLike.Result res) {
                    if (res != null) {
                        comm.isLiked = res.isLiked;
                        comm.likesCount = res.likeCount;
                        BoardTopicViewFragment.this.commentsAdapter.notifyDataSetChanged();
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse err) {
                    Activity activity2 = BoardTopicViewFragment.this.getActivity();
                    if (activity2 != null) {
                        Toast.makeText(BoardTopicViewFragment.this.getActivity(), (int) R.string.error, 1).show();
                    }
                }
            });
            comm.likesCount = (comm.isLiked ? -1 : 1) + comm.likesCount;
            if (comm.isLiked) {
                z = false;
            }
            comm.isLiked = z;
            this.commentsAdapter.notifyDataSetChanged();
            request.exec(activity);
        }
    }

    private void waitAndSendComment() {
        ProgressDialog progress = new ProgressDialog(getActivity());
        progress.setMessage(getString(R.string.loading));
        progress.setCancelable(true);
        progress.setCanceledOnTouchOutside(false);
        progress.show();
        Runnable onDone = BoardTopicViewFragment$$Lambda$8.lambdaFactory$(this, progress);
        Runnable onFailed = BoardTopicViewFragment$$Lambda$9.lambdaFactory$(this, progress);
        this.commentBar.waitForUploads(onDone, onFailed);
    }

    public /* synthetic */ void lambda$waitAndSendComment$8(ProgressDialog progress) {
        ViewUtils.dismissDialogSafety(progress);
        sendComment();
    }

    public /* synthetic */ void lambda$waitAndSendComment$9(ProgressDialog progress) {
        ViewUtils.dismissDialogSafety(progress);
        Toast.makeText(getActivity(), (int) R.string.error, 0).show();
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (reqCode == EDIT_COMMENT_REQUEST && resCode == -1) {
            BoardComment ce = (BoardComment) data.getParcelableExtra("comment");
            for (BoardComment comm : this.commentsAdapter.comments) {
                if (comm.id == ce.id) {
                    comm.text = ce.text;
                    comm.attachments.clear();
                    comm.attachments.addAll(ce.attachments);
                    comm.processLinksAndEmoji();
                    DisplayMetrics metrics = VKApplication.context.getResources().getDisplayMetrics();
                    int tSize = Math.min(Math.min(metrics.widthPixels, metrics.heightPixels) - Global.scale(95.0f), 604);
                    ZhukovLayout.processThumbs(tSize, (int) (tSize * 0.666f), comm.attachments);
                    this.commentsAdapter.notifyDataSetChanged();
                    return;
                }
            }
        } else if (reqCode > 10000) {
            this.commentBar.onActivityResult(reqCode, resCode, data);
        }
    }

    private void sendComment() {
        if (!this.sendingComment) {
            this.sendingComment = true;
            String txt = this.commentBar.getText();
            if (txt.length() != 0 || this.commentBar.getAttachments().size() != 0) {
                sendComment(txt, this.commentBar.getAttachments(), true);
            }
        }
    }

    private void sendComment(final String txt, final List<Attachment> atts, final boolean clearCommentBar) {
        String text;
        final Activity activity = getActivity();
        if (activity != null) {
            final boolean fromGroup = this.replyFromGroup;
            if (clearCommentBar && this.replyTo > 0 && txt != null && txt.startsWith(this.replyToName + ",")) {
                text = txt.replaceFirst(this.replyToName, "[post" + this.replyTo + "|" + this.replyToName + "]");
            } else {
                text = txt;
            }
            final String str = text;
            new BoardAddComment(getGroupId(), getTopicId(), text, atts, getArguments().getString("title"), fromGroup).setCallback(new SimpleCallback<Integer>(this) { // from class: com.vkontakte.android.fragments.discussions.BoardTopicViewFragment.4
                {
                    BoardTopicViewFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(Integer cid) {
                    String textLocal = str;
                    if (clearCommentBar) {
                        if (BoardTopicViewFragment.this.replyTo > 0 && txt != null && txt.startsWith(BoardTopicViewFragment.this.replyToName + ",")) {
                            textLocal = txt.replaceFirst(BoardTopicViewFragment.this.replyToName, BoardTopicViewFragment.this.createReplyLink(BoardTopicViewFragment.this.replyToUid, BoardTopicViewFragment.this.replyToName, BoardTopicViewFragment.this.getGroupId(), BoardTopicViewFragment.this.replyTo));
                        }
                        BoardTopicViewFragment.this.commentBar.setText("");
                        BoardTopicViewFragment.this.commentBar.clearAttachments();
                        BoardTopicViewFragment.this.replyFromGroup = false;
                        BoardTopicViewFragment.this.replyTo = -1;
                    }
                    if (BoardTopicViewFragment.this.getTopicId() == -1) {
                        ViewUtils.setVisibility(BoardTopicViewFragment.this.createHint, 8);
                        BoardTopicViewFragment.this.getArguments().putInt("id", cid.intValue());
                        BoardTopicViewFragment.this.sendingComment = false;
                        BoardTopicViewFragment.this.commentsLoader.setTopicId(cid.intValue());
                        BoardTopicViewFragment.this.commentsLoader.init(0, activity);
                    } else if (BoardTopicViewFragment.this.commentsLoader.isEndOfListLoaded()) {
                        BoardTopicViewFragment.this.commentsLoader.insertComment(BoardComment.createNewComment(BoardTopicViewFragment.this.getGroupId(), cid.intValue(), atts, textLocal, fromGroup));
                        BoardTopicViewFragment.this.sendingComment = false;
                    } else {
                        Toast.makeText(BoardTopicViewFragment.this.getActivity(), (int) R.string.board_comment_sent, 0).show();
                        BoardTopicViewFragment.this.sendingComment = false;
                    }
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                    BoardTopicViewFragment.this.sendingComment = false;
                }
            }).wrapProgress(getActivity()).exec((Context) activity);
        }
    }

    String createReplyLink(int id, String name, int groupId, int replyTo) {
        return "[" + (id > 0 ? "id" + id : "club" + (-id)) + ":bp-" + groupId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + replyTo + "|" + name + "]";
    }

    @Override // com.vkontakte.android.ui.holder.comments.CommentViewHolder.CommentViewHolderListener
    public void showCommentActions(BoardComment comment) {
        ArrayList<String> options = new ArrayList<>();
        options.addAll(comment.linkTitles);
        options.add(getResources().getString(R.string.copy_text));
        if ((getArguments().getBoolean(ArgKeys.IS_ADMIN, false) || comment.uid == VKAccountManager.getCurrent().getUid()) && comment.offset != 0) {
            options.add(getResources().getString(R.string.delete));
            if (!comment.containsGraffiti()) {
                options.add(getString(R.string.edit));
            }
        }
        new VKAlertDialog.Builder(getActivity()).setItems((CharSequence[]) options.toArray(new String[options.size()]), BoardTopicViewFragment$$Lambda$10.lambdaFactory$(this, comment)).show();
    }

    public /* synthetic */ void lambda$showCommentActions$10(BoardComment comment, DialogInterface dialog, int which) {
        if (which < comment.linkUrls.size()) {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(comment.linkUrls.get(which)));
            startActivity(intent);
            return;
        }
        switch (which - comment.linkUrls.size()) {
            case 0:
                ClipboardManager clipboard = (ClipboardManager) getActivity().getSystemService("clipboard");
                clipboard.setText(comment.text);
                Toast.makeText(getActivity(), (int) R.string.text_copied, 0).show();
                return;
            case 1:
                deleteComment(comment);
                return;
            case 2:
                editComment(comment);
                return;
            default:
                return;
        }
    }

    private void editComment(BoardComment comm) {
        new NewPostFragment.Builder().setBoardComment(comm, getTopicId(), getGroupId()).forResult(this, EDIT_COMMENT_REQUEST);
    }

    private void deleteComment(final BoardComment comment) {
        Activity activity = getActivity();
        if (activity != null) {
            new BoardDeleteComment(getGroupId(), getTopicId(), comment.id).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.discussions.BoardTopicViewFragment.5
                {
                    BoardTopicViewFragment.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    BoardTopicViewFragment.this.commentsLoader.removeComment(comment);
                }
            }).wrapProgress(activity).exec((Context) activity);
        }
    }

    @Override // com.vkontakte.android.ui.holder.comments.CommentViewHolder.CommentViewHolderListener
    public void replyToComment(BoardComment comment) {
        replyToComment(comment, false);
    }

    public void replyToComment(BoardComment comment, boolean fromGroup) {
        this.replyTo = comment.getId();
        this.replyToUid = comment.uid;
        this.replyToName = comment.userName.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR)[0];
        this.replyFromGroup = fromGroup;
        if (!getArguments().getBoolean(ArgKeys.IS_CLOSED, false)) {
            if (this.commentBar.isTextEmpty()) {
                this.commentBar.setText(this.replyToName + ", ");
            }
            this.commentBar.focus();
            InputMethodManager imm = (InputMethodManager) getActivity().getSystemService("input_method");
            imm.showSoftInput(this.commentBar.findViewById(R.id.writebar_edit), 1);
        }
    }

    @Override // com.vkontakte.android.api.board.BoardCommentsLoader.BoardCommentsLoaderListener
    public void updatePool(PollAttachment pollAttachment) {
        this.pollAdapter.setPollAttachment(pollAttachment);
    }

    @Override // com.vkontakte.android.attachments.StickerAttachment.Callback
    public void openStickerKeyboard(int pack) {
        if (!getArguments().getBoolean(ArgKeys.IS_CLOSED, false)) {
            this.keyboardPopup.show(true);
            this.stickersView.openPack(pack);
        }
    }

    public void hideEmojiPopup() {
        if (this.keyboardPopup != null && this.keyboardPopup.isShowing()) {
            this.keyboardPopup.hide();
        }
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.keyboardPopup == null || !this.keyboardPopup.isShowing()) {
            return false;
        }
        hideEmojiPopup();
        return true;
    }

    @Override // com.vkontakte.android.api.board.BoardCommentsLoader.BoardCommentsLoaderListener
    public void onCommentLoaded(int from, int count, boolean isTop, List<BoardComment> allLoadedData) {
        if (isTop) {
            int firstPosition = this.layoutManager.findFirstVisibleItemPosition();
            View view = this.layoutManager.findViewByPosition(firstPosition);
            int dy = view == null ? 0 : view.getTop();
            this.commentsAdapter.setData(allLoadedData, true);
            this.layoutManager.scrollToPositionWithOffset(firstPosition + count, dy);
            return;
        }
        this.commentsAdapter.setData(allLoadedData, true);
    }

    @Override // com.vkontakte.android.api.board.BoardCommentsLoader.BoardCommentsLoaderListener
    public void updateTotal(int total) {
        fillPageCount();
    }

    @Override // com.vkontakte.android.api.board.BoardCommentsLoader.BoardCommentsLoaderListener
    public void onItemDeleted(int index, List<BoardComment> allLoadedData) {
        this.commentsAdapter.setData(allLoadedData, false);
        this.commentsAdapter.notifyItemRemoved(index);
    }

    @Override // com.vkontakte.android.api.board.BoardCommentsLoader.BoardCommentsLoaderListener
    public void onStartLoading(int currentDataSize, boolean isTop) {
        View view = this.bigProgress;
        int i = currentDataSize == 0 ? 0 : 8;
        this.bigProgressVisibility = i;
        ViewUtils.setVisibility(view, i);
    }

    @Override // com.vkontakte.android.api.board.BoardCommentsLoader.BoardCommentsLoaderListener
    public void onFinishLoading(int currentDataSize, boolean isTop) {
        View view = this.bigProgress;
        this.bigProgressVisibility = 8;
        ViewUtils.setVisibility(view, 8);
    }

    @Override // com.vkontakte.android.api.board.BoardCommentsLoader.BoardCommentsLoaderListener
    public void onStartReload() {
        this.commentsAdapter.setData(new ArrayList(), true);
    }

    @Override // com.vkontakte.android.api.board.BoardCommentsLoader.BoardCommentsLoaderListener
    public void scrollToPosition(int position, boolean smooth) {
        if (smooth) {
            this.layoutManager.scrollToPositionWithOffset(this.pollAdapter.getItemCount() + position, 0);
        } else {
            this.layoutManager.scrollToPositionWithOffset(this.pollAdapter.getItemCount() + position, 0);
        }
    }

    void fillPageCount() {
        int total = this.commentsLoader.getTotal();
        if (this.paginationView != null && total >= 0) {
            int pageCount = (total / 20) + (total % 20 > 0 ? 1 : 0);
            this.paginationView.setPageCount(pageCount);
            if (pageCount <= 1) {
                this.paginationView.setVisibility(8);
                return;
            } else if (this.paginationView.getVisibility() != 0) {
                V.setVisibilityAnimated(this.paginationView, 0);
                return;
            } else {
                return;
            }
        }
        ViewUtils.setVisibility(this.paginationView, 8);
    }

    public void showOffset(int offset) {
        this.commentsLoader.show(offset, getActivity());
    }

    /* loaded from: classes2.dex */
    public static class PollViewHolder extends RecyclerHolder<PollAttachment> {
        public PollViewHolder(ViewGroup parent) {
            super(new LinearLayout(parent.getContext()));
            this.itemView.setPadding(0, V.dp(8.0f), 0, V.dp(8.0f));
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(PollAttachment item) {
            View reusableView = ((ViewGroup) this.itemView).getChildAt(0);
            View newView = item.getViewForList(getContext(), reusableView);
            if (reusableView != newView) {
                ((ViewGroup) this.itemView).removeAllViews();
                ((ViewGroup) this.itemView).addView(newView);
            }
        }
    }

    /* loaded from: classes2.dex */
    static class PollAdapter extends UsableRecyclerView.Adapter<PollViewHolder> {
        PollAttachment pollAttachment = null;

        PollAdapter() {
        }

        public void setPollAttachment(PollAttachment pollAttachment) {
            this.pollAttachment = pollAttachment;
            notifyDataSetChanged();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public PollViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new PollViewHolder(parent);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(PollViewHolder holder, int position) {
            holder.bind(this.pollAttachment);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.pollAttachment == null ? 0 : 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 2;
        }
    }

    /* loaded from: classes2.dex */
    public class CommentsAdapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
        List<BoardComment> comments = Collections.emptyList();

        CommentsAdapter() {
            BoardTopicViewFragment.this = this$0;
        }

        boolean isNeedShowDownLoader() {
            return this.comments.size() > 0 && !BoardTopicViewFragment.this.commentsLoader.isDownLoaded();
        }

        boolean isNeedShowUpLoader() {
            return false;
        }

        void setData(List<BoardComment> comments, boolean notify) {
            this.comments = comments;
            if (notify) {
                notifyDataSetChanged();
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return ((!isNeedShowUpLoader() || position != 0) && (!isNeedShowDownLoader() || position != getItemCount() + (-1))) ? 0 : 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return viewType == 1 ? new LoaderHolder(parent) : new CommentViewHolder(parent, BoardTopicViewFragment.this).setCanReply(BoardTopicViewFragment.this.canWrite());
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            if (isNeedShowUpLoader()) {
                position--;
            }
            if (position < this.comments.size() && position >= 0) {
                ((CommentViewHolder) holder).bind(this.comments.get(position));
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            int i = 1;
            int size = (isNeedShowDownLoader() ? 1 : 0) + this.comments.size();
            if (!isNeedShowUpLoader()) {
                i = 0;
            }
            return size + i;
        }

        public int getItemOffset(int position) {
            if (position < 0 || position >= this.comments.size()) {
                return -1;
            }
            return this.comments.get(position).offset;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            if (isNeedShowUpLoader()) {
                position--;
            }
            if (position < 0 || position >= this.comments.size()) {
                return 0;
            }
            int count = 1;
            Iterator<Attachment> it = this.comments.get(position).attachments.iterator();
            while (it.hasNext()) {
                Attachment att = it.next();
                if (att instanceof ImageAttachment) {
                    count++;
                }
            }
            return count;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            if (isNeedShowUpLoader()) {
                position--;
            }
            if (position < 0 || position >= this.comments.size()) {
                return null;
            }
            switch (image) {
                case 0:
                    return this.comments.get(position).userPhoto;
                default:
                    int imgindex = 0;
                    Iterator<Attachment> it = this.comments.get(position).attachments.iterator();
                    while (it.hasNext()) {
                        Attachment att = it.next();
                        if ((att instanceof ImageAttachment) && (imgindex = imgindex + 1) == image) {
                            return ((ImageAttachment) att).getImageURL();
                        }
                    }
                    return null;
            }
        }
    }
}
