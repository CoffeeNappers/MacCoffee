package com.vkontakte.android.ui;

import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Canvas;
import android.graphics.CornerPathEffect;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.text.ClipboardManager;
import android.text.Layout;
import android.text.Spanned;
import android.text.TextUtils;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.vk.imageloader.view.VKStickerImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkSpan;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import java.util.ArrayList;
/* loaded from: classes3.dex */
public class ClickableLinksDelegate implements GestureDetector.OnGestureListener {
    @Nullable
    private GestureDetector gestureDetector;
    private Path hlPath;
    private LinkSpan selectedSpan;
    private android.widget.TextView view;
    private boolean canShowMessageOptions = false;
    private Paint hlPaint = new Paint();

    public ClickableLinksDelegate(android.widget.TextView view) {
        this.view = view;
        if (!this.canShowMessageOptions) {
            this.gestureDetector = new GestureDetector(view.getContext(), this);
        }
        this.hlPaint.setAntiAlias(true);
        this.hlPaint.setPathEffect(new CornerPathEffect(Global.scale(3.0f)));
        view.setHighlightColor(view.getResources().getColor(17170450));
    }

    public boolean onTouch(MotionEvent event) {
        if (this.gestureDetector != null) {
            this.gestureDetector.onTouchEvent(event);
        }
        if (event.getAction() == 0) {
            int line = -1;
            Rect rect = new Rect();
            Layout l = this.view.getLayout();
            if (l == null) {
                return false;
            }
            int i = 0;
            while (true) {
                if (i >= l.getLineCount()) {
                    break;
                }
                this.view.getLineBounds(i, rect);
                if (!rect.contains((int) event.getX(), (int) event.getY())) {
                    i++;
                } else {
                    line = i;
                    break;
                }
            }
            if (line == -1) {
                return false;
            }
            CharSequence text = this.view.getText();
            if (text instanceof Spanned) {
                Spanned s = (Spanned) text;
                LinkSpan[] spans = (LinkSpan[]) s.getSpans(0, s.length() - 1, LinkSpan.class);
                if (spans.length > 0) {
                    for (LinkSpan span : spans) {
                        int start = s.getSpanStart(span);
                        int end = s.getSpanEnd(span);
                        int lstart = l.getLineForOffset(start);
                        int lend = l.getLineForOffset(end);
                        if (line >= lstart && line <= lend && ((line != lstart || event.getX() - this.view.getPaddingLeft() >= l.getPrimaryHorizontal(start)) && (line != lend || event.getX() - this.view.getPaddingLeft() <= l.getPrimaryHorizontal(end)))) {
                            this.hlPath = new Path();
                            this.selectedSpan = span;
                            this.hlPaint.setColor((span.getColor() & ViewCompat.MEASURED_SIZE_MASK) | VKStickerImageView.OVERLAY_COLOR);
                            for (int j = lstart; j <= lend; j++) {
                                Rect bounds = new Rect();
                                l.getLineBounds(j, bounds);
                                if (j == lstart) {
                                    bounds.left = Math.round(l.getPrimaryHorizontal(start));
                                }
                                if (j == lend) {
                                    bounds.right = Math.round(l.getPrimaryHorizontal(end));
                                } else {
                                    CharSequence lineChars = this.view.getText().subSequence(l.getLineStart(j), l.getLineEnd(j));
                                    bounds.right = Math.round(this.view.getPaint().measureText(lineChars.toString()));
                                }
                                bounds.inset(Global.scale(-2.0f), Global.scale(-2.0f));
                                this.hlPath.addRect(new RectF(bounds), Path.Direction.CW);
                            }
                            this.hlPath.offset(this.view.getPaddingLeft(), 0.0f);
                            this.view.invalidate();
                            return true;
                        }
                    }
                }
            }
        }
        if (event.getAction() == 1 && this.selectedSpan != null) {
            this.view.playSoundEffect(0);
            this.selectedSpan.onClick(this.view.getContext());
            this.hlPath = null;
            this.selectedSpan = null;
            this.view.invalidate();
            return false;
        } else if (event.getAction() == 3) {
            this.hlPath = null;
            this.selectedSpan = null;
            this.view.invalidate();
            return false;
        } else {
            return false;
        }
    }

    public void onDraw(Canvas canvas) {
        if (this.hlPath != null) {
            canvas.save();
            canvas.translate(0.0f, this.view.getPaddingTop());
            canvas.drawPath(this.hlPath, this.hlPaint);
            canvas.restore();
        }
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onDown(MotionEvent e) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onShowPress(MotionEvent e) {
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onSingleTapUp(MotionEvent e) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
        return false;
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public void onLongPress(MotionEvent e) {
        showMessageOptions(this.view.getContext(), this.selectedSpan);
        this.hlPath = null;
        this.selectedSpan = null;
        this.view.invalidate();
    }

    @Override // android.view.GestureDetector.OnGestureListener
    public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
        return false;
    }

    public void setCanShowMessageOptions(boolean canShowMessageOptions) {
        this.canShowMessageOptions = canShowMessageOptions;
        if (this.gestureDetector == null) {
            this.gestureDetector = new GestureDetector(this.view.getContext(), this);
        }
    }

    private void showMessageOptions(Context ctx, LinkSpan selectedSpan) {
        String link = selectedSpan == null ? null : selectedSpan.getLink();
        if (this.canShowMessageOptions && !TextUtils.isEmpty(link) && link.startsWith(UriUtil.HTTP_SCHEME)) {
            ArrayList<String> items = new ArrayList<>();
            ArrayList<String> actions = new ArrayList<>();
            items.add(ctx.getString(R.string.open));
            actions.add("open");
            items.add(ctx.getString(R.string.copy));
            actions.add("copy");
            new VKAlertDialog.Builder(ctx).setTitle(selectedSpan.getLink()).setItems((CharSequence[]) items.toArray(new String[0]), ClickableLinksDelegate$$Lambda$1.lambdaFactory$(actions, selectedSpan, ctx)).show();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static /* synthetic */ void lambda$showMessageOptions$0(ArrayList actions, LinkSpan selectedSpan, Context ctx, DialogInterface dialog, int which) {
        boolean z;
        String str = (String) actions.get(which);
        switch (str.hashCode()) {
            case 3059573:
                if (str.equals("copy")) {
                    z = true;
                    break;
                }
                z = true;
                break;
            case 3417674:
                if (str.equals("open")) {
                    z = false;
                    break;
                }
                z = true;
                break;
            default:
                z = true;
                break;
        }
        switch (z) {
            case false:
                selectedSpan.onClick(ctx);
                return;
            case true:
                ClipboardManager cm = (ClipboardManager) ctx.getSystemService("clipboard");
                cm.setText(selectedSpan.getLink());
                Toast.makeText(ctx, (int) R.string.text_copied, 0).show();
                return;
            default:
                return;
        }
    }
}
