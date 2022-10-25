.class Lcom/vk/music/utils/BoomHelper$2;
.super Ljava/lang/Object;
.source "BoomHelper.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/utils/BoomHelper;->loadTrack(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;Lcom/vk/music/utils/BoomHelper$From;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/utils/BoomHelper;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$from:Lcom/vk/music/utils/BoomHelper$From;


# direct methods
.method constructor <init>(Lcom/vk/music/utils/BoomHelper;Landroid/content/Context;Lcom/vk/music/utils/BoomHelper$From;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/utils/BoomHelper;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vk/music/utils/BoomHelper$2;->this$0:Lcom/vk/music/utils/BoomHelper;

    iput-object p2, p0, Lcom/vk/music/utils/BoomHelper$2;->val$ctx:Landroid/content/Context;

    iput-object p3, p0, Lcom/vk/music/utils/BoomHelper$2;->val$from:Lcom/vk/music/utils/BoomHelper$From;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vk/music/utils/BoomHelper$2;->this$0:Lcom/vk/music/utils/BoomHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/utils/BoomHelper;->access$002(Lcom/vk/music/utils/BoomHelper;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 72
    return-void
.end method

.method public success(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 63
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/vk/music/utils/BoomHelper$2;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/vk/music/utils/BoomHelper$2;->val$from:Lcom/vk/music/utils/BoomHelper$From;

    invoke-static {v0, v1}, Lcom/vk/music/utils/BoomHelper;->openBoom(Landroid/content/Context;Lcom/vk/music/utils/BoomHelper$From;)V

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/vk/music/utils/BoomHelper$2;->this$0:Lcom/vk/music/utils/BoomHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/music/utils/BoomHelper;->access$002(Lcom/vk/music/utils/BoomHelper;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 67
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 60
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vk/music/utils/BoomHelper$2;->success(Ljava/lang/Boolean;)V

    return-void
.end method
