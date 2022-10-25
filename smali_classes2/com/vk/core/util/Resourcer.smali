.class public final Lcom/vk/core/util/Resourcer;
.super Ljava/lang/Object;
.source "Resourcer.java"


# static fields
.field private static cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/content/Context;",
            "Lcom/vk/core/util/Resourcer;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile instance:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vk/core/util/Resourcer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final context:Landroid/content/Context;

.field private final res:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/vk/core/util/Resourcer;->instance:Ljava/lang/ref/WeakReference;

    .line 32
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/vk/core/util/Resourcer;->cache:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/vk/core/util/Resourcer;->context:Landroid/content/Context;

    .line 69
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/util/Resourcer;->res:Landroid/content/res/Resources;

    .line 70
    return-void
.end method

.method public static from(Landroid/view/View;)Lcom/vk/core/util/Resourcer;
    .locals 1
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v0

    return-object v0
.end method

.method public static get()Lcom/vk/core/util/Resourcer;
    .locals 5
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 51
    sget-object v2, Lcom/vk/core/util/Resourcer;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/core/util/Resourcer;

    .line 52
    .local v1, "r":Lcom/vk/core/util/Resourcer;
    if-nez v1, :cond_1

    .line 53
    const-class v3, Lcom/vk/core/util/Resourcer;

    monitor-enter v3

    .line 54
    :try_start_0
    sget-object v2, Lcom/vk/core/util/Resourcer;->instance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/vk/core/util/Resourcer;

    move-object v1, v0

    .line 55
    if-nez v1, :cond_0

    .line 56
    new-instance v2, Ljava/lang/ref/WeakReference;

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v2, Lcom/vk/core/util/Resourcer;->instance:Ljava/lang/ref/WeakReference;

    .line 58
    :cond_0
    monitor-exit v3

    .line 61
    :cond_1
    return-object v1

    .line 58
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 36
    sget-object v1, Lcom/vk/core/util/Resourcer;->cache:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/core/util/Resourcer;

    .line 37
    .local v0, "resourcer":Lcom/vk/core/util/Resourcer;
    if-nez v0, :cond_0

    .line 38
    new-instance v0, Lcom/vk/core/util/Resourcer;

    .end local v0    # "resourcer":Lcom/vk/core/util/Resourcer;
    invoke-direct {v0, p0}, Lcom/vk/core/util/Resourcer;-><init>(Landroid/content/Context;)V

    .line 39
    .restart local v0    # "resourcer":Lcom/vk/core/util/Resourcer;
    sget-object v1, Lcom/vk/core/util/Resourcer;->cache:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    :cond_0
    return-object v0
.end method


# virtual methods
.method public color(I)I
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    .line 107
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    return v0
.end method

.method public colorList(I)Landroid/content/res/ColorStateList;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public dim(I)I
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 102
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->res:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method public dimF(I)F
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->res:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    return v0
.end method

.method public drawable(I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public integer(I)I
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IntegerRes;
        .end annotation
    .end param

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->res:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    return v0
.end method

.method public plural(II)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/PluralsRes;
        .end annotation
    .end param
    .param p2, "quantity"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->res:Landroid/content/res/Resources;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public pluralArg(II)Ljava/lang/String;
    .locals 4
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/PluralsRes;
        .end annotation
    .end param
    .param p2, "quantity"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->res:Landroid/content/res/Resources;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, p1, p2, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs pluralArg(II[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/PluralsRes;
        .end annotation
    .end param
    .param p2, "quantity"    # I
    .param p3, "formatArgs"    # [Ljava/lang/Object;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->res:Landroid/content/res/Resources;

    invoke-virtual {v0, p1, p2, p3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public str(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->res:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs str(I[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "formatArgs"    # [Ljava/lang/Object;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lcom/vk/core/util/Resourcer;->res:Landroid/content/res/Resources;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
