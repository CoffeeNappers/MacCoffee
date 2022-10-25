.class final Lcom/vk/sharing/SharingService$MessageJobHandler;
.super Lcom/vk/sharing/SharingService$JobHandler;
.source "SharingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/SharingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MessageJobHandler"
.end annotation


# static fields
.field private static final PREF_NEXT_ID:Ljava/lang/String; = "nextId2"


# instance fields
.field private preferences:Landroid/content/SharedPreferences;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;)V
    .locals 0
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 211
    invoke-direct {p0}, Lcom/vk/sharing/SharingService$JobHandler;-><init>()V

    .line 212
    iput-object p1, p0, Lcom/vk/sharing/SharingService$MessageJobHandler;->preferences:Landroid/content/SharedPreferences;

    .line 213
    return-void
.end method

.method private generateRandomId()I
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 241
    invoke-direct {p0}, Lcom/vk/sharing/SharingService$MessageJobHandler;->nextId()I

    move-result v0

    .line 243
    .local v0, "nextId":I
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getAccessToken()Ljava/lang/String;

    move-result-object v1

    .line 244
    .local v1, "token":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x4

    if-lt v3, v4, :cond_0

    .line 245
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v3, v4

    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v3, v4

    const/4 v4, 0x3

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    shl-int/lit8 v4, v4, 0x18

    or-int/2addr v3, v4

    xor-int/2addr v0, v3

    .line 250
    .end local v0    # "nextId":I
    .end local v1    # "token":Ljava/lang/String;
    :cond_0
    :goto_0
    return v0

    .line 247
    .restart local v0    # "nextId":I
    :catch_0
    move-exception v2

    .line 248
    .local v2, "x":Ljava/lang/Exception;
    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private nextId()I
    .locals 4

    .prologue
    const v3, 0x7fffffff

    .line 254
    iget-object v1, p0, Lcom/vk/sharing/SharingService$MessageJobHandler;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "nextId2"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 255
    .local v0, "id":I
    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 256
    iget-object v1, p0, Lcom/vk/sharing/SharingService$MessageJobHandler;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "nextId2"

    add-int/lit8 v3, v0, -0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 260
    :goto_0
    return v0

    .line 258
    :cond_0
    iget-object v1, p0, Lcom/vk/sharing/SharingService$MessageJobHandler;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "nextId2"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0
.end method


# virtual methods
.method onFailed()V
    .locals 1

    .prologue
    .line 265
    const v0, 0x7f080678

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 266
    return-void
.end method

.method public onHandle(Landroid/content/Intent;)Z
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 217
    const-string/jumbo v3, "attachment_info"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/attachment/AttachmentInfo;

    .line 218
    .local v0, "info":Lcom/vk/sharing/attachment/AttachmentInfo;
    const-string/jumbo v3, "target"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vk/sharing/target/Target;

    .line 219
    .local v1, "target":Lcom/vk/sharing/target/Target;
    const-string/jumbo v3, "text"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 221
    .local v2, "text":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 222
    const/4 v3, 0x0

    .line 237
    :goto_0
    return v3

    .line 225
    :cond_0
    new-instance v3, Lcom/vkontakte/android/api/messages/MessagesSend;

    iget v4, v1, Lcom/vk/sharing/target/Target;->id:I

    invoke-direct {p0}, Lcom/vk/sharing/SharingService$MessageJobHandler;->generateRandomId()I

    move-result v5

    invoke-static {v0}, Lcom/vk/sharing/attachment/Attachments;->toString(Lcom/vk/sharing/attachment/AttachmentInfo;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v5, v2, v6}, Lcom/vkontakte/android/api/messages/MessagesSend;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    new-instance v4, Lcom/vk/sharing/SharingService$MessageJobHandler$1;

    invoke-direct {v4, p0}, Lcom/vk/sharing/SharingService$MessageJobHandler$1;-><init>(Lcom/vk/sharing/SharingService$MessageJobHandler;)V

    .line 226
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/messages/MessagesSend;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 237
    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v3

    goto :goto_0
.end method

.method onSuccess()V
    .locals 1

    .prologue
    .line 270
    const v0, 0x7f08067a

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 271
    return-void
.end method
