.class public Lcom/vkontakte/android/ValidationActivity;
.super Lcom/vkontakte/android/activities/TabletsDialogActivity;
.source "ValidationActivity.java"


# static fields
.field public static final KEY_ACCESS_TOKEN:Ljava/lang/String; = "access_token"

.field public static final KEY_AUTH_STATE:Ljava/lang/String; = "auth_state"

.field public static final KEY_REQUIRE_JUST_ACCESS_TOKEN:Ljava/lang/String; = "require_access_token"

.field public static final KEY_RETURN_RESULT:Ljava/lang/String; = "return_result"

.field public static final KEY_SECRET:Ljava/lang/String; = "secret"

.field public static final KEY_URL:Ljava/lang/String; = "url"

.field public static final KEY_USER_ID:Ljava/lang/String; = "user_id"

.field public static final VRESULT_CANCEL:I = 0x1

.field public static final VRESULT_NONE:I = 0x0

.field public static final VRESULT_RETRY:I = 0x2

.field public static result:I


# instance fields
.field private mManager:Lcom/vkontakte/android/data/PurchasesManager;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/PurchasesManager",
            "<",
            "Lcom/vkontakte/android/data/PurchasesManager$Product;",
            ">;"
        }
    .end annotation
.end field

.field private progress:Landroid/app/ProgressDialog;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x0

    sput v0, Lcom/vkontakte/android/ValidationActivity;->result:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;-><init>()V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    return-void
.end method

.method static synthetic access$000(Landroid/net/Uri;)Z
    .locals 1
    .param p0, "x0"    # Landroid/net/Uri;

    .prologue
    .line 31
    invoke-static {p0}, Lcom/vkontakte/android/ValidationActivity;->isGooglePurchasesLink(Landroid/net/Uri;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ValidationActivity;)Lcom/vkontakte/android/data/PurchasesManager;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ValidationActivity;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/ValidationActivity;Lcom/vkontakte/android/data/PurchasesManager;)Lcom/vkontakte/android/data/PurchasesManager;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ValidationActivity;
    .param p1, "x1"    # Lcom/vkontakte/android/data/PurchasesManager;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vkontakte/android/ValidationActivity;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ValidationActivity;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ValidationActivity;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ValidationActivity;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ValidationActivity;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->progress:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/ValidationActivity;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ValidationActivity;
    .param p1, "x1"    # Landroid/app/ProgressDialog;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vkontakte/android/ValidationActivity;->progress:Landroid/app/ProgressDialog;

    return-object p1
.end method

.method private static isGooglePurchasesLink(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 247
    invoke-static {p0}, Lcom/vkontakte/android/LinkRedirActivity;->isVKScheme(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "purchases_googleplay"

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 55
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/data/PurchasesManager;->onActivityResult(IILandroid/content/Intent;)V

    .line 59
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .prologue
    .line 240
    sget v0, Lcom/vkontakte/android/ValidationActivity;->result:I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/ValidationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "return_result"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 241
    const/4 v0, 0x1

    sput v0, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 243
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onBackPressed()V

    .line 244
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x1

    .line 62
    invoke-super {p0, p1}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ValidationActivity;->setFinishOnTouchOutside(Z)V

    .line 64
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->webView:Landroid/webkit/WebView;

    .line 65
    invoke-static {p0}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 66
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->webView:Landroid/webkit/WebView;

    new-instance v1, Lcom/vkontakte/android/ValidationActivity$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ValidationActivity$1;-><init>(Lcom/vkontakte/android/ValidationActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->webView:Landroid/webkit/WebView;

    new-instance v1, Lcom/vkontakte/android/ValidationActivity$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ValidationActivity$2;-><init>(Lcom/vkontakte/android/ValidationActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 223
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ValidationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "url"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 224
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->webView:Landroid/webkit/WebView;

    const v1, 0x7f0f0024

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setBackgroundResource(I)V

    .line 226
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ValidationActivity;->setContentView(Landroid/view/View;)V

    .line 227
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->progress:Landroid/app/ProgressDialog;

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity;->progress:Landroid/app/ProgressDialog;

    const v1, 0x7f08033d

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ValidationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 229
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 233
    invoke-super {p0}, Lcom/vkontakte/android/activities/TabletsDialogActivity;->onDestroy()V

    .line 234
    sget v0, Lcom/vkontakte/android/ValidationActivity;->result:I

    if-nez v0, :cond_0

    .line 235
    const/4 v0, 0x1

    sput v0, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 237
    :cond_0
    return-void
.end method
