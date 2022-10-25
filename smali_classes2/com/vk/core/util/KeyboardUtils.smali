.class public Lcom/vk/core/util/KeyboardUtils;
.super Ljava/lang/Object;
.source "KeyboardUtils.java"


# static fields
.field private static handler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 23
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vk/core/util/KeyboardUtils;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyTextToClipboard(Ljava/lang/CharSequence;)V
    .locals 4
    .param p0, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 72
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 78
    :goto_0
    return-void

    .line 75
    :cond_0
    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string/jumbo v3, "clipboard"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 76
    .local v1, "clipboard":Landroid/content/ClipboardManager;
    invoke-static {p0, p0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 77
    .local v0, "clip":Landroid/content/ClipData;
    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    goto :goto_0
.end method

.method private static getScreenOrientation(Landroid/view/Window;)I
    .locals 5
    .param p0, "window"    # Landroid/view/Window;

    .prologue
    .line 82
    invoke-virtual {p0}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 84
    .local v0, "getOrient":Landroid/view/Display;
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 85
    .local v2, "p":Landroid/graphics/Point;
    invoke-virtual {v0, v2}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 86
    iget v3, v2, Landroid/graphics/Point;->x:I

    iget v4, v2, Landroid/graphics/Point;->y:I

    if-ge v3, v4, :cond_0

    .line 87
    const/4 v1, 0x1

    .line 91
    .local v1, "orientation":I
    :goto_0
    return v1

    .line 89
    .end local v1    # "orientation":I
    :cond_0
    const/4 v1, 0x2

    .restart local v1    # "orientation":I
    goto :goto_0
.end method

.method public static hideKeyboard(Landroid/content/Context;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    if-eqz p0, :cond_0

    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_0

    .line 60
    invoke-static {p0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 61
    .local v0, "activity":Landroid/app/Activity;
    sget-object v1, Lcom/vk/core/util/KeyboardUtils;->handler:Landroid/os/Handler;

    new-instance v2, Lcom/vk/core/util/KeyboardUtils$2;

    invoke-direct {v2, v0}, Lcom/vk/core/util/KeyboardUtils$2;-><init>(Landroid/app/Activity;)V

    const-wide/16 v4, 0xa

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 69
    .end local v0    # "activity":Landroid/app/Activity;
    :cond_0
    return-void
.end method

.method public static setSoftInputModeAdjustPan(Landroid/view/Window;)V
    .locals 1
    .param p0, "window"    # Landroid/view/Window;

    .prologue
    .line 32
    if-eqz p0, :cond_0

    .line 33
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 35
    :cond_0
    return-void
.end method

.method public static setSoftInputModeAdjustResize(Landroid/view/Window;)V
    .locals 1
    .param p0, "window"    # Landroid/view/Window;

    .prologue
    .line 26
    if-eqz p0, :cond_0

    .line 27
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 29
    :cond_0
    return-void
.end method

.method public static setSoftInputModeNothing(Landroid/app/Activity;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 38
    if-eqz p0, :cond_0

    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_1

    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x30

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 45
    :cond_0
    :goto_0
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    goto :goto_0
.end method

.method public static showKeyboard(Landroid/view/View;)V
    .locals 4
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 48
    new-instance v0, Lcom/vk/core/util/KeyboardUtils$1;

    invoke-direct {v0, p0}, Lcom/vk/core/util/KeyboardUtils$1;-><init>(Landroid/view/View;)V

    const-wide/16 v2, 0xa

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 56
    return-void
.end method
