.class public Lru/mail/libverify/controls/Utils;
.super Ljava/lang/Object;


# static fields
.field public static uiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lru/mail/libverify/controls/Utils;->uiHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/view/View;)V
    .locals 0

    invoke-static {p0}, Lru/mail/libverify/controls/Utils;->showKeyboardSync(Landroid/view/View;)V

    return-void
.end method

.method public static hasSelfPermission(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x1

    :try_start_0
    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-nez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static hideKeyboard(Landroid/view/View;)V
    .locals 3

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :cond_0
    return-void
.end method

.method private static safeRequestFocus(Landroid/view/View;)Z
    .locals 1

    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static showKeyboard(Landroid/view/View;)V
    .locals 1

    const/16 v0, 0xa

    invoke-static {p0, v0}, Lru/mail/libverify/controls/Utils;->showKeyboardDelayed(Landroid/view/View;I)V

    return-void
.end method

.method public static showKeyboard(ZLandroid/view/View;)V
    .locals 0

    if-eqz p0, :cond_0

    invoke-static {p1}, Lru/mail/libverify/controls/Utils;->safeRequestFocus(Landroid/view/View;)Z

    invoke-static {p1}, Lru/mail/libverify/controls/Utils;->showKeyboardReliable(Landroid/view/View;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {p1}, Lru/mail/libverify/controls/Utils;->hideKeyboard(Landroid/view/View;)V

    goto :goto_0
.end method

.method private static showKeyboardDelayed(Landroid/view/View;I)V
    .locals 4

    if-eqz p0, :cond_0

    sget-object v0, Lru/mail/libverify/controls/Utils;->uiHandler:Landroid/os/Handler;

    new-instance v1, Lru/mail/libverify/controls/Utils$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/controls/Utils$1;-><init>(Landroid/view/View;)V

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method private static showKeyboardReliable(Landroid/view/View;)V
    .locals 1

    const/16 v0, 0x64

    invoke-static {p0, v0}, Lru/mail/libverify/controls/Utils;->showKeyboardDelayed(Landroid/view/View;I)V

    return-void
.end method

.method private static showKeyboardSync(Landroid/view/View;)V
    .locals 2

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :cond_0
    return-void
.end method
