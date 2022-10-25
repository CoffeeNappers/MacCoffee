package com.vk.emoji;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.Spannable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.squareup.picasso.LruCache;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.Target;
import com.vk.media.camera.CameraUtilsEffects;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.subjects.PublishSubject;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import okhttp3.Cache;
import okhttp3.Call;
/* loaded from: classes.dex */
public final class Emoji {
    private static final String BASE_URL = "https://vk.com/images/all_emoji/images_";
    private static final float EMOJI_HORIZONTAL_PADDING_DP = 1.5f;
    private static final float EMOJI_TEXT_SIZE_DP = 20.0f;
    private static final float EMOJI_VERTICAL_PADDING_DP = 0.5f;
    private static final long MIN_INVALIDATE_INTERVAL_MS = 50;
    private static Emoji instance;
    private final Context applicationContext;
    private final Cache cache;
    private final int emojiHorizontalPadding;
    private LruCache emojiMemoryCache;
    private Picasso emojiPicasso;
    private final int emojiSizeInSprite;
    private final int emojiVerticalPadding;
    private final int keyboardEmojiSize;
    private final Paint placeholderPaint;
    private final int textEmojiSize;
    private static Paint PAINT = new Paint(2);
    private static Rect SRC_RECT = new Rect();
    private static final Executor spritesLoadingExecutor = Executors.newSingleThreadExecutor();
    private static final ExecutorService networkLoadingExecutor = Executors.newSingleThreadExecutor();
    private final int MSG_LOAD_EMOJI = 0;
    private final Handler uiHandler = new Handler(Looper.getMainLooper()) { // from class: com.vk.emoji.Emoji.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what == 0 && msg.obj != null && Emoji.this.emojiPicasso != null) {
                NetworkEmojiDrawable networkEmojiDrawable = (NetworkEmojiDrawable) msg.obj;
                Emoji.this.emojiPicasso.load(networkEmojiDrawable.getUrl()).into(networkEmojiDrawable);
            }
        }
    };
    private final Integer EMOJI_LOADED_FLAG = 1;
    private final PublishSubject<Integer> emojiLoadedSubject = PublishSubject.create();
    private final AtomicBoolean[] spritesLoading = new AtomicBoolean[5];
    private final Bitmap[] sprites = new Bitmap[5];

    public static Emoji instance(Context context) {
        if (instance == null) {
            synchronized (Emoji.class) {
                if (instance == null) {
                    instance = new Emoji(context);
                }
            }
        }
        return instance;
    }

    public static void invalidateAll(Activity activity) {
        if (activity != null) {
            invalidateAll(activity.findViewById(16908290));
        }
    }

    public static void invalidateAll(View view) {
        if (view != null) {
            if (view instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) view;
                for (int i = 0; i < g.getChildCount(); i++) {
                    invalidateAll(g.getChildAt(i));
                }
            } else if (view instanceof EmojiView) {
                ((EmojiView) view).invalidateEmoji();
            } else if (view instanceof TextView) {
                TextViewInvalidator.invalidate((TextView) view);
            }
        }
    }

    private Emoji(Context context) {
        this.applicationContext = context.getApplicationContext();
        for (int i = 0; i < this.spritesLoading.length; i++) {
            this.spritesLoading[i] = new AtomicBoolean();
        }
        this.placeholderPaint = new Paint();
        this.placeholderPaint.setColor(0);
        this.emojiSizeInSprite = this.applicationContext.getResources().getInteger(R.integer.emoji_size_in_sprite);
        this.keyboardEmojiSize = (int) this.applicationContext.getResources().getDimension(R.dimen.emoji_keyboard_item_draw);
        this.textEmojiSize = (int) Utils.convertDpToPixel(EMOJI_TEXT_SIZE_DP, this.applicationContext);
        this.emojiHorizontalPadding = (int) Utils.convertDpToPixel(EMOJI_HORIZONTAL_PADDING_DP, this.applicationContext);
        this.emojiVerticalPadding = (int) Utils.convertDpToPixel(0.5f, this.applicationContext);
        this.cache = OkHttp3Downloader.createDefaultCache(this.applicationContext);
    }

    public Emoji init(Call.Factory client) {
        this.emojiMemoryCache = new LruCache(this.emojiSizeInSprite * this.emojiSizeInSprite * 100 * 4);
        Picasso.Builder builder = new Picasso.Builder(this.applicationContext);
        builder.memoryCache(this.emojiMemoryCache);
        builder.downloader(new OkHttp3Downloader(client, this.cache));
        builder.executor(networkLoadingExecutor);
        this.emojiPicasso = builder.build();
        loadAll();
        return this;
    }

    public Cache getCache() {
        return this.cache;
    }

    public void ensureEmojiFit(Paint.FontMetricsInt fontMetrics) {
        BetterImageSpan.updateFontMetrics(fontMetrics, BetterImageSpan.normalizeAlignment(2), this.textEmojiSize + (this.emojiVerticalPadding * 2));
    }

    public Observable<Integer> emojiLoadObservable() {
        return this.emojiLoadedSubject.debounce(MIN_INVALIDATE_INTERVAL_MS, TimeUnit.MILLISECONDS).observeOn(AndroidSchedulers.mainThread());
    }

    public Drawable getEmojiDrawable(String code) {
        EmojiTreeEntry key = EmojiParser.instance().findEmojiAtPosition(code);
        if (key != null) {
            if (key.spriteIndex >= 0) {
                return new SpriteEmojiDrawable(key.spriteIndex, key.x, key.y, this.keyboardEmojiSize, 0, 0);
            }
            return new NetworkEmojiDrawable(getEmojiUrl(key.key), this.keyboardEmojiSize, 0, 0);
        }
        return null;
    }

    public boolean containsEmoji(CharSequence text) {
        return EmojiParser.instance().containsEmoji(text);
    }

    public boolean isEmoji(CharSequence text) {
        return EmojiParser.instance().isEmoji(text);
    }

    public CharSequence replaceEmoji(CharSequence input) {
        return replaceEmoji(input, 0, input.length());
    }

    public CharSequence replaceEmoji(CharSequence input, int start, int length) {
        Spannable spannable;
        if (input == null) {
            return null;
        }
        if (input instanceof Spannable) {
            spannable = (Spannable) input;
        } else {
            spannable = Spannable.Factory.getInstance().newSpannable(input);
        }
        SpanRangeList existingSpanRanges = new SpanRangeList(spannable);
        int index = start;
        while (index < length) {
            int existingSpanEnd = existingSpanRanges.spanEnd(index);
            if (existingSpanEnd == -1) {
                int nextSpanStart = existingSpanRanges.nextSpanStart(index);
                int searchRange = nextSpanStart == -1 ? length : nextSpanStart;
                EmojiTreeEntry key = EmojiParser.instance().findEmojiAtPosition(spannable, index, searchRange);
                if (key != null) {
                    if (key.spriteIndex >= 0) {
                        spannable.setSpan(new EmojiSpan(new SpriteEmojiDrawable(this, key.spriteIndex, key.x, key.y)), index, key.length() + index, 33);
                    } else {
                        spannable.setSpan(new EmojiSpan(new NetworkEmojiDrawable(this, getEmojiUrl(key.key))), index, key.length() + index, 33);
                    }
                    index += key.length();
                } else {
                    index++;
                }
            } else {
                index = existingSpanEnd;
            }
        }
        return spannable;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getPicassoMemoryCache(String url) {
        return url + "\n";
    }

    private String getEmojiUrl(String emojiUnicode) {
        return BASE_URL + this.emojiSizeInSprite + CameraUtilsEffects.FILE_DELIM + Utils.unicode(emojiUnicode) + ".png";
    }

    private void loadAll() {
        spritesLoadingExecutor.execute(new Runnable() { // from class: com.vk.emoji.Emoji.2
            @Override // java.lang.Runnable
            public void run() {
                EmojiParser.instance();
            }
        });
        for (int i = 0; i < 5; i++) {
            loadSprite(i);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadSprite(final int spriteIndex) {
        if (!this.spritesLoading[spriteIndex].get()) {
            this.spritesLoading[spriteIndex].set(true);
            spritesLoadingExecutor.execute(new Runnable() { // from class: com.vk.emoji.Emoji.3
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        Emoji.this.sprites[spriteIndex] = Utils.getBitmapFromAsset(Emoji.this.applicationContext.getAssets(), "emoji/emoji_sprite_" + spriteIndex + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + Emoji.this.emojiSizeInSprite + ".png");
                    } catch (Throwable th) {
                    }
                    Emoji.this.dispatchEmojiLoaded();
                    Emoji.this.spritesLoading[spriteIndex].set(false);
                }
            });
        }
    }

    public void dispatchEmojiLoaded() {
        this.emojiLoadedSubject.onNext(this.EMOJI_LOADED_FLAG);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class SpriteEmojiDrawable extends EmojiDrawable {
        private final int spriteIndex;
        private final int x;
        private final int y;

        public SpriteEmojiDrawable(Emoji emoji, int spriteIndex, int x, int y) {
            this(spriteIndex, x, y, emoji.textEmojiSize, emoji.emojiHorizontalPadding, emoji.emojiVerticalPadding);
        }

        public SpriteEmojiDrawable(int spriteIndex, int x, int y, int size, int paddingHorizontal, int paddingVertical) {
            super(size, paddingHorizontal, paddingVertical);
            this.spriteIndex = spriteIndex;
            this.x = Emoji.this.emojiSizeInSprite * x;
            this.y = Emoji.this.emojiSizeInSprite * y;
        }

        @Override // com.vk.emoji.EmojiDrawable
        protected void drawInBounds(Canvas canvas, Rect drawingBounds) {
            if (Emoji.this.sprites[this.spriteIndex] == null) {
                Emoji.this.loadSprite(this.spriteIndex);
                canvas.drawRect(drawingBounds, Emoji.this.placeholderPaint);
                return;
            }
            Emoji.SRC_RECT.left = this.x;
            Emoji.SRC_RECT.top = this.y;
            Emoji.SRC_RECT.right = this.x + Emoji.this.emojiSizeInSprite;
            Emoji.SRC_RECT.bottom = this.y + Emoji.this.emojiSizeInSprite;
            canvas.drawBitmap(Emoji.this.sprites[this.spriteIndex], Emoji.SRC_RECT, drawingBounds, Emoji.PAINT);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class NetworkEmojiDrawable extends EmojiDrawable implements Target {
        private Bitmap emojiBitmap;
        private final String url;

        public NetworkEmojiDrawable(Emoji emoji, String url) {
            this(url, emoji.textEmojiSize, emoji.emojiHorizontalPadding, emoji.emojiVerticalPadding);
        }

        public NetworkEmojiDrawable(String url, int size, int paddingHorizontal, int paddingVertical) {
            super(size, paddingHorizontal, paddingVertical);
            this.url = url;
            if (Emoji.this.emojiMemoryCache != null) {
                this.emojiBitmap = Emoji.this.emojiMemoryCache.get(Emoji.this.getPicassoMemoryCache(url));
                if (this.emojiBitmap == null) {
                    Emoji.this.uiHandler.sendMessage(Message.obtain(Emoji.this.uiHandler, 0, this));
                }
            }
        }

        public String getUrl() {
            return this.url;
        }

        @Override // com.vk.emoji.EmojiDrawable
        protected void drawInBounds(Canvas canvas, Rect drawingBounds) {
            if (this.emojiBitmap == null) {
                canvas.drawRect(drawingBounds, Emoji.this.placeholderPaint);
            } else {
                canvas.drawBitmap(this.emojiBitmap, (Rect) null, drawingBounds, Emoji.PAINT);
            }
        }

        @Override // com.squareup.picasso.Target
        public void onBitmapLoaded(Bitmap bitmap, Picasso.LoadedFrom from) {
            this.emojiBitmap = bitmap;
            Emoji.this.dispatchEmojiLoaded();
        }

        @Override // com.squareup.picasso.Target
        public void onBitmapFailed(Drawable errorDrawable) {
        }

        @Override // com.squareup.picasso.Target
        public void onPrepareLoad(Drawable placeHolderDrawable) {
        }
    }
}
