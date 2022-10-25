.class public final Lcom/vk/emoji/Emoji;
.super Ljava/lang/Object;
.source "Emoji.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;,
        Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;
    }
.end annotation


# static fields
.field private static final BASE_URL:Ljava/lang/String; = "https://vk.com/images/all_emoji/images_"

.field private static final EMOJI_HORIZONTAL_PADDING_DP:F = 1.5f

.field private static final EMOJI_TEXT_SIZE_DP:F = 20.0f

.field private static final EMOJI_VERTICAL_PADDING_DP:F = 0.5f

.field private static final MIN_INVALIDATE_INTERVAL_MS:J = 0x32L

.field private static PAINT:Landroid/graphics/Paint;

.field private static SRC_RECT:Landroid/graphics/Rect;

.field private static instance:Lcom/vk/emoji/Emoji;

.field private static final networkLoadingExecutor:Ljava/util/concurrent/ExecutorService;

.field private static final spritesLoadingExecutor:Ljava/util/concurrent/Executor;


# instance fields
.field private final EMOJI_LOADED_FLAG:Ljava/lang/Integer;

.field private final MSG_LOAD_EMOJI:I

.field private final applicationContext:Landroid/content/Context;

.field private final cache:Lokhttp3/Cache;

.field private final emojiHorizontalPadding:I

.field private final emojiLoadedSubject:Lio/reactivex/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/PublishSubject",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private emojiMemoryCache:Lcom/squareup/picasso/LruCache;

.field private emojiPicasso:Lcom/squareup/picasso/Picasso;

.field private final emojiSizeInSprite:I

.field private final emojiVerticalPadding:I

.field private final keyboardEmojiSize:I

.field private final placeholderPaint:Landroid/graphics/Paint;

.field private final sprites:[Landroid/graphics/Bitmap;

.field private final spritesLoading:[Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final textEmojiSize:I

.field private final uiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 72
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vk/emoji/Emoji;->PAINT:Landroid/graphics/Paint;

    .line 75
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/vk/emoji/Emoji;->SRC_RECT:Landroid/graphics/Rect;

    .line 77
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/emoji/Emoji;->spritesLoadingExecutor:Ljava/util/concurrent/Executor;

    .line 78
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/emoji/Emoji;->networkLoadingExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x5

    const/4 v3, 0x0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput v3, p0, Lcom/vk/emoji/Emoji;->MSG_LOAD_EMOJI:I

    .line 81
    new-instance v1, Lcom/vk/emoji/Emoji$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vk/emoji/Emoji$1;-><init>(Lcom/vk/emoji/Emoji;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->uiHandler:Landroid/os/Handler;

    .line 90
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->EMOJI_LOADED_FLAG:Ljava/lang/Integer;

    .line 91
    invoke-static {}, Lio/reactivex/subjects/PublishSubject;->create()Lio/reactivex/subjects/PublishSubject;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->emojiLoadedSubject:Lio/reactivex/subjects/PublishSubject;

    .line 98
    new-array v1, v4, [Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->spritesLoading:[Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 99
    new-array v1, v4, [Landroid/graphics/Bitmap;

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->sprites:[Landroid/graphics/Bitmap;

    .line 108
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->applicationContext:Landroid/content/Context;

    .line 111
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vk/emoji/Emoji;->spritesLoading:[Ljava/util/concurrent/atomic/AtomicBoolean;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 112
    iget-object v1, p0, Lcom/vk/emoji/Emoji;->spritesLoading:[Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    aput-object v2, v1, v0

    .line 111
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 116
    :cond_0
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->placeholderPaint:Landroid/graphics/Paint;

    .line 117
    iget-object v1, p0, Lcom/vk/emoji/Emoji;->placeholderPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 120
    iget-object v1, p0, Lcom/vk/emoji/Emoji;->applicationContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/vk/emoji/R$integer;->emoji_size_in_sprite:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/vk/emoji/Emoji;->emojiSizeInSprite:I

    .line 121
    iget-object v1, p0, Lcom/vk/emoji/Emoji;->applicationContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/vk/emoji/R$dimen;->emoji_keyboard_item_draw:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/vk/emoji/Emoji;->keyboardEmojiSize:I

    .line 122
    const/high16 v1, 0x41a00000    # 20.0f

    iget-object v2, p0, Lcom/vk/emoji/Emoji;->applicationContext:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/vk/emoji/Emoji;->textEmojiSize:I

    .line 123
    const/high16 v1, 0x3fc00000    # 1.5f

    iget-object v2, p0, Lcom/vk/emoji/Emoji;->applicationContext:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/vk/emoji/Emoji;->emojiHorizontalPadding:I

    .line 124
    const/high16 v1, 0x3f000000    # 0.5f

    iget-object v2, p0, Lcom/vk/emoji/Emoji;->applicationContext:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/vk/emoji/Utils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/vk/emoji/Emoji;->emojiVerticalPadding:I

    .line 125
    iget-object v1, p0, Lcom/vk/emoji/Emoji;->applicationContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/vk/emoji/OkHttp3Downloader;->createDefaultCache(Landroid/content/Context;)Lokhttp3/Cache;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->cache:Lokhttp3/Cache;

    .line 126
    return-void
.end method

.method static synthetic access$000(Lcom/vk/emoji/Emoji;)Lcom/squareup/picasso/Picasso;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->emojiPicasso:Lcom/squareup/picasso/Picasso;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/emoji/Emoji;)[Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->sprites:[Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$1000()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/vk/emoji/Emoji;->SRC_RECT:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$1100()Landroid/graphics/Paint;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/vk/emoji/Emoji;->PAINT:Landroid/graphics/Paint;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vk/emoji/Emoji;)Lcom/squareup/picasso/LruCache;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->emojiMemoryCache:Lcom/squareup/picasso/LruCache;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vk/emoji/Emoji;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/vk/emoji/Emoji;->getPicassoMemoryCache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vk/emoji/Emoji;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->uiHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/emoji/Emoji;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/emoji/Emoji;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget v0, p0, Lcom/vk/emoji/Emoji;->emojiSizeInSprite:I

    return v0
.end method

.method static synthetic access$400(Lcom/vk/emoji/Emoji;)[Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->spritesLoading:[Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/emoji/Emoji;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget v0, p0, Lcom/vk/emoji/Emoji;->textEmojiSize:I

    return v0
.end method

.method static synthetic access$600(Lcom/vk/emoji/Emoji;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget v0, p0, Lcom/vk/emoji/Emoji;->emojiHorizontalPadding:I

    return v0
.end method

.method static synthetic access$700(Lcom/vk/emoji/Emoji;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget v0, p0, Lcom/vk/emoji/Emoji;->emojiVerticalPadding:I

    return v0
.end method

.method static synthetic access$800(Lcom/vk/emoji/Emoji;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;
    .param p1, "x1"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/vk/emoji/Emoji;->loadSprite(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/vk/emoji/Emoji;)Landroid/graphics/Paint;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->placeholderPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method private getEmojiUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "emojiUnicode"    # Ljava/lang/String;

    .prologue
    .line 228
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "https://vk.com/images/all_emoji/images_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/emoji/Emoji;->emojiSizeInSprite:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/vk/emoji/Utils;->unicode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPicassoMemoryCache(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static instance(Landroid/content/Context;)Lcom/vk/emoji/Emoji;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    sget-object v0, Lcom/vk/emoji/Emoji;->instance:Lcom/vk/emoji/Emoji;

    if-nez v0, :cond_1

    .line 37
    const-class v1, Lcom/vk/emoji/Emoji;

    monitor-enter v1

    .line 38
    :try_start_0
    sget-object v0, Lcom/vk/emoji/Emoji;->instance:Lcom/vk/emoji/Emoji;

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Lcom/vk/emoji/Emoji;

    invoke-direct {v0, p0}, Lcom/vk/emoji/Emoji;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/vk/emoji/Emoji;->instance:Lcom/vk/emoji/Emoji;

    .line 41
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    :cond_1
    sget-object v0, Lcom/vk/emoji/Emoji;->instance:Lcom/vk/emoji/Emoji;

    return-object v0

    .line 41
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static invalidateAll(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 47
    if-nez p0, :cond_0

    .line 51
    :goto_0
    return-void

    .line 50
    :cond_0
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/emoji/Emoji;->invalidateAll(Landroid/view/View;)V

    goto :goto_0
.end method

.method public static invalidateAll(Landroid/view/View;)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 54
    if-nez p0, :cond_1

    .line 67
    .end local p0    # "view":Landroid/view/View;
    :cond_0
    :goto_0
    return-void

    .line 57
    .restart local p0    # "view":Landroid/view/View;
    :cond_1
    instance-of v2, p0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_2

    move-object v0, p0

    .line 58
    check-cast v0, Landroid/view/ViewGroup;

    .line 59
    .local v0, "g":Landroid/view/ViewGroup;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 60
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/emoji/Emoji;->invalidateAll(Landroid/view/View;)V

    .line 59
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 62
    .end local v0    # "g":Landroid/view/ViewGroup;
    .end local v1    # "i":I
    :cond_2
    instance-of v2, p0, Lcom/vk/emoji/EmojiView;

    if-eqz v2, :cond_3

    .line 63
    check-cast p0, Lcom/vk/emoji/EmojiView;

    .end local p0    # "view":Landroid/view/View;
    invoke-interface {p0}, Lcom/vk/emoji/EmojiView;->invalidateEmoji()V

    goto :goto_0

    .line 64
    .restart local p0    # "view":Landroid/view/View;
    :cond_3
    instance-of v2, p0, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    .line 65
    check-cast p0, Landroid/widget/TextView;

    .end local p0    # "view":Landroid/view/View;
    invoke-static {p0}, Lcom/vk/emoji/TextViewInvalidator;->invalidate(Landroid/widget/TextView;)V

    goto :goto_0
.end method

.method private loadAll()V
    .locals 3

    .prologue
    .line 232
    sget-object v1, Lcom/vk/emoji/Emoji;->spritesLoadingExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/vk/emoji/Emoji$2;

    invoke-direct {v2, p0}, Lcom/vk/emoji/Emoji$2;-><init>(Lcom/vk/emoji/Emoji;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 239
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x5

    if-ge v0, v1, :cond_0

    .line 240
    invoke-direct {p0, v0}, Lcom/vk/emoji/Emoji;->loadSprite(I)V

    .line 239
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 242
    :cond_0
    return-void
.end method

.method private loadSprite(I)V
    .locals 2
    .param p1, "spriteIndex"    # I

    .prologue
    .line 245
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->spritesLoading:[Ljava/util/concurrent/atomic/AtomicBoolean;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 266
    :goto_0
    return-void

    .line 248
    :cond_0
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->spritesLoading:[Ljava/util/concurrent/atomic/AtomicBoolean;

    aget-object v0, v0, p1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 250
    sget-object v0, Lcom/vk/emoji/Emoji;->spritesLoadingExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/vk/emoji/Emoji$3;

    invoke-direct {v1, p0, p1}, Lcom/vk/emoji/Emoji$3;-><init>(Lcom/vk/emoji/Emoji;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method


# virtual methods
.method public containsEmoji(Ljava/lang/CharSequence;)Z
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 172
    invoke-static {}, Lcom/vk/emoji/EmojiParser;->instance()Lcom/vk/emoji/EmojiParser;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/emoji/EmojiParser;->containsEmoji(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public dispatchEmojiLoaded()V
    .locals 2

    .prologue
    .line 269
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->emojiLoadedSubject:Lio/reactivex/subjects/PublishSubject;

    iget-object v1, p0, Lcom/vk/emoji/Emoji;->EMOJI_LOADED_FLAG:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 270
    return-void
.end method

.method public emojiLoadObservable()Lio/reactivex/Observable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->emojiLoadedSubject:Lio/reactivex/subjects/PublishSubject;

    const-wide/16 v2, 0x32

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 154
    invoke-virtual {v0, v2, v3, v1}, Lio/reactivex/subjects/PublishSubject;->debounce(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v0

    .line 155
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method public ensureEmojiFit(Landroid/graphics/Paint$FontMetricsInt;)V
    .locals 3
    .param p1, "fontMetrics"    # Landroid/graphics/Paint$FontMetricsInt;

    .prologue
    .line 147
    const/4 v0, 0x2

    .line 148
    invoke-static {v0}, Lcom/vk/emoji/BetterImageSpan;->normalizeAlignment(I)I

    move-result v0

    iget v1, p0, Lcom/vk/emoji/Emoji;->textEmojiSize:I

    iget v2, p0, Lcom/vk/emoji/Emoji;->emojiVerticalPadding:I

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    .line 147
    invoke-static {p1, v0, v1}, Lcom/vk/emoji/BetterImageSpan;->updateFontMetrics(Landroid/graphics/Paint$FontMetricsInt;II)V

    .line 150
    return-void
.end method

.method public getCache()Lokhttp3/Cache;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/vk/emoji/Emoji;->cache:Lokhttp3/Cache;

    return-object v0
.end method

.method public getEmojiDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 9
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 159
    invoke-static {}, Lcom/vk/emoji/EmojiParser;->instance()Lcom/vk/emoji/EmojiParser;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/emoji/EmojiParser;->findEmojiAtPosition(Ljava/lang/CharSequence;)Lcom/vk/emoji/EmojiTreeEntry;

    move-result-object v8

    .line 160
    .local v8, "key":Lcom/vk/emoji/EmojiTreeEntry;
    if-eqz v8, :cond_1

    .line 161
    iget-byte v0, v8, Lcom/vk/emoji/EmojiTreeEntry;->spriteIndex:B

    if-ltz v0, :cond_0

    .line 162
    new-instance v0, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;

    iget-byte v2, v8, Lcom/vk/emoji/EmojiTreeEntry;->spriteIndex:B

    iget-byte v3, v8, Lcom/vk/emoji/EmojiTreeEntry;->x:B

    iget-byte v4, v8, Lcom/vk/emoji/EmojiTreeEntry;->y:B

    iget v5, p0, Lcom/vk/emoji/Emoji;->keyboardEmojiSize:I

    move-object v1, p0

    move v7, v6

    invoke-direct/range {v0 .. v7}, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;-><init>(Lcom/vk/emoji/Emoji;IIIIII)V

    .line 167
    :goto_0
    return-object v0

    .line 164
    :cond_0
    new-instance v2, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;

    iget-object v0, v8, Lcom/vk/emoji/EmojiTreeEntry;->key:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/vk/emoji/Emoji;->getEmojiUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Lcom/vk/emoji/Emoji;->keyboardEmojiSize:I

    move-object v3, p0

    move v7, v6

    invoke-direct/range {v2 .. v7}, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;-><init>(Lcom/vk/emoji/Emoji;Ljava/lang/String;III)V

    move-object v0, v2

    goto :goto_0

    .line 167
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public init(Lokhttp3/Call$Factory;)Lcom/vk/emoji/Emoji;
    .locals 4
    .param p1, "client"    # Lokhttp3/Call$Factory;

    .prologue
    .line 130
    new-instance v1, Lcom/squareup/picasso/LruCache;

    iget v2, p0, Lcom/vk/emoji/Emoji;->emojiSizeInSprite:I

    iget v3, p0, Lcom/vk/emoji/Emoji;->emojiSizeInSprite:I

    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x64

    mul-int/lit8 v2, v2, 0x4

    invoke-direct {v1, v2}, Lcom/squareup/picasso/LruCache;-><init>(I)V

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->emojiMemoryCache:Lcom/squareup/picasso/LruCache;

    .line 131
    new-instance v0, Lcom/squareup/picasso/Picasso$Builder;

    iget-object v1, p0, Lcom/vk/emoji/Emoji;->applicationContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/squareup/picasso/Picasso$Builder;-><init>(Landroid/content/Context;)V

    .line 132
    .local v0, "builder":Lcom/squareup/picasso/Picasso$Builder;
    iget-object v1, p0, Lcom/vk/emoji/Emoji;->emojiMemoryCache:Lcom/squareup/picasso/LruCache;

    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso$Builder;->memoryCache(Lcom/squareup/picasso/Cache;)Lcom/squareup/picasso/Picasso$Builder;

    .line 133
    new-instance v1, Lcom/vk/emoji/OkHttp3Downloader;

    iget-object v2, p0, Lcom/vk/emoji/Emoji;->cache:Lokhttp3/Cache;

    invoke-direct {v1, p1, v2}, Lcom/vk/emoji/OkHttp3Downloader;-><init>(Lokhttp3/Call$Factory;Lokhttp3/Cache;)V

    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso$Builder;->downloader(Lcom/squareup/picasso/Downloader;)Lcom/squareup/picasso/Picasso$Builder;

    .line 134
    sget-object v1, Lcom/vk/emoji/Emoji;->networkLoadingExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso$Builder;->executor(Ljava/util/concurrent/ExecutorService;)Lcom/squareup/picasso/Picasso$Builder;

    .line 135
    invoke-virtual {v0}, Lcom/squareup/picasso/Picasso$Builder;->build()Lcom/squareup/picasso/Picasso;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/emoji/Emoji;->emojiPicasso:Lcom/squareup/picasso/Picasso;

    .line 138
    invoke-direct {p0}, Lcom/vk/emoji/Emoji;->loadAll()V

    .line 139
    return-object p0
.end method

.method public isEmoji(Ljava/lang/CharSequence;)Z
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 176
    invoke-static {}, Lcom/vk/emoji/EmojiParser;->instance()Lcom/vk/emoji/EmojiParser;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/emoji/EmojiParser;->isEmoji(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "input"    # Ljava/lang/CharSequence;

    .prologue
    .line 180
    const/4 v0, 0x0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vk/emoji/Emoji;->replaceEmoji(Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public replaceEmoji(Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;
    .locals 12
    .param p1, "input"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "length"    # I

    .prologue
    .line 184
    if-nez p1, :cond_1

    .line 185
    const/4 v6, 0x0

    .line 220
    :cond_0
    return-object v6

    .line 189
    :cond_1
    instance-of v7, p1, Landroid/text/Spannable;

    if-eqz v7, :cond_2

    move-object v6, p1

    .line 190
    check-cast v6, Landroid/text/Spannable;

    .line 194
    .local v6, "spannable":Landroid/text/Spannable;
    :goto_0
    new-instance v1, Lcom/vk/emoji/SpanRangeList;

    invoke-direct {v1, v6}, Lcom/vk/emoji/SpanRangeList;-><init>(Landroid/text/Spanned;)V

    .line 196
    .local v1, "existingSpanRanges":Lcom/vk/emoji/SpanRangeList;
    move v2, p2

    .line 197
    .local v2, "index":I
    :goto_1
    if-ge v2, p3, :cond_0

    .line 198
    invoke-virtual {v1, v2}, Lcom/vk/emoji/SpanRangeList;->spanEnd(I)I

    move-result v0

    .line 200
    .local v0, "existingSpanEnd":I
    const/4 v7, -0x1

    if-ne v0, v7, :cond_6

    .line 201
    invoke-virtual {v1, v2}, Lcom/vk/emoji/SpanRangeList;->nextSpanStart(I)I

    move-result v4

    .line 202
    .local v4, "nextSpanStart":I
    const/4 v7, -0x1

    if-ne v4, v7, :cond_3

    move v5, p3

    .line 203
    .local v5, "searchRange":I
    :goto_2
    invoke-static {}, Lcom/vk/emoji/EmojiParser;->instance()Lcom/vk/emoji/EmojiParser;

    move-result-object v7

    invoke-virtual {v7, v6, v2, v5}, Lcom/vk/emoji/EmojiParser;->findEmojiAtPosition(Ljava/lang/CharSequence;II)Lcom/vk/emoji/EmojiTreeEntry;

    move-result-object v3

    .line 205
    .local v3, "key":Lcom/vk/emoji/EmojiTreeEntry;
    if-eqz v3, :cond_5

    .line 206
    iget-byte v7, v3, Lcom/vk/emoji/EmojiTreeEntry;->spriteIndex:B

    if-ltz v7, :cond_4

    .line 207
    new-instance v7, Lcom/vk/emoji/EmojiSpan;

    new-instance v8, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;

    iget-byte v9, v3, Lcom/vk/emoji/EmojiTreeEntry;->spriteIndex:B

    iget-byte v10, v3, Lcom/vk/emoji/EmojiTreeEntry;->x:B

    iget-byte v11, v3, Lcom/vk/emoji/EmojiTreeEntry;->y:B

    invoke-direct {v8, p0, v9, v10, v11}, Lcom/vk/emoji/Emoji$SpriteEmojiDrawable;-><init>(Lcom/vk/emoji/Emoji;III)V

    invoke-direct {v7, v8}, Lcom/vk/emoji/EmojiSpan;-><init>(Lcom/vk/emoji/EmojiDrawable;)V

    invoke-virtual {v3}, Lcom/vk/emoji/EmojiTreeEntry;->length()I

    move-result v8

    add-int/2addr v8, v2

    const/16 v9, 0x21

    invoke-interface {v6, v7, v2, v8, v9}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 211
    :goto_3
    invoke-virtual {v3}, Lcom/vk/emoji/EmojiTreeEntry;->length()I

    move-result v7

    add-int/2addr v2, v7

    goto :goto_1

    .line 192
    .end local v0    # "existingSpanEnd":I
    .end local v1    # "existingSpanRanges":Lcom/vk/emoji/SpanRangeList;
    .end local v2    # "index":I
    .end local v3    # "key":Lcom/vk/emoji/EmojiTreeEntry;
    .end local v4    # "nextSpanStart":I
    .end local v5    # "searchRange":I
    .end local v6    # "spannable":Landroid/text/Spannable;
    :cond_2
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v7

    invoke-virtual {v7, p1}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v6

    .restart local v6    # "spannable":Landroid/text/Spannable;
    goto :goto_0

    .restart local v0    # "existingSpanEnd":I
    .restart local v1    # "existingSpanRanges":Lcom/vk/emoji/SpanRangeList;
    .restart local v2    # "index":I
    .restart local v4    # "nextSpanStart":I
    :cond_3
    move v5, v4

    .line 202
    goto :goto_2

    .line 209
    .restart local v3    # "key":Lcom/vk/emoji/EmojiTreeEntry;
    .restart local v5    # "searchRange":I
    :cond_4
    new-instance v7, Lcom/vk/emoji/EmojiSpan;

    new-instance v8, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;

    iget-object v9, v3, Lcom/vk/emoji/EmojiTreeEntry;->key:Ljava/lang/String;

    invoke-direct {p0, v9}, Lcom/vk/emoji/Emoji;->getEmojiUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, p0, v9}, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;-><init>(Lcom/vk/emoji/Emoji;Ljava/lang/String;)V

    invoke-direct {v7, v8}, Lcom/vk/emoji/EmojiSpan;-><init>(Lcom/vk/emoji/EmojiDrawable;)V

    invoke-virtual {v3}, Lcom/vk/emoji/EmojiTreeEntry;->length()I

    move-result v8

    add-int/2addr v8, v2

    const/16 v9, 0x21

    invoke-interface {v6, v7, v2, v8, v9}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_3

    .line 213
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 216
    .end local v3    # "key":Lcom/vk/emoji/EmojiTreeEntry;
    .end local v4    # "nextSpanStart":I
    .end local v5    # "searchRange":I
    :cond_6
    move v2, v0

    goto :goto_1
.end method
