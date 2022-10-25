.class Lcom/vkontakte/android/fragments/WebViewFragment$2;
.super Landroid/webkit/WebChromeClient;
.source "WebViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/WebViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/WebViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/WebViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/WebViewFragment;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method private createImageCaptureIntent()Landroid/content/Intent;
    .locals 4

    .prologue
    .line 283
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 284
    .local v1, "takePictureIntent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/WebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 285
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getPhotoFile()Ljava/io/File;

    move-result-object v0

    .line 286
    .local v0, "file":Ljava/io/File;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$602(Lcom/vkontakte/android/fragments/WebViewFragment;Landroid/net/Uri;)Landroid/net/Uri;

    .line 287
    const-string/jumbo v2, "output"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$600(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 290
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "takePictureIntent":Landroid/content/Intent;
    :goto_0
    return-object v1

    .restart local v1    # "takePictureIntent":Landroid/content/Intent;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private createVideoCaptureIntent()Landroid/content/Intent;
    .locals 4

    .prologue
    .line 294
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.media.action.VIDEO_CAPTURE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 295
    .local v1, "takePictureIntent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/WebViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 296
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVideoFile()Ljava/io/File;

    move-result-object v0

    .line 297
    .local v0, "file":Ljava/io/File;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$702(Lcom/vkontakte/android/fragments/WebViewFragment;Landroid/net/Uri;)Landroid/net/Uri;

    .line 298
    const-string/jumbo v2, "output"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$700(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 301
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "takePictureIntent":Landroid/content/Intent;
    :goto_0
    return-object v1

    .restart local v1    # "takePictureIntent":Landroid/content/Intent;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private startChooser(Landroid/content/Intent;)V
    .locals 6
    .param p1, "getContentIntent"    # Landroid/content/Intent;

    .prologue
    .line 262
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 264
    .local v2, "intentArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/Intent;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/WebViewFragment$2;->createImageCaptureIntent()Landroid/content/Intent;

    move-result-object v1

    .line 265
    .local v1, "imageCaptureIntent":Landroid/content/Intent;
    if-eqz v1, :cond_0

    .line 266
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/WebViewFragment$2;->createVideoCaptureIntent()Landroid/content/Intent;

    move-result-object v3

    .line 270
    .local v3, "videoCaptureIntent":Landroid/content/Intent;
    if-eqz v3, :cond_1

    .line 271
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.CHOOSER"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 276
    .local v0, "chooserIntent":Landroid/content/Intent;
    const-string/jumbo v4, "android.intent.extra.INTENT"

    invoke-virtual {v0, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 277
    const-string/jumbo v5, "android.intent.extra.INITIAL_INTENTS"

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Landroid/content/Intent;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Landroid/os/Parcelable;

    invoke-virtual {v0, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 279
    iget-object v4, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    const/16 v5, 0x270f

    invoke-virtual {v4, v0, v5}, Lcom/vkontakte/android/fragments/WebViewFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 280
    return-void
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 3
    .param p1, "consoleMessage"    # Landroid/webkit/ConsoleMessage;

    .prologue
    .line 168
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "WebChromeClient"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->lineNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->sourceId()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 169
    invoke-super {p0, p1}, Landroid/webkit/WebChromeClient;->onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z

    move-result v0

    return v0
.end method

.method public onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "isDialog"    # Z
    .param p3, "isUserGesture"    # Z
    .param p4, "resultMsg"    # Landroid/os/Message;

    .prologue
    .line 181
    iget-object v0, p4, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/webkit/WebView$WebViewTransport;

    .line 182
    .local v0, "t":Landroid/webkit/WebView$WebViewTransport;
    new-instance v1, Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 183
    .local v1, "w":Landroid/webkit/WebView;
    new-instance v2, Lcom/vkontakte/android/fragments/WebViewFragment$2$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/WebViewFragment$2$1;-><init>(Lcom/vkontakte/android/fragments/WebViewFragment$2;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 193
    invoke-virtual {v0, v1}, Landroid/webkit/WebView$WebViewTransport;->setWebView(Landroid/webkit/WebView;)V

    .line 194
    invoke-virtual {p4}, Landroid/os/Message;->sendToTarget()V

    .line 195
    const/4 v2, 0x1

    return v2
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 4
    .param p1, "origin"    # Ljava/lang/String;
    .param p2, "callback"    # Landroid/webkit/GeolocationPermissions$Callback;

    .prologue
    .line 201
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/WebViewFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 202
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v1, 0x7f08015f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f08015e

    .line 203
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080798

    new-instance v3, Lcom/vkontakte/android/fragments/WebViewFragment$2$3;

    invoke-direct {v3, p0, p2, p1}, Lcom/vkontakte/android/fragments/WebViewFragment$2$3;-><init>(Lcom/vkontakte/android/fragments/WebViewFragment$2;Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;)V

    .line 204
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080433

    new-instance v3, Lcom/vkontakte/android/fragments/WebViewFragment$2$2;

    invoke-direct {v3, p0, p2, p1}, Lcom/vkontakte/android/fragments/WebViewFragment$2$2;-><init>(Lcom/vkontakte/android/fragments/WebViewFragment$2;Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;)V

    .line 210
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 216
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 218
    return-void
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$100(Lcom/vkontakte/android/fragments/WebViewFragment;)Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    move-result-object v0

    mul-int/lit8 v1, p2, 0x64

    invoke-virtual {v0, v1}, Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;->setProgress(I)V

    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$100(Lcom/vkontakte/android/fragments/WebViewFragment;)Lme/zhanghai/android/materialprogressbar/MaterialProgressBar;

    move-result-object v1

    const/16 v0, 0x64

    if-ne p2, v0, :cond_1

    const/16 v0, 0x8

    :goto_0
    invoke-static {v1, v0}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 161
    if-lez p2, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/WebViewFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/WebViewFragment;->dataLoaded()V

    .line 164
    :cond_0
    return-void

    .line 160
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$200(Lcom/vkontakte/android/fragments/WebViewFragment;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v0, p2}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$300(Lcom/vkontakte/android/fragments/WebViewFragment;Ljava/lang/CharSequence;)V

    .line 177
    :cond_0
    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 2
    .param p1, "mWebView"    # Landroid/webkit/WebView;
    .param p3, "fileChooserParams"    # Landroid/webkit/WebChromeClient$FileChooserParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback",
            "<[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 246
    .local p2, "filePathCallback":Landroid/webkit/ValueCallback;, "Landroid/webkit/ValueCallback<[Landroid/net/Uri;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$500(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/webkit/ValueCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$500(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/webkit/ValueCallback;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 250
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1

    .line 251
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v0, p2}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$502(Lcom/vkontakte/android/fragments/WebViewFragment;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;

    .line 253
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/WebViewFragment$2;->startChooser(Landroid/content/Intent;)V

    .line 255
    const/4 v0, 0x1

    .line 258
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;)V
    .locals 3
    .param p2, "acceptType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 231
    .local p1, "uploadMsg":Landroid/webkit/ValueCallback;, "Landroid/webkit/ValueCallback<Landroid/net/Uri;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$400(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/webkit/ValueCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 232
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$400(Lcom/vkontakte/android/fragments/WebViewFragment;)Landroid/webkit/ValueCallback;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 235
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/WebViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WebViewFragment;

    invoke-static {v1, p1}, Lcom/vkontakte/android/fragments/WebViewFragment;->access$402(Lcom/vkontakte/android/fragments/WebViewFragment;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;

    .line 237
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 238
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 239
    const-string/jumbo v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/WebViewFragment$2;->startChooser(Landroid/content/Intent;)V

    .line 242
    return-void
.end method

.method public openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "acceptType"    # Ljava/lang/String;
    .param p3, "capture"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "uploadMsg":Landroid/webkit/ValueCallback;, "Landroid/webkit/ValueCallback<Landroid/net/Uri;>;"
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/WebViewFragment$2;->openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;)V

    .line 226
    return-void
.end method
