.class public Lcom/vkontakte/android/fragments/HtmlGameFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "HtmlGameFragment.java"

# interfaces
.implements Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;
.implements Lcom/vkontakte/android/fragments/BackListener;
.implements Lcom/vkontakte/android/fragments/LeaderboardFragment$OnDismissedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;,
        Lcom/vkontakte/android/fragments/HtmlGameFragment$Builder;
    }
.end annotation


# static fields
.field private static final AUTH_HOST:Ljava/lang/String; = "https://oauth.vk.com"

.field public static final AUTH_RESULT:I = 0xd

.field private static final AUTH_URI_FRM:Ljava/lang/String; = "/authorize?client_id=%1$s&redirect_uri=blank.html&response_type=token&v=5.40&revoke=1&scope=%2$s&display=android&access_token=%3$s"

.field private static final BRIDGE_NAME:Ljava/lang/String; = "AndroidBridge"

.field private static final CACHE_PATH:Ljava/io/File;

.field private static final CANCELLED_KEY:Ljava/lang/String; = "cancel"

.field private static final FAIL_KEY:Ljava/lang/String; = "fail"

.field private static final MAX_ATTEMPTS_COUNT:I = 0xa

.field public static final SHARE_RESULT:I = 0xc

.field private static final SHARE_TARGET_MESSAGE:Ljava/lang/String; = "im"

.field private static final SHARE_TARGET_WALL:Ljava/lang/String; = "wall"

.field private static final SUCCEEDED_KEY:Ljava/lang/String; = "success"

.field private static TAG:Ljava/lang/String;


# instance fields
.field private apiApplication:Lcom/vkontakte/android/data/ApiApplication;

.field private appId:I

.field private bug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround;

.field private ownerId:I

.field private screenTitle:Ljava/lang/String;

.field private textViewTitle:Landroid/widget/TextView;

.field private urlToCopy:Ljava/lang/String;

.field private urlToLoad:Ljava/lang/String;

.field private final webChromeClient:Landroid/webkit/WebChromeClient;

.field private webView:Landroid/webkit/WebView;

.field private final webViewClient:Landroid/webkit/WebViewClient;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 83
    const-string/jumbo v0, "HtmlGameFragment"

    sput-object v0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->TAG:Ljava/lang/String;

    .line 96
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string/jumbo v2, ".vkontakte/cache/html"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->CACHE_PATH:Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 81
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 339
    new-instance v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$1;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webViewClient:Landroid/webkit/WebViewClient;

    .line 359
    new-instance v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$2;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webChromeClient:Landroid/webkit/WebChromeClient;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    sget-object v0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/HtmlGameFragment;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchApiResponse(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/HtmlGameFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->screenTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1302(Lcom/vkontakte/android/fragments/HtmlGameFragment;Lcom/vkontakte/android/data/ApiApplication;)Lcom/vkontakte/android/data/ApiApplication;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/data/ApiApplication;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowInviteBoxResponseToGame(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowLeaderboardResponseToGame(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowOrderBoxResponseToGame(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/lang/String;IILcom/vkontakte/android/api/Callback;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # I
    .param p4, "x4"    # I
    .param p5, "x5"    # Lcom/vkontakte/android/api/Callback;

    .prologue
    .line 81
    invoke-direct/range {p0 .. p5}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->invokeOrderBuyItem(Ljava/lang/String;Ljava/lang/String;IILcom/vkontakte/android/api/Callback;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/util/ArrayList;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->doShowShareWall(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Lcom/vkontakte/android/Photo;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/vkontakte/android/Photo;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->doShowShareDialogs(Ljava/lang/String;Lcom/vkontakte/android/Photo;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->prepareAndShowShare(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowShareBoxResponseToGame(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->doShowInviteBox()V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->doShowRequestBox(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->doShowSettingsBox(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;IIZLjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # Z
    .param p5, "x5"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-direct/range {p0 .. p5}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->processShowOrderBox(Ljava/lang/String;IIZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/HtmlGameFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 81
    iget v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->appId:I

    return v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/HtmlGameFragment;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->doShowLeaderboard(II)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->doClose()V

    return-void
.end method

.method private dispatchApiResponse(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "callbackId"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/String;

    .prologue
    .line 665
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "VK.proxy.apiResponse("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->runJavascriptIn(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 666
    return-void
.end method

.method private dispatchShowInviteBoxResponseToGame(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 644
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "VK.proxy.response(\'showInviteBox\',\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->runJavascriptIn(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 645
    return-void
.end method

.method private dispatchShowLeaderboardResponseToGame(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 636
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "VK.proxy.response(\'showLeaderboardBox\',\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->runJavascriptIn(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 637
    return-void
.end method

.method private dispatchShowOrderBoxResponseToGame(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 661
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "VK.proxy.response(\'showOrderBox\',\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->runJavascriptIn(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 662
    return-void
.end method

.method private dispatchShowRequestBoxResponseToGame(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 640
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "VK.proxy.response(\'showRequestBox\',\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->runJavascriptIn(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 641
    return-void
.end method

.method private dispatchShowSettingsBoxResponseToGame(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;
    .param p2, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 652
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 653
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "VK.proxy.response(\'showSettingsBox\',\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->runJavascriptIn(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 658
    :goto_0
    return-void

    .line 656
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "VK.proxy.response(\'showSettingsBox\',\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\", \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->runJavascriptIn(Landroid/webkit/WebView;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private dispatchShowShareBoxResponseToGame(Ljava/lang/String;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 648
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "VK.proxy.response(\'showShareBox\',\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->runJavascriptIn(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 649
    return-void
.end method

.method private doClose()V
    .locals 1

    .prologue
    .line 670
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 671
    return-void
.end method

.method private doShowInviteBox()V
    .locals 2

    .prologue
    .line 873
    new-instance v0, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment$Builder;

    iget v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->appId:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment$Builder;-><init>(I)V

    .line 874
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment$Builder;->setDisableSpinner()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setMultiSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setGlobalSearch(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const v1, 0x7f080261

    .line 875
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/16 v1, 0xf3f

    .line 876
    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 877
    return-void
.end method

.method private doShowLeaderboard(II)V
    .locals 3
    .param p1, "applicationId"    # I
    .param p2, "currentPointsOrLevel"    # I

    .prologue
    .line 685
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p2, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;Landroid/content/Context;II)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 713
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 714
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 715
    return-void
.end method

.method private doShowRequestBox(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "uid"    # I
    .param p3, "requestKey"    # Ljava/lang/String;

    .prologue
    .line 674
    invoke-static {p2}, Lcom/vkontakte/android/data/Friends;->get(I)Lcom/vkontakte/android/UserProfile;

    move-result-object v0

    .line 676
    .local v0, "up":Lcom/vkontakte/android/UserProfile;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 678
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    invoke-static {v1, v0, p1, p3, p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->showForResult(Lcom/vkontakte/android/data/ApiApplication;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/lang/String;Landroid/app/Fragment;)V

    .line 682
    :goto_0
    return-void

    .line 680
    :cond_0
    iget v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->appId:I

    invoke-static {v1, p2, p1, p3, p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->showForResult(IILjava/lang/String;Ljava/lang/String;Landroid/app/Fragment;)V

    goto :goto_0
.end method

.method private doShowSettingsBox(Ljava/lang/String;)V
    .locals 8
    .param p1, "mask"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 719
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 721
    .local v0, "accessToken":Ljava/lang/String;
    const-string/jumbo v3, "/authorize?client_id=%1$s&redirect_uri=blank.html&response_type=token&v=5.40&revoke=1&scope=%2$s&display=android&access_token=%3$s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget v6, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->appId:I

    .line 722
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    aput-object p1, v4, v7

    const/4 v5, 0x2

    aput-object v0, v4, v5

    .line 721
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 726
    .local v2, "authUriPart":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "&sig="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getSig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 728
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "https://oauth.vk.com"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 730
    .local v1, "authUri":Ljava/lang/String;
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-class v5, Lcom/vkontakte/android/ValidationActivity;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v4, "url"

    .line 731
    invoke-virtual {v3, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v4, "return_result"

    .line 732
    invoke-virtual {v3, v4, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v4, "require_access_token"

    .line 733
    invoke-virtual {v3, v4, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v3

    const/16 v4, 0xd

    .line 730
    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 734
    return-void
.end method

.method private doShowShareDialogs(Ljava/lang/String;Lcom/vkontakte/android/Photo;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "photo"    # Lcom/vkontakte/android/Photo;

    .prologue
    .line 880
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 881
    .local v0, "b":Lcom/vk/sharing/Sharing$Builder;
    if-eqz p2, :cond_0

    .line 882
    const-string/jumbo v1, "photos"

    invoke-static {p2, v1}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/Photo;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    .line 885
    :cond_0
    invoke-static {p1}, Lcom/vk/sharing/action/Actions;->createInfoDialogsShareOnly(Ljava/lang/String;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    const/4 v2, 0x1

    .line 886
    invoke-virtual {v1, v2}, Lcom/vk/sharing/Sharing$Builder;->fullScreen(Z)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v1

    const/16 v2, 0xc

    .line 887
    invoke-virtual {v1, p0, v2}, Lcom/vk/sharing/Sharing$Builder;->shareForResult(Landroid/app/Fragment;I)V

    .line 888
    return-void
.end method

.method private doShowShareWall(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 8
    .param p1, "message"    # Ljava/lang/String;
    .param p3, "link"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    const/4 v7, 0x1

    .line 891
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 892
    .local v1, "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    if-eqz p2, :cond_0

    .line 893
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/Photo;

    .line 894
    .local v3, "photo":Lcom/vkontakte/android/Photo;
    new-instance v5, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-direct {v5, v3}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 898
    .end local v3    # "photo":Lcom/vkontakte/android/Photo;
    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 899
    new-instance v4, Lcom/vkontakte/android/attachments/LinkAttachment;

    const-string/jumbo v5, ""

    const-string/jumbo v6, ""

    invoke-direct {v4, p3, v5, v6}, Lcom/vkontakte/android/attachments/LinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 902
    :cond_1
    new-instance v2, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    .line 903
    .local v2, "builder":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    if-eqz p1, :cond_2

    .line 904
    invoke-virtual {v2, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachText(Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 907
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_3

    .line 908
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v0, v4, [Lcom/vkontakte/android/attachments/Attachment;

    .line 909
    .local v0, "attArray":[Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 910
    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachAttachments([Lcom/vkontakte/android/attachments/Attachment;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 913
    .end local v0    # "attArray":[Lcom/vkontakte/android/attachments/Attachment;
    :cond_3
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->forbidAttachmentsEdit(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 915
    invoke-virtual {v2, v7}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->send(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 917
    const/16 v4, 0xc

    invoke-virtual {v2, p0, v4}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 918
    return-void
.end method

.method private getSig(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 937
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getSecret()Ljava/lang/String;

    move-result-object v0

    .line 939
    .local v0, "secret":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 940
    const-string/jumbo v1, ""

    .line 944
    :goto_0
    return-object v1

    .line 943
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 944
    invoke-static {p1}, Lcom/vkontakte/android/api/VKAPIRequest;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private invokeOrderBuyItem(Ljava/lang/String;Ljava/lang/String;IILcom/vkontakte/android/api/Callback;)V
    .locals 7
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "item"    # Ljava/lang/String;
    .param p3, "orderId"    # I
    .param p4, "attemtpsCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "II",
            "Lcom/vkontakte/android/api/Callback",
            "<",
            "Lcom/vkontakte/android/api/Order;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 777
    .local p5, "callback":Lcom/vkontakte/android/api/Callback;, "Lcom/vkontakte/android/api/Callback<Lcom/vkontakte/android/api/Order;>;"
    new-instance v6, Lcom/vkontakte/android/api/orders/OrdersBuyItem;

    iget v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->appId:I

    invoke-direct {v6, v0, p1, p2, p3}, Lcom/vkontakte/android/api/orders/OrdersBuyItem;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    new-instance v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;

    move-object v1, p0

    move v2, p4

    move-object v3, p5

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;ILcom/vkontakte/android/api/Callback;Ljava/lang/String;Ljava/lang/String;)V

    .line 778
    invoke-virtual {v6, v0}, Lcom/vkontakte/android/api/orders/OrdersBuyItem;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 806
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 807
    return-void
.end method

.method private prepareAndShowShare(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "attachments"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 811
    const-string/jumbo v5, ","

    invoke-virtual {p3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 812
    .local v0, "attSplit":[Ljava/lang/String;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 813
    .local v4, "photoAtts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v3, ""

    .line 814
    .local v3, "link":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v5, v0

    if-ge v2, v5, :cond_2

    .line 815
    aget-object v5, v0, v2

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v2

    .line 817
    aget-object v5, v0, v2

    const-string/jumbo v6, "photo"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 818
    aget-object v5, v0, v2

    const/4 v6, 0x5

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 820
    :cond_0
    aget-object v5, v0, v2

    const-string/jumbo v6, "http"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 821
    aget-object v3, v0, v2

    .line 814
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 825
    :cond_2
    move-object v1, v3

    .line 827
    .local v1, "foundLink":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_4

    .line 828
    const/4 v5, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_3
    :goto_1
    packed-switch v5, :pswitch_data_0

    .line 836
    const-string/jumbo v5, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Unknown share target "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    const-string/jumbo v5, "fail"

    invoke-direct {p0, v5}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowShareBoxResponseToGame(Ljava/lang/String;)V

    .line 870
    :goto_2
    return-void

    .line 828
    :sswitch_0
    const-string/jumbo v6, "wall"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/4 v5, 0x0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v6, "im"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/4 v5, 0x1

    goto :goto_1

    .line 830
    :pswitch_0
    invoke-direct {p0, p2, v7, v3}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->doShowShareWall(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_2

    .line 833
    :pswitch_1
    invoke-direct {p0, p2, v7}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->doShowShareDialogs(Ljava/lang/String;Lcom/vkontakte/android/Photo;)V

    goto :goto_2

    .line 842
    :cond_4
    new-instance v5, Lcom/vkontakte/android/api/photos/PhotosGetById;

    invoke-direct {v5, v4}, Lcom/vkontakte/android/api/photos/PhotosGetById;-><init>(Ljava/util/ArrayList;)V

    new-instance v6, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;

    invoke-direct {v6, p0, p1, p2, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/photos/PhotosGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 867
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 868
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_2

    .line 828
    :sswitch_data_0
    .sparse-switch
        0xd24 -> :sswitch_1
        0x3791ca -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private processShowOrderBox(Ljava/lang/String;IIZLjava/lang/String;)V
    .locals 7
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "votes"    # I
    .param p3, "offerId"    # I
    .param p4, "currencyBool"    # Z
    .param p5, "item"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 737
    const/4 v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_1

    .line 766
    sget-object v0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown order type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 767
    const-string/jumbo v0, "fail"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowOrderBoxResponseToGame(Ljava/lang/String;)V

    .line 770
    :goto_1
    return-void

    .line 737
    :pswitch_0
    const-string/jumbo v1, "item"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v0, v3

    goto :goto_0

    .line 739
    :pswitch_1
    new-instance v6, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {v6, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 740
    .local v6, "progress":Landroid/app/ProgressDialog;
    invoke-virtual {v6, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 741
    invoke-virtual {v6, v3}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 742
    const v0, 0x7f08033d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 743
    invoke-static {v6}, Lcom/vkontakte/android/ViewUtils;->showDialogSafety(Landroid/app/Dialog;)V

    .line 744
    new-instance v5, Lcom/vkontakte/android/fragments/HtmlGameFragment$8;

    invoke-direct {v5, p0, v6}, Lcom/vkontakte/android/fragments/HtmlGameFragment$8;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;Landroid/app/ProgressDialog;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p5

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->invokeOrderBuyItem(Ljava/lang/String;Ljava/lang/String;IILcom/vkontakte/android/api/Callback;)V

    goto :goto_1

    .line 737
    :pswitch_data_0
    .packed-switch 0x317b13
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method

.method private static runJavascriptIn(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3
    .param p0, "wv"    # Landroid/webkit/WebView;
    .param p1, "javaScriptCode"    # Ljava/lang/String;

    .prologue
    .line 921
    if-eqz p0, :cond_0

    .line 922
    sget-object v0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Executing js code in the webview: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 923
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "javascript:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 925
    :cond_0
    return-void
.end method

.method private setupTheme()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/4 v8, -0x1

    .line 508
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v3

    .line 509
    .local v3, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {v3}, Landroid/support/v7/widget/Toolbar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 510
    .local v2, "lp":Landroid/view/ViewGroup$LayoutParams;
    const/high16 v5, 0x42000000    # 32.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 511
    const/high16 v5, -0x1000000

    invoke-virtual {v3, v5}, Landroid/support/v7/widget/Toolbar;->setBackgroundColor(I)V

    .line 513
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f0300d8

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 515
    .local v4, "toolbarContentViewGroup":Landroid/view/ViewGroup;
    new-instance v5, Landroid/support/v7/widget/Toolbar$LayoutParams;

    invoke-direct {v5, v8, v8}, Landroid/support/v7/widget/Toolbar$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 517
    const v5, 0x7f10032f

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 518
    .local v0, "buttonClose":Landroid/widget/ImageView;
    new-instance v5, Lcom/vkontakte/android/fragments/HtmlGameFragment$4;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$4;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 525
    const v5, 0x7f1002ad

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 526
    .local v1, "buttonMore":Landroid/widget/ImageView;
    new-instance v5, Lcom/vkontakte/android/fragments/HtmlGameFragment$5;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$5;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 545
    invoke-virtual {v3, v9, v9}, Landroid/support/v7/widget/Toolbar;->setContentInsetsRelative(II)V

    .line 547
    invoke-virtual {v3, v4}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;)V

    .line 549
    const v5, 0x7f100327

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->textViewTitle:Landroid/widget/TextView;

    .line 551
    return-void
.end method


# virtual methods
.method protected doLoadData()V
    .locals 2

    .prologue
    .line 401
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->urlToLoad:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 402
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 465
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 466
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/AndroidBug5497Workaround;->assist(Landroid/app/Activity;)Lcom/vk/core/util/AndroidBug5497Workaround;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->bug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround;

    .line 467
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/16 v2, 0xf3f

    const/4 v3, -0x1

    .line 593
    if-ne p1, v2, :cond_3

    if-ne p2, v3, :cond_3

    if-eqz p3, :cond_3

    .line 595
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 596
    .local v1, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const-string/jumbo v2, "result"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    .line 597
    .local v0, "item":Landroid/os/Parcelable;
    instance-of v3, v0, Lcom/vkontakte/android/UserProfile;

    if-eqz v3, :cond_0

    .line 598
    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .end local v0    # "item":Landroid/os/Parcelable;
    iget v3, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 602
    :cond_1
    iget v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->appId:I

    invoke-static {v2, v1}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->createAppInviteRequest(ILjava/util/ArrayList;)Lcom/vkontakte/android/api/apps/AppsSendRequest;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/fragments/HtmlGameFragment$6;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$6;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V

    .line 603
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 614
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 615
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 629
    .end local v1    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_2
    :goto_1
    return-void

    .line 616
    :cond_3
    if-ne p1, v2, :cond_4

    if-eq p2, v3, :cond_4

    .line 617
    const-string/jumbo v2, "cancel"

    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowInviteBoxResponseToGame(Ljava/lang/String;)V

    goto :goto_1

    .line 618
    :cond_4
    const/4 v2, 0x1

    if-ne p1, v2, :cond_6

    .line 619
    if-ne p2, v3, :cond_5

    sget-object v2, Lcom/vkontakte/android/fragments/HtmlGameFragment;->SUCCEEDED_KEY:Ljava/lang/String;

    :goto_2
    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowRequestBoxResponseToGame(Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    sget-object v2, Lcom/vkontakte/android/fragments/HtmlGameFragment;->CANCELLED_KEY:Ljava/lang/String;

    goto :goto_2

    .line 620
    :cond_6
    const/16 v2, 0xc

    if-ne p1, v2, :cond_8

    .line 621
    if-ne p2, v3, :cond_7

    sget-object v2, Lcom/vkontakte/android/fragments/HtmlGameFragment;->SUCCEEDED_KEY:Ljava/lang/String;

    :goto_3
    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowShareBoxResponseToGame(Ljava/lang/String;)V

    goto :goto_1

    :cond_7
    sget-object v2, Lcom/vkontakte/android/fragments/HtmlGameFragment;->CANCELLED_KEY:Ljava/lang/String;

    goto :goto_3

    .line 622
    :cond_8
    const/16 v2, 0xd

    if-ne p1, v2, :cond_2

    .line 623
    if-ne p2, v3, :cond_9

    .line 624
    const-string/jumbo v2, "success"

    const-string/jumbo v3, "access_token"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowSettingsBoxResponseToGame(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 626
    :cond_9
    const-string/jumbo v2, "cancel"

    const-string/jumbo v3, ""

    invoke-direct {p0, v2, v3}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowSettingsBoxResponseToGame(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 929
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 930
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 931
    const/4 v0, 0x1

    .line 933
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 389
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 391
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_url"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->urlToLoad:Ljava/lang/String;

    .line 392
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->ownerId:I

    .line 393
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "app_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->appId:I

    .line 394
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "url_to_copy"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->urlToCopy:Ljava/lang/String;

    .line 395
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "screen_title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->screenTitle:Ljava/lang/String;

    .line 396
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 427
    new-instance v1, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    .line 428
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    const v2, 0x7f10008f

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setId(I)V

    .line 430
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 431
    .local v0, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 433
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 434
    sget-object v1, Lcom/vkontakte/android/fragments/HtmlGameFragment;->CACHE_PATH:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 436
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 438
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 440
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 441
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 442
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 444
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 445
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 451
    :cond_0
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 453
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webViewClient:Landroid/webkit/WebViewClient;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 454
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 456
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    new-instance v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V

    const-string/jumbo v3, "AndroidBridge"

    invoke-virtual {v1, v2, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 458
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    return-object v1
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 471
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroy()V

    .line 472
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->bug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround;

    if-eqz v0, :cond_0

    .line 473
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->bug5497Workaround:Lcom/vk/core/util/AndroidBug5497Workaround;

    invoke-virtual {v0}, Lcom/vk/core/util/AndroidBug5497Workaround;->destroy()V

    .line 475
    :cond_0
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 406
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroyView()V

    .line 407
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 408
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 409
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 410
    iput-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    .line 411
    return-void
.end method

.method public onLeaderboardDismissed()V
    .locals 1

    .prologue
    .line 632
    const-string/jumbo v0, "success"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->dispatchShowLeaderboardResponseToGame(Ljava/lang/String;)V

    .line 633
    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 555
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 579
    const/4 v3, 0x0

    :goto_0
    return v3

    .line 557
    :pswitch_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->urlToCopy:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->urlToCopy:Ljava/lang/String;

    .line 558
    .local v2, "url":Ljava/lang/String;
    :goto_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string/jumbo v4, "clipboard"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 559
    .local v1, "clipboard":Landroid/content/ClipboardManager;
    invoke-static {v2, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 560
    .local v0, "clip":Landroid/content/ClipData;
    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 561
    const/4 v3, 0x1

    goto :goto_0

    .line 557
    .end local v0    # "clip":Landroid/content/ClipData;
    .end local v1    # "clipboard":Landroid/content/ClipboardManager;
    .end local v2    # "url":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->urlToLoad:Ljava/lang/String;

    goto :goto_1

    .line 555
    :pswitch_data_0
    .packed-switch 0x7f10000f
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 421
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onPause()V

    .line 422
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    .line 423
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 385
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 415
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onResume()V

    .line 416
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    .line 417
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 479
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 481
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 482
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->loadData()V

    .line 486
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    if-nez v0, :cond_1

    .line 487
    new-instance v0, Lcom/vkontakte/android/api/apps/AppsGet;

    iget v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->appId:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/apps/AppsGet;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/HtmlGameFragment$3;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$3;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/apps/AppsGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 497
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 500
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->setupTheme()V

    .line 502
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->screenTitle:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 503
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->screenTitle:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 505
    :cond_2
    return-void
.end method

.method protected setTitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 585
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->textViewTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 586
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment;->textViewTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 588
    :cond_0
    return-void
.end method

.method tryParseLong(Ljava/lang/String;)Z
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 949
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 950
    const/4 v1, 0x1

    .line 952
    :goto_0
    return v1

    .line 951
    :catch_0
    move-exception v0

    .line 952
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/4 v1, 0x0

    goto :goto_0
.end method
