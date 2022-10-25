package com.vkontakte.android.ui.widget;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.adapters.MessagesAdapter;
import com.vkontakte.android.ui.holder.messages.ChatMessageHolder;
import com.vkontakte.android.ui.holder.messages.MessageListItem;
/* loaded from: classes3.dex */
public class MessageTimeAnchorView extends FrameLayout {
    private Animator animatorTimeAnchorHide;
    private Animator animatorTimeAnchorShow;
    private int currentScrollState;
    private boolean isDrawHideTitleRect;
    private RecyclerView.ItemDecoration itemDecoration;
    private VKRecyclerView list;
    private Paint paint;
    private MessageFloatingDateView2 textView;
    private static int TIME_PADDING = Global.scale(4.0f);
    private static int TIME_DRAW_SIZE = Global.scale(7.0f);

    public MessageTimeAnchorView(Context context) {
        super(context);
        this.isDrawHideTitleRect = false;
        this.animatorTimeAnchorShow = null;
        this.animatorTimeAnchorHide = null;
        this.paint = new Paint();
        this.currentScrollState = 0;
        this.itemDecoration = new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.ui.widget.MessageTimeAnchorView.1
            @Override // android.support.v7.widget.RecyclerView.ItemDecoration
            public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
                super.onDrawOver(c, parent, state);
                if (MessageTimeAnchorView.this.isDrawHideTitleRect) {
                    MessageTimeAnchorView.this.paint.setColor(-1314571);
                    MessageTimeAnchorView.this.paint.setAlpha((int) (255.0f * MessageTimeAnchorView.this.getAlpha()));
                    c.drawRect(parent.getWidth() / 4, 0.0f, 3.0f * (parent.getWidth() / 4.0f), MessageTimeAnchorView.TIME_DRAW_SIZE, MessageTimeAnchorView.this.paint);
                }
            }
        };
    }

    public MessageTimeAnchorView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.isDrawHideTitleRect = false;
        this.animatorTimeAnchorShow = null;
        this.animatorTimeAnchorHide = null;
        this.paint = new Paint();
        this.currentScrollState = 0;
        this.itemDecoration = new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.ui.widget.MessageTimeAnchorView.1
            @Override // android.support.v7.widget.RecyclerView.ItemDecoration
            public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
                super.onDrawOver(c, parent, state);
                if (MessageTimeAnchorView.this.isDrawHideTitleRect) {
                    MessageTimeAnchorView.this.paint.setColor(-1314571);
                    MessageTimeAnchorView.this.paint.setAlpha((int) (255.0f * MessageTimeAnchorView.this.getAlpha()));
                    c.drawRect(parent.getWidth() / 4, 0.0f, 3.0f * (parent.getWidth() / 4.0f), MessageTimeAnchorView.TIME_DRAW_SIZE, MessageTimeAnchorView.this.paint);
                }
            }
        };
    }

    public MessageTimeAnchorView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.isDrawHideTitleRect = false;
        this.animatorTimeAnchorShow = null;
        this.animatorTimeAnchorHide = null;
        this.paint = new Paint();
        this.currentScrollState = 0;
        this.itemDecoration = new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.ui.widget.MessageTimeAnchorView.1
            @Override // android.support.v7.widget.RecyclerView.ItemDecoration
            public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
                super.onDrawOver(c, parent, state);
                if (MessageTimeAnchorView.this.isDrawHideTitleRect) {
                    MessageTimeAnchorView.this.paint.setColor(-1314571);
                    MessageTimeAnchorView.this.paint.setAlpha((int) (255.0f * MessageTimeAnchorView.this.getAlpha()));
                    c.drawRect(parent.getWidth() / 4, 0.0f, 3.0f * (parent.getWidth() / 4.0f), MessageTimeAnchorView.TIME_DRAW_SIZE, MessageTimeAnchorView.this.paint);
                }
            }
        };
    }

    @TargetApi(21)
    public MessageTimeAnchorView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.isDrawHideTitleRect = false;
        this.animatorTimeAnchorShow = null;
        this.animatorTimeAnchorHide = null;
        this.paint = new Paint();
        this.currentScrollState = 0;
        this.itemDecoration = new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.ui.widget.MessageTimeAnchorView.1
            @Override // android.support.v7.widget.RecyclerView.ItemDecoration
            public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
                super.onDrawOver(c, parent, state);
                if (MessageTimeAnchorView.this.isDrawHideTitleRect) {
                    MessageTimeAnchorView.this.paint.setColor(-1314571);
                    MessageTimeAnchorView.this.paint.setAlpha((int) (255.0f * MessageTimeAnchorView.this.getAlpha()));
                    c.drawRect(parent.getWidth() / 4, 0.0f, 3.0f * (parent.getWidth() / 4.0f), MessageTimeAnchorView.TIME_DRAW_SIZE, MessageTimeAnchorView.this.paint);
                }
            }
        };
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        this.textView = (MessageFloatingDateView2) findViewById(R.id.msg_text);
    }

    @Override // android.view.View
    public void setAlpha(float alpha) {
        super.setAlpha(alpha);
        ViewUtils.invalidate(this.list);
    }

    public void setList(VKRecyclerView list) {
        this.list = list;
        list.addItemDecoration(this.itemDecoration);
    }

    public void setText(CharSequence text) {
        boolean b = TextUtils.isEmpty(this.textView.getText());
        this.textView.setText(text);
        forceLayout();
        requestLayout();
        if (b) {
            switch (this.currentScrollState) {
                case 0:
                    hide();
                    return;
                case 1:
                    show();
                    return;
                case 2:
                default:
                    return;
            }
        }
    }

    public FrameLayout.LayoutParams createNeededLayoutParams() {
        return new FrameLayout.LayoutParams(-2, -2, 49);
    }

    public static void onScrollStateChanged(@Nullable MessageTimeAnchorView p, int newState) {
        if (p != null) {
            p.currentScrollState = newState;
            if (!TextUtils.isEmpty(p.textView.getText())) {
                switch (newState) {
                    case 0:
                        p.hide();
                        return;
                    case 1:
                        p.show();
                        return;
                    case 2:
                    default:
                        return;
                }
            }
        }
    }

    private void show() {
        if (this.animatorTimeAnchorShow != null) {
            this.animatorTimeAnchorShow.cancel();
        }
        if (this.animatorTimeAnchorHide != null) {
            this.animatorTimeAnchorHide.cancel();
        }
        if (getAlpha() != 1.0f) {
            this.animatorTimeAnchorShow = ObjectAnimator.ofFloat(this, "alpha", getAlpha(), 1.0f);
            this.animatorTimeAnchorShow.setDuration((int) ((1.0f - getAlpha()) * 200.0f)).start();
        }
    }

    private void hide() {
        long j = 400;
        if (this.animatorTimeAnchorHide != null) {
            this.animatorTimeAnchorHide.cancel();
        }
        if (getAlpha() != 0.0f) {
            this.animatorTimeAnchorHide = ObjectAnimator.ofFloat(this, "alpha", 1.0f, 0.0f);
            Animator duration = this.animatorTimeAnchorHide.setDuration(400L);
            if (getAlpha() != 1.0f) {
                j = (((int) (1.0f - getAlpha())) * 200) + SearchViewWrapper.CONFIRM_TIMEOUT;
            }
            duration.setStartDelay(j);
            this.animatorTimeAnchorHide.start();
        }
    }

    public static int checkTimeAnchor(@Nullable MessageTimeAnchorView p, @NonNull MessagesAdapter adapter, int lastTime) {
        MessageListItem item;
        if (p != null && p.list != null) {
            View firstView = p.list.getChildAt(0);
            boolean useTimeFromFirstView = firstView == null || firstView.getBottom() > TIME_PADDING;
            int index = p.list.delegate.getFirstVisiblePosition() + (useTimeFromFirstView ? 0 : 1);
            MessageListItem itemFirst = adapter.getMessageItemByPosition(index);
            if (itemFirst != null && itemFirst.groupMessagesTime == 0 && (item = adapter.getMessageItemByPosition(index - 1)) != null) {
                itemFirst.groupMessagesTime = item.groupMessagesTime;
            }
            if (itemFirst != null && itemFirst.groupMessagesTime != lastTime && itemFirst.groupMessagesTime != 0) {
                lastTime = itemFirst.groupMessagesTime;
                p.setText(TimeUtils.langDate(lastTime));
            }
            View timeView = null;
            int i = 0;
            while (true) {
                if (i >= p.list.getChildCount()) {
                    break;
                }
                View view = p.list.getChildAt(i);
                if (view.getTop() < p.getBottom()) {
                    if (!(view.getTag() instanceof ChatMessageHolder) || !((ChatMessageHolder) view.getTag()).getLastItem().isTime()) {
                        i++;
                    } else {
                        timeView = view;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (timeView != null && timeView.getTop() > TIME_PADDING) {
                p.setTranslationY((-p.getHeight()) + timeView.getTop());
            } else {
                if (timeView != null && timeView.getBottom() - TIME_PADDING > 0 && timeView.getTop() < 0) {
                    if (!p.isDrawHideTitleRect) {
                        p.isDrawHideTitleRect = true;
                        ViewUtils.invalidate(p.list);
                    }
                } else if (p.isDrawHideTitleRect) {
                    p.isDrawHideTitleRect = false;
                    ViewUtils.invalidate(p.list);
                }
                p.setTranslationY(0.0f);
            }
        }
        return lastTime;
    }
}
