.class Lcom/vkontakte/android/VKApplication$2;
.super Ljava/lang/Object;
.source "VKApplication.java"

# interfaces
.implements Lcom/vkontakte/android/utils/L$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/VKApplication;->initLog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/VKApplication;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/VKApplication;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/VKApplication;

    .prologue
    .line 278
    iput-object p1, p0, Lcom/vkontakte/android/VKApplication$2;->this$0:Lcom/vkontakte/android/VKApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isLogEnable()Z
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/VKApplication$2;->this$0:Lcom/vkontakte/android/VKApplication;

    invoke-static {v0}, Lcom/vkontakte/android/VKApplication;->access$000(Lcom/vkontakte/android/VKApplication;)Z

    move-result v0

    return v0
.end method

.method public onCapture(Ljava/lang/String;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 286
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 287
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 288
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v2, Lcom/vkontakte/android/upload/DocumentUploadTask;

    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    const/4 v5, 0x0

    invoke-direct {v2, v3, p1, v4, v5}, Lcom/vkontakte/android/upload/DocumentUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZ)V

    invoke-static {v1, v2}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 290
    :cond_0
    return-void
.end method
