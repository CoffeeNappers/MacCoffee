.class public Lcom/vkontakte/android/fragments/WebViewFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "WebViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/WebViewFragment$Builder;
    }
.end annotation


# static fields
.field private static final CACHE_PATH:Ljava/io/File;

.field private static final FILECHOOSER_RESULTCODE:I = 0x270f

.field private static final LINK_REDIR_RESULT:I = 0x65


# instance fields
.field private appReport:Z

.field private copyLink:Z

.field private lastUrl:Ljava/lang/String;

.field private mChromeClient:Landroid/webkit/WebChromeClient;

.field private mClient:Landroid/webkit/WebViewClient;

.field private mWebView:Landroid/webkit/WebView;

.field private photoFileUri:Landroid/net/Uri;

.field private toolbarProgress:Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

.field private uploadUriCallback:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private uploadUrisCallback:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback",
            "<[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private videoFileUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 56
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string/jumbo v2, ".vkontakte/cache/html"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/fragments/WebViewFragment;->CACHE_PATH:Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 117
    new-instance v0, Lcom/vkontakte/android/fragments/WebViewFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/WebViewFragment$1;-><init>(Lcom/vkontakte/android/fragments/WebViewFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mClient:Landroid/webkit/WebViewClient;

    .line 156
    new-instance v0, Lcom/vkontakte/android/fragments/WebViewFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/WebViewFragment$2;-><init>(Lcom/vkontakte/android/fragments/WebViewFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mChromeClient:Landroid/webkit/WebChromeClient;

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/WebViewFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->lastUrl:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/WebViewFragment;)Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->toolbarProgress:Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/WebViewFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getScreenTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/WebViewFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 55
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/WebViewFragment;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/webkit/ValueCallback;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUriCallback:Landroid/webkit/ValueCallback;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/fragments/WebViewFragment;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;
    .param p1, "x1"    # Landroid/webkit/ValueCallback;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUriCallback:Landroid/webkit/ValueCallback;

    return-object p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/webkit/ValueCallback;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUrisCallback:Landroid/webkit/ValueCallback;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/fragments/WebViewFragment;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;
    .param p1, "x1"    # Landroid/webkit/ValueCallback;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUrisCallback:Landroid/webkit/ValueCallback;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/net/Uri;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->photoFileUri:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$602(Lcom/vkontakte/android/fragments/WebViewFragment;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->photoFileUri:Landroid/net/Uri;

    return-object p1
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/net/Uri;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->videoFileUri:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/fragments/WebViewFragment;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/WebViewFragment;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->videoFileUri:Landroid/net/Uri;

    return-object p1
.end method

.method private getCorrectFileUri()Landroid/net/Uri;
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 355
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->photoFileUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->photoFileUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 356
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->photoFileUri:Landroid/net/Uri;

    .line 362
    :goto_0
    return-object v0

    .line 358
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->videoFileUri:Landroid/net/Uri;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->videoFileUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 359
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->videoFileUri:Landroid/net/Uri;

    goto :goto_0

    .line 362
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getScreenTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 508
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "screen_title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private setupTheme()V
    .locals 4

    .prologue
    .line 405
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    .line 406
    .local v1, "toolbar":Landroid/support/v7/widget/Toolbar;
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->appReport:Z

    if-eqz v2, :cond_0

    .line 407
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f02018a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 408
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0100cd

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->fetchSystemColor(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v0, v2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTint(Landroid/graphics/drawable/Drawable;I)V

    .line 409
    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 413
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :goto_0
    return-void

    .line 411
    :cond_0
    const v2, 0x7f02014f

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    goto :goto_0
.end method


# virtual methods
.method public doLoadData()V
    .locals 3

    .prologue
    .line 444
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "url"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 445
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 449
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 451
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x0

    .line 308
    const/16 v1, 0x65

    if-ne p1, v1, :cond_1

    .line 309
    if-nez p2, :cond_0

    .line 310
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    .line 311
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->lastUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 352
    :cond_0
    :goto_0
    return-void

    .line 315
    :cond_1
    const/16 v1, 0x270f

    if-ne p1, v1, :cond_0

    .line 317
    const/4 v0, 0x0

    .line 319
    .local v0, "pickedFileUri":Landroid/net/Uri;
    const/4 v1, -0x1

    if-ne p2, v1, :cond_2

    .line 320
    if-eqz p3, :cond_5

    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 321
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 327
    :cond_2
    :goto_1
    if-eqz v0, :cond_6

    .line 328
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUrisCallback:Landroid/webkit/ValueCallback;

    if-eqz v1, :cond_3

    .line 329
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUrisCallback:Landroid/webkit/ValueCallback;

    const/4 v2, 0x1

    new-array v2, v2, [Landroid/net/Uri;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-interface {v1, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 330
    iput-object v4, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUrisCallback:Landroid/webkit/ValueCallback;

    .line 332
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUriCallback:Landroid/webkit/ValueCallback;

    if-eqz v1, :cond_4

    .line 333
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUriCallback:Landroid/webkit/ValueCallback;

    invoke-interface {v1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 334
    iput-object v4, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUriCallback:Landroid/webkit/ValueCallback;

    .line 349
    :cond_4
    :goto_2
    iput-object v4, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->photoFileUri:Landroid/net/Uri;

    .line 350
    iput-object v4, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->videoFileUri:Landroid/net/Uri;

    goto :goto_0

    .line 323
    :cond_5
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getCorrectFileUri()Landroid/net/Uri;

    move-result-object v0

    goto :goto_1

    .line 338
    :cond_6
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUrisCallback:Landroid/webkit/ValueCallback;

    if-eqz v1, :cond_7

    .line 339
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUrisCallback:Landroid/webkit/ValueCallback;

    invoke-interface {v1, v4}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 340
    iput-object v4, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUrisCallback:Landroid/webkit/ValueCallback;

    .line 343
    :cond_7
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUriCallback:Landroid/webkit/ValueCallback;

    if-eqz v1, :cond_4

    .line 344
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUriCallback:Landroid/webkit/ValueCallback;

    invoke-interface {v1, v4}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 345
    iput-object v4, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->uploadUriCallback:Landroid/webkit/ValueCallback;

    goto :goto_2
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 464
    const v0, 0x7f0300fa

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/WebViewFragment;->setLayout(I)V

    .line 465
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 466
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 455
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 456
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 457
    const/4 v0, 0x1

    .line 459
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 373
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 374
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getScreenTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/WebViewFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 375
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v3, "url_to_copy"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->copyLink:Z

    .line 376
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v3, "app_report"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->appReport:Z

    .line 377
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->copyLink:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->appReport:Z

    if-eqz v0, :cond_1

    :cond_0
    move v2, v1

    :cond_1
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/WebViewFragment;->setHasOptionsMenu(Z)V

    .line 378
    return-void

    :cond_2
    move v0, v2

    .line 375
    goto :goto_0
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 437
    new-instance v0, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 438
    .local v0, "wv":Landroid/webkit/WebView;
    const v1, 0x7f10008f

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setId(I)V

    .line 439
    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 5
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v4, 0x0

    .line 475
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->copyLink:Z

    if-eqz v1, :cond_0

    .line 476
    const v1, 0x7f10000f

    const v2, 0x7f080184

    invoke-interface {p1, v4, v1, v4, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 477
    .local v0, "item":Landroid/view/MenuItem;
    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 479
    .end local v0    # "item":Landroid/view/MenuItem;
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->appReport:Z

    if-eqz v1, :cond_1

    .line 480
    const v1, 0x7f100008

    const/4 v2, 0x1

    const v3, 0x7f0805bd

    invoke-interface {p1, v4, v1, v2, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 481
    .restart local v0    # "item":Landroid/view/MenuItem;
    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 483
    .end local v0    # "item":Landroid/view/MenuItem;
    :cond_1
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 484
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 429
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroyView()V

    .line 430
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 431
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 432
    iput-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    .line 433
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 9
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v5, 0x1

    .line 488
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    .line 503
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v5

    :goto_0
    return v5

    .line 490
    :sswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "url_to_copy"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 491
    .local v4, "url":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const-string/jumbo v7, "clipboard"

    invoke-virtual {v6, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 492
    .local v1, "clipboard":Landroid/content/ClipboardManager;
    invoke-static {v4, v4}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 493
    .local v0, "clip":Landroid/content/ClipData;
    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    goto :goto_0

    .line 496
    .end local v0    # "clip":Landroid/content/ClipData;
    .end local v1    # "clipboard":Landroid/content/ClipboardManager;
    .end local v4    # "url":Ljava/lang/String;
    :sswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 497
    .local v2, "context":Landroid/content/Context;
    new-instance v3, Landroid/content/Intent;

    const-class v6, Lcom/vkontakte/android/ReportAppsActivity;

    invoke-direct {v3, v2, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 498
    .local v3, "intent":Landroid/content/Intent;
    const-string/jumbo v6, "ownerID"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "ownerID"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v3, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 499
    const-string/jumbo v6, "appID"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "appID"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v3, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 500
    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 488
    :sswitch_data_0
    .sparse-switch
        0x7f100008 -> :sswitch_1
        0x7f10000f -> :sswitch_0
    .end sparse-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 417
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    .line 418
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onPause()V

    .line 419
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 471
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 423
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onResume()V

    .line 424
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    .line 425
    return-void
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 368
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 369
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 382
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 383
    const v1, 0x7f10008f

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/webkit/WebView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    .line 384
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 385
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v2, v3}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    .line 387
    :cond_0
    const v1, 0x7f100385

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->toolbarProgress:Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    .line 388
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 389
    .local v0, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 390
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 391
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 392
    sget-object v1, Lcom/vkontakte/android/fragments/WebViewFragment;->CACHE_PATH:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 393
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 394
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 395
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 396
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mClient:Landroid/webkit/WebViewClient;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 397
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mWebView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->mChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 398
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->setupTheme()V

    .line 399
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment;->loaded:Z

    if-nez v1, :cond_1

    .line 400
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/WebViewFragment;->loadData()V

    .line 402
    :cond_1
    return-void
.end method
