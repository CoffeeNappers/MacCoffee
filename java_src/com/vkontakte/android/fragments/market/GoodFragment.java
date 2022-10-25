package com.vkontakte.android.fragments.market;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.ClipboardManager;
import android.text.Spannable;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.PopupMenu;
import android.widget.Toast;
import com.facebook.internal.NativeProtocol;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.ExpandTextSpan;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.board.BoardComment;
import com.vkontakte.android.api.market.MarketAddComment;
import com.vkontakte.android.api.market.MarketDeleteComment;
import com.vkontakte.android.api.market.MarketGoodGetFullPage;
import com.vkontakte.android.api.wall.WallLike;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.attachments.MarketAttachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Wiki;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.CardRecyclerFragment;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.stickers.KeyboardPopup;
import com.vkontakte.android.stickers.StickersView;
import com.vkontakte.android.ui.WriteBar;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.RecyclerSectionAdapter;
import com.vkontakte.android.ui.holder.comments.CommentViewHolder;
import com.vkontakte.android.ui.holder.commons.ArrowItemHolder;
import com.vkontakte.android.ui.holder.commons.BackgroundHolder;
import com.vkontakte.android.ui.holder.commons.DescriptionHolder;
import com.vkontakte.android.ui.holder.commons.TitleHolder;
import com.vkontakte.android.ui.holder.market.GoodGroupCategoryHolder;
import com.vkontakte.android.ui.holder.market.GoodLikesHolder;
import com.vkontakte.android.ui.holder.market.GoodNameHolder;
import com.vkontakte.android.ui.holder.market.GoodTabletHeaderHolder;
import com.vkontakte.android.ui.holder.market.SquareGalleryHolder;
import com.vkontakte.android.ui.holder.market.WriteButtonHolder;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes2.dex */
public class GoodFragment extends CardRecyclerFragment<RecyclerSectionAdapter.Data> implements CommentViewHolder.CommentViewHolderListener<BoardComment>, BackListener, StickersView.Listener {
    private static final int EDIT_COMMENT_REQUEST = 124329;
    private Adapter adapter;
    private WriteBar commentBar;
    private View commentBarShadow;
    private RecyclerSectionAdapter.Data dataLikes;
    private List<RecyclerSectionAdapter.Data> goodData;
    private int indexWriteButton;
    private EditText input;
    private KeyboardPopup keyboardPopup;
    private int lastContactId;
    private String lastContactName;
    private String lastContactPhoto;
    private Good lastGood;
    private int lastTotal;
    private View messageButton;
    private View messageButtonShadow;
    private final ArrayList<BoardComment> newsComments;
    private MarketOnClickListener onClickWriteButton;
    private boolean replyFromGroup;
    private int replyTo;
    private String replyToName;
    private int replyToUid;
    private boolean sendingComment;
    private StickersView stickersView;

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
        sendStickerComment(att);
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

        /* loaded from: classes2.dex */
        public enum Source {
            group_module,
            market,
            fave,
            feed,
            wall,
            im,
            link
        }

        public Builder(@NonNull Source source, int ownerId, int goodId) {
            super(GoodFragment.class);
            this.args.putInt("owner_id", ownerId);
            this.args.putInt("id", goodId);
            this.args.putString(ShareConstants.FEED_SOURCE_PARAM, source.name());
        }

        public Builder(@NonNull Source source, Good good) {
            super(GoodFragment.class);
            this.args.putInt("owner_id", good.owner_id);
            this.args.putInt("id", good.id);
            this.args.putString(ShareConstants.FEED_SOURCE_PARAM, source.name());
        }
    }

    /* loaded from: classes2.dex */
    public class MarketOnClickListener implements View.OnClickListener {
        public MarketOnClickListener() {
            GoodFragment.this = this$0;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (GoodFragment.this.lastGood != null && GoodFragment.this.lastContactId != 0 && GoodFragment.this.lastGood.availability == 0) {
                Analytics.track("market_contact").addParam(FirebaseAnalytics.Param.ITEM_ID, GoodFragment.this.lastGood.owner_id + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + GoodFragment.this.lastGood.id).addParam(NativeProtocol.WEB_DIALOG_ACTION, TtmlNode.START).commit();
                new ChatFragment.Builder(GoodFragment.this.lastContactId, GoodFragment.this.lastContactName).setPhoto(GoodFragment.this.lastContactPhoto).setAttachments(new Parcelable[]{new MarketAttachment(GoodFragment.this.lastGood, false)}).go(v.getContext());
            }
        }

        public Good getGood() {
            return GoodFragment.this.lastGood;
        }
    }

    public GoodFragment() {
        super(20);
        this.adapter = new Adapter();
        this.goodData = null;
        this.dataLikes = null;
        this.newsComments = new ArrayList<>();
        this.indexWriteButton = 0;
        this.replyTo = -1;
        this.replyToUid = -1;
        this.replyToName = null;
        this.sendingComment = false;
        this.lastTotal = 0;
        this.onClickWriteButton = new MarketOnClickListener();
    }

    int getOwnerId() {
        return getArguments().getInt("owner_id");
    }

    int getItemId() {
        return getArguments().getInt("id");
    }

    String getSource() {
        return getArguments().getString(ShareConstants.FEED_SOURCE_PARAM);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setListLayoutId(R.layout.fr_good);
        setHasOptionsMenu(true);
        setTitle(R.string.good);
        Analytics.track("open_market_item").addParam("item_ids", getOwnerId() + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + getItemId()).addParam(ShareConstants.FEED_SOURCE_PARAM, getSource()).commit();
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration cfg) {
        super.onConfigurationChanged(cfg);
        if (this.keyboardPopup != null) {
            this.keyboardPopup.show(false);
            this.keyboardPopup.notifyLayoutHasChanged();
            this.stickersView.dispatchConfigurationChanged(cfg);
        }
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.commentBar = null;
        this.input = null;
        this.keyboardPopup = null;
        this.stickersView = null;
        this.commentBarShadow = null;
        this.messageButton = null;
        this.messageButtonShadow = null;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected View onCreateFooterView(LayoutInflater inflater) {
        return null;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateContentView(inflater, container, savedInstanceState);
        view.addOnLayoutChangeListener(GoodFragment$$Lambda$1.lambdaFactory$(this));
        this.commentBar = (WriteBar) view.findViewById(R.id.commentBar);
        this.input = (EditText) this.commentBar.findViewById(R.id.writebar_edit);
        this.commentBarShadow = view.findViewById(R.id.commentBarShadow);
        this.messageButton = view.findViewById(R.id.writeButton);
        this.messageButton.findViewById(16908313).setOnClickListener(this.onClickWriteButton);
        if (this.lastGood != null) {
            ViewUtils.setEnabled(this.messageButton, this.lastGood.availability == 0);
        }
        this.messageButtonShadow = view.findViewById(R.id.writeButtonShadow);
        if (this.isTablet) {
            this.commentBar.setVisibility(0);
            this.commentBarShadow.setVisibility(0);
            this.messageButton.setVisibility(8);
            this.messageButtonShadow.setVisibility(8);
        }
        if (!canWrite()) {
            ViewUtils.setEnabled(this.commentBar, false);
        }
        this.stickersView = new StickersView(getActivity(), this);
        this.keyboardPopup = new KeyboardPopup(getActivity(), view, this.stickersView);
        this.keyboardPopup.attachToAnchor(this.commentBar.getAnchor(), -1315086);
        this.keyboardPopup.setOnVisibilityChangedListener(this.commentBar);
        this.commentBar.setAutoSuggestPopupListener(this);
        this.commentBar.setKeyboardPopup(this.keyboardPopup);
        this.commentBar.findViewById(R.id.writebar_edit).setOnKeyListener(GoodFragment$$Lambda$2.lambdaFactory$(this));
        this.commentBar.setOnSendClickListener(GoodFragment$$Lambda$3.lambdaFactory$(this));
        this.commentBar.findViewById(R.id.writebar_send).setOnLongClickListener(GoodFragment$$Lambda$4.lambdaFactory$(this));
        this.commentBar.setFragment(this);
        this.commentBar.setUploadType(true, -getOwnerId());
        this.commentBar.setAttachLimits(10, false);
        return view;
    }

    public /* synthetic */ void lambda$onCreateContentView$0(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
        if (left != oldLeft || right != oldRight || top != oldTop || bottom != oldBottom) {
            this.keyboardPopup.notifyLayoutHasChanged();
            this.list.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.market.GoodFragment.1
                {
                    GoodFragment.this = this;
                }

                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    GoodFragment.this.list.getViewTreeObserver().removeOnPreDrawListener(this);
                    GoodFragment.this.processScroll(GoodFragment.this.list);
                    return false;
                }
            });
        }
    }

    public /* synthetic */ boolean lambda$onCreateContentView$1(View v, int keyCode, KeyEvent event) {
        if (keyCode != 4 || this.keyboardPopup == null || !this.keyboardPopup.isShowing()) {
            return false;
        }
        if (event.getAction() != 1) {
            return true;
        }
        this.keyboardPopup.show(false);
        return true;
    }

    public /* synthetic */ void lambda$onCreateContentView$2(View v) {
        if (this.commentBar.isUploading()) {
            waitAndSendComment();
        } else {
            sendComment();
        }
    }

    public /* synthetic */ boolean lambda$onCreateContentView$4(View view1) {
        if (getOwnerId() < 0 && Groups.getAdminLevel(getOwnerId()) < 2) {
            return false;
        }
        PopupMenu menu = new PopupMenu(getActivity(), this.commentBar.findViewById(R.id.writebar_send));
        menu.getMenu().add(R.string.reply_from_group);
        menu.setOnMenuItemClickListener(GoodFragment$$Lambda$14.lambdaFactory$(this));
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

    private void sendStickerComment(StickerAttachment att) {
        sendComment("", Collections.singletonList(att), false);
    }

    private void waitAndSendComment() {
        ProgressDialog progress = new ProgressDialog(getActivity());
        progress.setMessage(getString(R.string.loading));
        progress.setCancelable(true);
        progress.setCanceledOnTouchOutside(false);
        progress.show();
        Runnable onDone = GoodFragment$$Lambda$5.lambdaFactory$(this, progress);
        Runnable onFailed = GoodFragment$$Lambda$6.lambdaFactory$(this, progress);
        this.commentBar.waitForUploads(onDone, onFailed);
    }

    public /* synthetic */ void lambda$waitAndSendComment$5(ProgressDialog progress) {
        ViewUtils.dismissDialogSafety(progress);
        sendComment();
    }

    public /* synthetic */ void lambda$waitAndSendComment$6(ProgressDialog progress) {
        ViewUtils.dismissDialogSafety(progress);
        Toast.makeText(getActivity(), (int) R.string.error, 0).show();
    }

    @Override // com.vkontakte.android.ui.holder.comments.CommentViewHolder.CommentViewHolderListener
    public void likeComment(final BoardComment comm) {
        WallLike.market(comm, getOwnerId()).setCallback(new Callback<WallLike.Result>() { // from class: com.vkontakte.android.fragments.market.GoodFragment.2
            {
                GoodFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(WallLike.Result res) {
                comm.isLiked = !comm.isLiked;
                comm.likesCount = res.likes;
                GoodFragment.this.updateList();
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
                if (GoodFragment.this.getActivity() != null) {
                    Toast.makeText(GoodFragment.this.getActivity(), (int) R.string.error, 1).show();
                }
            }
        }).exec((View) this.contentView);
    }

    @Override // com.vkontakte.android.ui.holder.comments.CommentViewHolder.CommentViewHolderListener
    public void showCommentActions(BoardComment comment) {
        ArrayList<String> options = new ArrayList<>();
        options.add(getResources().getString(R.string.copy_text));
        if (getArguments().getBoolean(ArgKeys.IS_ADMIN, false) || VKAccountManager.isCurrentUser(comment.uid)) {
            options.add(getResources().getString(R.string.delete));
            options.add(getString(R.string.edit));
        }
        new VKAlertDialog.Builder(getActivity()).setItems((CharSequence[]) options.toArray(new String[options.size()]), GoodFragment$$Lambda$7.lambdaFactory$(this, comment)).show();
    }

    public /* synthetic */ void lambda$showCommentActions$7(BoardComment comment, DialogInterface dialog, int which) {
        switch (which) {
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

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.keyboardPopup == null || !this.keyboardPopup.isShowing()) {
            return false;
        }
        hideEmojiPopup();
        return true;
    }

    public void hideEmojiPopup() {
        if (this.keyboardPopup != null && this.keyboardPopup.isShowing()) {
            this.keyboardPopup.hide();
        }
    }

    @Override // com.vkontakte.android.attachments.StickerAttachment.Callback
    public void openStickerKeyboard(int pack) {
        if (canWrite()) {
            this.keyboardPopup.show(true);
            this.stickersView.openPack(pack);
        }
    }

    public void deleteComment(final BoardComment comment) {
        Activity activity = getActivity();
        if (activity != null) {
            new MarketDeleteComment(getOwnerId(), comment.id).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.market.GoodFragment.3
                {
                    GoodFragment.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    GoodFragment.this.newsComments.remove(comment);
                    GoodFragment.this.adapter.clear(false);
                    GoodFragment.this.adapter.addAll(GoodFragment.this.goodData, false);
                    GoodFragment.this.adapter.addAll(GoodFragment.this.createCommentsDataList(GoodFragment.this.newsComments, GoodFragment.this.lastTotal - 1), false);
                    GoodFragment.this.adapter.notifyDataSetChanged();
                }
            }).wrapProgress(activity).exec((Context) activity);
        }
    }

    public void editComment(BoardComment comm) {
        new NewPostFragment.Builder().setMarketComment(comm, getOwnerId()).forResult(this, EDIT_COMMENT_REQUEST);
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

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (reqCode == EDIT_COMMENT_REQUEST && resCode == -1) {
            BoardComment ce = (BoardComment) data.getParcelableExtra("comment");
            int i = 0;
            while (true) {
                if (i < this.newsComments.size()) {
                    if (this.newsComments.get(i).id != ce.id) {
                        i++;
                    } else {
                        this.newsComments.set(i, ce);
                        break;
                    }
                } else {
                    break;
                }
            }
            for (int i2 = 0; i2 < this.adapter.data.size(); i2++) {
                if (this.adapter.data.get(i2).type == 8) {
                    BoardComment comment = (BoardComment) this.adapter.data.get(i2).object;
                    if (comment.id == ce.id) {
                        RecyclerSectionAdapter.Data dataOld = this.adapter.data.get(i2);
                        RecyclerSectionAdapter.Data dataNew = RecyclerSectionAdapter.Data.none(dataOld.type, ce);
                        dataNew.decoratorType = dataOld.decoratorType;
                        this.adapter.replace(dataOld, dataNew);
                        return;
                    }
                }
            }
        } else if (reqCode > 10000) {
            this.commentBar.onActivityResult(reqCode, resCode, data);
        }
    }

    private void sendComment(final String txt, final List<Attachment> atts, final boolean clearCommentBar) {
        String text;
        Activity activity = getActivity();
        if (activity != null) {
            final boolean fromGroup = this.replyFromGroup;
            if (clearCommentBar && this.replyTo > 0 && txt != null && txt.startsWith(this.replyToName + ",")) {
                text = txt.replaceFirst(this.replyToName, createReplyLink(this.replyToUid, this.replyToName));
            } else {
                text = txt;
            }
            final String str = text;
            new MarketAddComment(getOwnerId(), getItemId(), text, atts, fromGroup, this.replyTo).setCallback(new SimpleCallback<Integer>(this) { // from class: com.vkontakte.android.fragments.market.GoodFragment.4
                {
                    GoodFragment.this = this;
                }

                @Override // com.vkontakte.android.api.Callback
                public void success(Integer cid) {
                    String textLocal = str;
                    if (clearCommentBar) {
                        if (GoodFragment.this.replyTo > 0 && txt != null && txt.startsWith(GoodFragment.this.replyToName + ",")) {
                            textLocal = txt.replaceFirst(GoodFragment.this.replyToName, GoodFragment.this.createReplyLink(GoodFragment.this.replyToUid, GoodFragment.this.replyToName));
                        }
                        GoodFragment.this.commentBar.setText("");
                        GoodFragment.this.commentBar.clearAttachments();
                        GoodFragment.this.replyFromGroup = false;
                        GoodFragment.this.replyTo = -1;
                    }
                    if (GoodFragment.this.preloader.isMoreAvailable()) {
                        Toast.makeText(GoodFragment.this.getActivity(), (int) R.string.board_comment_sent, 0).show();
                        GoodFragment.this.sendingComment = false;
                        return;
                    }
                    BoardComment newComment = BoardComment.createNewComment(GoodFragment.this.getOwnerId(), cid.intValue(), atts, textLocal, fromGroup);
                    GoodFragment.this.newsComments.add(newComment);
                    GoodFragment.this.adapter.clear(false);
                    GoodFragment.this.adapter.addAll(GoodFragment.this.goodData, false);
                    GoodFragment.this.adapter.addAll(GoodFragment.this.createCommentsDataList(GoodFragment.this.newsComments, GoodFragment.this.lastTotal + 1), false);
                    GoodFragment.this.adapter.notifyDataSetChanged();
                    if (GoodFragment.this.list != null) {
                        GoodFragment.this.list.scrollToPosition(GoodFragment.this.list.mo1204getAdapter().getItemCount());
                    }
                    GoodFragment.this.sendingComment = false;
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                    GoodFragment.this.sendingComment = false;
                }
            }).wrapProgress(getActivity()).exec((Context) activity);
        }
    }

    String createReplyLink(int id, String name) {
        return "[" + (id > 0 ? "id" + id : "club" + (-id)) + "|" + name + "]";
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

    private boolean canWrite() {
        return getArguments().getBoolean("can_write", false);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.good, menu);
        super.onCreateOptionsMenu(menu, inflater);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.copy_link /* 2131755023 */:
                ClipboardManager cm = (ClipboardManager) getActivity().getSystemService("clipboard");
                cm.setText("https://vk.com/market" + getOwnerId() + "?w=product" + getOwnerId() + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + getItemId());
                Toast.makeText(getActivity(), (int) R.string.link_copied, 0).show();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        DividerItemDecoration dividers = new DividerItemDecoration(new ColorDrawable(637534208), V.dp(0.5f));
        dividers.setProvider(GoodFragment$$Lambda$8.lambdaFactory$(this));
        this.list.addItemDecoration(dividers);
        DividerItemDecoration dividers2 = new DividerItemDecoration(getResources().getDrawable(R.drawable.divider_good), V.dp(0.5f));
        dividers2.setProvider(GoodFragment$$Lambda$9.lambdaFactory$(this));
        this.list.addItemDecoration(dividers2);
        this.list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.fragments.market.GoodFragment.5
            {
                GoodFragment.this = this;
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                GoodFragment.this.processScroll(recyclerView);
            }
        });
        this.list.setClipToPadding(false);
        this.list.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.market.GoodFragment.6
            {
                GoodFragment.this = this;
            }

            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                GoodFragment.this.list.getViewTreeObserver().removeOnPreDrawListener(this);
                GoodFragment.this.processScroll(GoodFragment.this.list);
                return false;
            }
        });
        this.list.setPadding(this.list.getPaddingLeft(), this.list.getPaddingTop(), this.list.getPaddingRight(), V.dp(40.0f));
        this.commentBar.addOnLayoutChangeListener(GoodFragment$$Lambda$10.lambdaFactory$(this));
        loadData();
    }

    public /* synthetic */ boolean lambda$onViewCreated$8(int position) {
        return position < this.adapter.getItemCount() + (-1) ? this.adapter.getItemViewType(position) == 8 && this.adapter.getItemViewType(position + 1) != 9 : this.adapter.getItemViewType(position) == 8;
    }

    public /* synthetic */ boolean lambda$onViewCreated$9(int position) {
        switch (this.adapter.getItemViewType(position)) {
            case 1:
            case 2:
            case 3:
                return true;
            default:
                return false;
        }
    }

    public /* synthetic */ void lambda$onViewCreated$10(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
        this.list.setPadding(this.list.getPaddingLeft(), this.list.getPaddingTop(), this.list.getPaddingRight(), (bottom - top) - V.dp(8.0f));
    }

    public void processScroll(RecyclerView recyclerView) {
        if (!this.isTablet) {
            int lastPos = ((LinearLayoutManager) recyclerView.getLayoutManager()).findLastVisibleItemPosition();
            View buttonView = recyclerView.getLayoutManager().findViewByPosition(this.indexWriteButton);
            if (buttonView == null) {
                if (this.indexWriteButton > lastPos) {
                    if (this.input.hasFocus()) {
                        this.messageButton.setVisibility(0);
                        this.messageButtonShadow.setVisibility(0);
                        this.messageButtonShadow.setVisibility(0);
                        ((ViewGroup.MarginLayoutParams) this.messageButton.getLayoutParams()).setMargins(0, 0, 0, this.commentBar.getHeight());
                        this.commentBar.setVisibility(0);
                        this.commentBarShadow.setVisibility(0);
                        this.commentBar.setTranslationY(0.0f);
                        this.commentBarShadow.setTranslationY(0.0f);
                        return;
                    }
                    this.messageButton.setVisibility(0);
                    this.messageButtonShadow.setVisibility(0);
                    ((ViewGroup.MarginLayoutParams) this.messageButton.getLayoutParams()).setMargins(0, 0, 0, 0);
                    this.commentBar.setVisibility(8);
                    this.commentBarShadow.setVisibility(8);
                    this.commentBar.setTranslationY(this.commentBar.getHeight());
                    this.commentBarShadow.setTranslationY(this.commentBar.getHeight());
                    return;
                } else if (this.indexWriteButton < lastPos) {
                    this.messageButton.setVisibility(8);
                    this.messageButtonShadow.setVisibility(8);
                    this.commentBar.setVisibility(0);
                    this.commentBarShadow.setVisibility(0);
                    this.commentBar.setTranslationY(0.0f);
                    this.commentBarShadow.setTranslationY(0.0f);
                    return;
                } else {
                    return;
                }
            }
            if (buttonView.getBottom() > recyclerView.getBottom() - this.commentBar.getHeight() && buttonView.getBottom() < recyclerView.getBottom() && !this.input.hasFocus()) {
                this.commentBar.setTranslationY(buttonView.getBottom() - (recyclerView.getBottom() - this.commentBar.getHeight()));
                this.commentBarShadow.setTranslationY(buttonView.getBottom() - (recyclerView.getBottom() - this.commentBar.getHeight()));
            } else {
                this.commentBar.setTranslationY(0.0f);
                this.commentBarShadow.setTranslationY(0.0f);
            }
            if (buttonView.getTop() < (this.list.getBottom() - this.messageButton.getMeasuredHeight()) - ((ViewGroup.MarginLayoutParams) this.messageButton.getLayoutParams()).bottomMargin) {
                this.messageButton.setVisibility(8);
                this.messageButtonShadow.setVisibility(8);
                this.commentBar.setVisibility(0);
                this.commentBarShadow.setVisibility(0);
            } else if (this.input.hasFocus()) {
                this.messageButton.setVisibility(0);
                this.messageButtonShadow.setVisibility(0);
                ((ViewGroup.MarginLayoutParams) this.messageButton.getLayoutParams()).setMargins(0, 0, 0, this.commentBar.getHeight());
                this.commentBar.setVisibility(0);
                this.commentBarShadow.setVisibility(0);
            } else {
                this.messageButton.setVisibility(0);
                this.messageButtonShadow.setVisibility(0);
                ((ViewGroup.MarginLayoutParams) this.messageButton.getLayoutParams()).setMargins(0, 0, 0, 0);
                this.commentBar.setVisibility(8);
                this.commentBarShadow.setVisibility(8);
            }
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(final int offset, int count) {
        int id = getArguments().getInt("id");
        int ownerId = getArguments().getInt("owner_id");
        final Good good = (Good) getArguments().getParcelable("good");
        String groupName = getArguments().getString("groupName");
        String groupPhoto = getArguments().getString("groupPhoto");
        int contactId = getArguments().getInt("contactId");
        String contactName = getArguments().getString("contactName");
        String contactPhoto = getArguments().getString("contactPhoto");
        Wiki wiki = (Wiki) getArguments().getParcelable("wiki");
        if (good != null) {
            this.goodData = createGoodDataList(good, groupName, groupPhoto, wiki == null ? null : wiki.viewUrl, wiki == null ? null : wiki.title, contactId, contactName, contactPhoto);
            this.adapter.setData(this.goodData);
            showContent();
        }
        this.currentRequest = new MarketGoodGetFullPage(ownerId, id, good == null && offset == 0, offset, count).setCallback(new SimpleCallback<MarketGoodGetFullPage.GoodFullPage>(this) { // from class: com.vkontakte.android.fragments.market.GoodFragment.7
            {
                GoodFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(MarketGoodGetFullPage.GoodFullPage result) {
                if (offset == 0) {
                    GoodFragment.this.newsComments.clear();
                }
                if (result.comments != null) {
                    GoodFragment.this.newsComments.addAll(result.comments);
                }
                if (result.good != null) {
                    GoodFragment.this.getArguments().putBoolean("can_write", result.good.can_comment);
                    ViewUtils.setEnabled(GoodFragment.this.commentBar, result.good.can_comment);
                    ViewUtils.setEnabled(GoodFragment.this.messageButton, result.good.availability == 0);
                }
                boolean goodDataEvaluable = good != null;
                if (!goodDataEvaluable && result.good != null) {
                    GoodFragment.this.goodData = GoodFragment.this.createGoodDataList(result.good, result.owner_name, result.owner_photo_100, result.wiki_view_url, result.wiki_title, result.contact_id, result.contact_name, result.contact_photo_100);
                }
                List<RecyclerSectionAdapter.Data> list = GoodFragment.this.createCommentsDataList(GoodFragment.this.newsComments, result.comments == null ? 0 : result.comments.total());
                int rangeSize = list.size();
                list.addAll(0, GoodFragment.this.goodData);
                GoodFragment.this.onDataLoaded(list, result.comments != null && GoodFragment.this.newsComments.size() < result.comments.total());
                if (goodDataEvaluable) {
                    GoodFragment.this.adapter.setData(list, GoodFragment.this.goodData.size(), rangeSize);
                } else {
                    GoodFragment.this.adapter.setData(list);
                }
                if (GoodFragment.this.dataLikes != null) {
                    ((Good) GoodFragment.this.dataLikes.object).likes = result.likes;
                    int index = GoodFragment.this.data.indexOf(GoodFragment.this.dataLikes);
                    if (index >= 0 && index < GoodFragment.this.adapter.getItemCount()) {
                        GoodFragment.this.adapter.notifyItemChanged(index);
                    }
                }
            }
        }).exec((Context) getActivity());
    }

    public List<RecyclerSectionAdapter.Data> createGoodDataList(@NonNull Good good, @Nullable String groupName, @Nullable String groupPhoto, @Nullable String wiki_url, @Nullable String wiki_title, int contactId, @Nullable String contactName, @Nullable String contactPhoto) {
        View.OnClickListener wikiClickListener = null;
        if (wiki_url != null && wiki_title != null) {
            wikiClickListener = GoodFragment$$Lambda$11.lambdaFactory$(wiki_url);
        }
        List<RecyclerSectionAdapter.Data> ret = new ArrayList<>();
        if (this.isTablet) {
            GoodTabletHeaderHolder.Data data = new GoodTabletHeaderHolder.Data(good, wiki_title, wikiClickListener, groupName, groupPhoto, this.onClickWriteButton);
            ret.add(RecyclerSectionAdapter.Data.top(10, data));
        } else {
            ret.add(RecyclerSectionAdapter.Data.middle(0, good.photos));
            ret.add(RecyclerSectionAdapter.Data.middle(1, good));
        }
        if (good.descriptionPreview != null) {
            RecyclerSectionAdapter.Data dataDescription = RecyclerSectionAdapter.Data.middle(2, good.descriptionPreview);
            if (good.descriptionPreview instanceof Spannable) {
                ExpandTextSpan[] spans = (ExpandTextSpan[]) ((Spannable) good.descriptionPreview).getSpans(0, good.descriptionPreview.length(), ExpandTextSpan.class);
                if (spans.length > 0) {
                    spans[0].setOnClickListener(GoodFragment$$Lambda$12.lambdaFactory$(this, dataDescription, good));
                }
            }
            ret.add(dataDescription);
        }
        if (!this.isTablet) {
            ret.add(RecyclerSectionAdapter.Data.middle(3, new Object[]{good, groupName, groupPhoto, Integer.valueOf(good.owner_id)}));
            if (wikiClickListener != null) {
                ret.add(RecyclerSectionAdapter.Data.middle(4, new ArrowItemHolder.Info(GoodFragment$$Lambda$13.lambdaFactory$(wiki_url), VKApplication.context.getString(R.string.good_ext_info_title), wiki_title)));
            }
        }
        this.indexWriteButton = ret.size();
        processScroll(this.list);
        this.lastContactId = contactId;
        this.lastContactName = contactName;
        this.lastContactPhoto = contactPhoto;
        this.lastGood = good;
        if (!this.isTablet) {
            ret.add(RecyclerSectionAdapter.Data.middle(5, this.onClickWriteButton));
        }
        RecyclerSectionAdapter.Data bottom = RecyclerSectionAdapter.Data.bottom(6, good);
        this.dataLikes = bottom;
        ret.add(bottom);
        return ret;
    }

    public /* synthetic */ void lambda$createGoodDataList$12(RecyclerSectionAdapter.Data dataDescription, @NonNull Good good, View v) {
        this.adapter.replace(dataDescription, RecyclerSectionAdapter.Data.middle(2, good.descriptionView));
    }

    public List<RecyclerSectionAdapter.Data> createCommentsDataList(ArrayList<BoardComment> newsComments, int total) {
        this.lastTotal = total;
        List<RecyclerSectionAdapter.Data> ret = new ArrayList<>();
        if (newsComments != null && !newsComments.isEmpty()) {
            ret.add(RecyclerSectionAdapter.Data.top(7, VKApplication.context.getResources().getQuantityString(R.plurals.good_comments, total, Integer.valueOf(total))));
            for (int i = 0; i < newsComments.size(); i++) {
                ret.add(RecyclerSectionAdapter.Data.middle(8, newsComments.get(i)));
            }
            ret.add(RecyclerSectionAdapter.Data.middle(9, Integer.valueOf((int) R.drawable.apps_top_padding_white_8)));
        }
        return ret;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        return this.adapter;
    }

    /* loaded from: classes2.dex */
    public class Adapter extends RecyclerSectionAdapter {
        public static final int TYPE_BG = 9;
        public static final int TYPE_BLOCK_GROUP = 3;
        public static final int TYPE_BLOCK_NAME = 1;
        public static final int TYPE_COMMENTS_TITLE = 7;
        public static final int TYPE_COMMENT_ITEM = 8;
        public static final int TYPE_DESCRIPTION = 2;
        public static final int TYPE_EXT_INFO = 4;
        public static final int TYPE_LIKES = 6;
        public static final int TYPE_SQUARE_GALLERY = 0;
        public static final int TYPE_TABLET_HEADER = 10;
        public static final int TYPE_WRITE_BUTTON = 5;

        private Adapter() {
            GoodFragment.this = r1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new SquareGalleryHolder(parent);
                case 1:
                    return new GoodNameHolder(parent);
                case 2:
                    return new DescriptionHolder(parent);
                case 3:
                    return new GoodGroupCategoryHolder(parent);
                case 4:
                    return new ArrowItemHolder(parent);
                case 5:
                    return new WriteButtonHolder(parent);
                case 6:
                    return new GoodLikesHolder(parent);
                case 7:
                    return TitleHolder.grayTitle(parent);
                case 8:
                    return new CommentViewHolder(parent, GoodFragment.this);
                case 9:
                    return new BackgroundHolder(parent);
                case 10:
                    return new GoodTabletHeaderHolder(parent);
                default:
                    return null;
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            switch (getItemViewType(position)) {
                case 6:
                    Good good = (Good) this.data.get(position).object;
                    if (good.likes != null && image >= 0 && image < good.likes.size()) {
                        return good.likes.get(image).getString("photo");
                    }
                    return null;
                case 7:
                default:
                    return super.getImageURL(position, image);
                case 8:
                    BoardComment comment = (BoardComment) this.data.get(position).object;
                    switch (image) {
                        case 0:
                            return comment.userPhoto;
                        default:
                            int imgindex = 0;
                            Iterator<Attachment> it = comment.attachments.iterator();
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

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            switch (getItemViewType(position)) {
                case 6:
                    Good good = (Good) this.data.get(position).object;
                    return good.likes == null ? 0 : good.likes.size();
                case 7:
                default:
                    return super.getImageCountForItem(position);
                case 8:
                    BoardComment comment = (BoardComment) this.data.get(position).object;
                    int count = 1;
                    Iterator<Attachment> it = comment.attachments.iterator();
                    while (it.hasNext()) {
                        Attachment att = it.next();
                        if (att instanceof ImageAttachment) {
                            count++;
                        }
                    }
                    return count;
            }
        }
    }
}
