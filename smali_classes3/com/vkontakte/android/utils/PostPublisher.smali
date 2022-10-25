.class public Lcom/vkontakte/android/utils/PostPublisher;
.super Ljava/lang/Object;
.source "PostPublisher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;
    }
.end annotation


# instance fields
.field private final callback:Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private isPublishing:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private progressDialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;)V
    .locals 2
    .param p1, "callback"    # Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->isPublishing:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 54
    iput-object p1, p0, Lcom/vkontakte/android/utils/PostPublisher;->callback:Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/utils/PostPublisher;Landroid/content/Context;Ljava/lang/CharSequence;[Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/utils/PostPublisher;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/CharSequence;
    .param p3, "x3"    # [Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/utils/PostPublisher;->publishPostInner(Landroid/content/Context;Ljava/lang/CharSequence;[Lcom/vkontakte/android/attachments/Attachment;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/utils/PostPublisher;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/utils/PostPublisher;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/vkontakte/android/utils/PostPublisher;->onError(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/utils/PostPublisher;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/utils/PostPublisher;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/utils/PostPublisher;->onSuccess()V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/utils/PostPublisher;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/utils/PostPublisher;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/utils/PostPublisher;->endPublishing()V

    return-void
.end method

.method private endPublishing()V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->isPublishing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 82
    invoke-direct {p0}, Lcom/vkontakte/android/utils/PostPublisher;->hideProgress()V

    .line 83
    return-void
.end method

.method private hideProgress()V
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    .line 73
    :cond_0
    return-void
.end method

.method private onError(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/vkontakte/android/utils/PostPublisher;->endPublishing()V

    .line 87
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->callback:Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;->onError(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 88
    return-void
.end method

.method private onSuccess()V
    .locals 1

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/vkontakte/android/utils/PostPublisher;->endPublishing()V

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->callback:Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;

    invoke-interface {v0}, Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;->onSuccess()V

    .line 93
    return-void
.end method

.method private publishPostInner(Landroid/content/Context;Ljava/lang/CharSequence;[Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 10
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "inputText"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "atts"    # [Lcom/vkontakte/android/attachments/Attachment;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 170
    new-instance v1, Lcom/vkontakte/android/utils/PostPublisher$2;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/utils/PostPublisher$2;-><init>(Lcom/vkontakte/android/utils/PostPublisher;Landroid/content/Context;)V

    .line 201
    .local v1, "callback":Lcom/vkontakte/android/api/Callback;, "Lcom/vkontakte/android/api/Callback<Lorg/json/JSONObject;>;"
    const/4 v4, 0x0

    .line 202
    .local v4, "exportToTwitter":Z
    const/4 v3, 0x0

    .line 203
    .local v3, "exportToFacebook":Z
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 204
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    .line 205
    .local v6, "uid":I
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isExportTwitterAvail()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 206
    const/4 v4, 0x1

    .line 208
    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isExportFacebookAvail()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 209
    const/4 v3, 0x1

    .line 211
    :cond_1
    const/4 v2, 0x0

    .line 212
    .local v2, "exportParam":Ljava/lang/String;
    if-eqz v3, :cond_4

    if-eqz v4, :cond_4

    .line 213
    const-string/jumbo v2, "twitter,facebook"

    .line 219
    :cond_2
    :goto_0
    new-instance v5, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v7, "execute.wallPost"

    invoke-direct {v5, v7}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 220
    .local v5, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    const-string/jumbo v7, "device"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 221
    const-string/jumbo v7, "owner_id"

    invoke-virtual {v5, v7, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 223
    if-eqz p3, :cond_6

    array-length v7, p3

    if-lez v7, :cond_6

    .line 224
    const-string/jumbo v7, "attachments"

    const-string/jumbo v8, ","

    invoke-static {v8, p3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 229
    :goto_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 230
    const-string/jumbo v7, "message"

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 232
    :cond_3
    const-string/jumbo v7, "ref"

    const-string/jumbo v8, "advice_post"

    invoke-virtual {v5, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 233
    const-string/jumbo v7, "friends_only"

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 234
    const-string/jumbo v7, "services"

    invoke-virtual {v5, v7, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    .line 235
    invoke-virtual {v7, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    .line 236
    invoke-virtual {v7, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 237
    return-void

    .line 214
    .end local v5    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    :cond_4
    if-eqz v4, :cond_5

    .line 215
    const-string/jumbo v2, "twitter"

    goto/16 :goto_0

    .line 216
    :cond_5
    if-eqz v3, :cond_2

    .line 217
    const-string/jumbo v2, "facebook"

    goto/16 :goto_0

    .line 226
    .restart local v5    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    :cond_6
    const-string/jumbo v7, "attachments"

    const-string/jumbo v8, " "

    invoke-virtual {v5, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1
.end method

.method private showProgress(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 58
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08033d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 63
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, 0x7f0203d2

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 66
    :cond_0
    return-void
.end method

.method private startPublishing(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/utils/PostPublisher;->isPublishing:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 77
    invoke-direct {p0, p1}, Lcom/vkontakte/android/utils/PostPublisher;->showProgress(Landroid/content/Context;)V

    .line 78
    return-void
.end method


# virtual methods
.method public publishPost(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/util/ArrayList;)V
    .locals 12
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "message"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/CharSequence;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    const/4 v6, 0x0

    .line 99
    iget-object v1, p0, Lcom/vkontakte/android/utils/PostPublisher;->isPublishing:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 165
    :cond_0
    :goto_0
    return-void

    .line 102
    :cond_1
    invoke-direct {p0, p1}, Lcom/vkontakte/android/utils/PostPublisher;->startPublishing(Landroid/content/Context;)V

    .line 105
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 106
    :cond_2
    invoke-direct {p0, p1, p2, v6}, Lcom/vkontakte/android/utils/PostPublisher;->publishPostInner(Landroid/content/Context;Ljava/lang/CharSequence;[Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_0

    .line 108
    :cond_3
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    const v5, 0x3b9aca00

    invoke-virtual {v1, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    const v5, 0x2f169

    add-int v2, v1, v5

    .line 109
    .local v2, "startId":I
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v10

    .line 110
    .local v10, "oid":I
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v7, v1, [Lcom/vkontakte/android/upload/PhotoUploadTask;

    .line 111
    .local v7, "uploadTasks":[Lcom/vkontakte/android/upload/PhotoUploadTask;
    array-length v1, v7

    new-array v8, v1, [Lcom/vkontakte/android/upload/UploadListener;

    .line 112
    .local v8, "listeners":[Lcom/vkontakte/android/upload/UploadListener;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    array-length v1, v7

    if-ge v9, v1, :cond_4

    .line 113
    new-instance v5, Lcom/vkontakte/android/upload/WallPhotoUploadTask;

    invoke-virtual {p3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, p1, v1, v10}, Lcom/vkontakte/android/upload/WallPhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    aput-object v5, v7, v9

    .line 114
    add-int v11, v2, v9

    .line 115
    .local v11, "taskId":I
    aget-object v1, v7, v9

    invoke-virtual {v1, v11}, Lcom/vkontakte/android/upload/PhotoUploadTask;->setID(I)V

    .line 116
    new-instance v1, Lcom/vkontakte/android/upload/UploadListener;

    invoke-direct {v1, v11, v6}, Lcom/vkontakte/android/upload/UploadListener;-><init>(ILcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;)V

    aput-object v1, v8, v9

    .line 112
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 118
    .end local v11    # "taskId":I
    :cond_4
    array-length v1, v7

    new-array v3, v1, [Lcom/vkontakte/android/attachments/Attachment;

    .line 120
    .local v3, "attachments":[Lcom/vkontakte/android/attachments/Attachment;
    new-instance v4, Ljava/util/concurrent/atomic/AtomicInteger;

    array-length v1, v3

    invoke-direct {v4, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 122
    .local v4, "counter":Ljava/util/concurrent/atomic/AtomicInteger;
    new-instance v0, Lcom/vkontakte/android/utils/PostPublisher$1;

    move-object v1, p0

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/utils/PostPublisher$1;-><init>(Lcom/vkontakte/android/utils/PostPublisher;I[Lcom/vkontakte/android/attachments/Attachment;Ljava/util/concurrent/atomic/AtomicInteger;Landroid/content/Context;Ljava/lang/CharSequence;[Lcom/vkontakte/android/upload/PhotoUploadTask;[Lcom/vkontakte/android/upload/UploadListener;)V

    .line 159
    .local v0, "uploadListenerCallback":Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;
    const/4 v9, 0x0

    :goto_2
    array-length v1, v8

    if-ge v9, v1, :cond_0

    .line 160
    aget-object v1, v8, v9

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/upload/UploadListener;->setUploadListenerCallback(Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;)V

    .line 161
    aget-object v1, v8, v9

    invoke-virtual {v1}, Lcom/vkontakte/android/upload/UploadListener;->startListener()V

    .line 162
    aget-object v1, v7, v9

    invoke-static {p1, v1}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 159
    add-int/lit8 v9, v9, 0x1

    goto :goto_2
.end method
