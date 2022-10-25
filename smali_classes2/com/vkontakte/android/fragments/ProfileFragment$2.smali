.class Lcom/vkontakte/android/fragments/ProfileFragment$2;
.super Landroid/content/BroadcastReceiver;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 272
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$2;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 275
    const-string/jumbo v1, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 276
    const-string/jumbo v1, "id"

    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 277
    .local v0, "id":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$2;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 278
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$2;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$200(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 281
    .end local v0    # "id":I
    :cond_0
    const-string/jumbo v1, "com.vkontakte.android.RELOAD_PROFILE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 282
    const-string/jumbo v1, "id"

    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 283
    .restart local v0    # "id":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$2;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 284
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$2;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$300(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 287
    .end local v0    # "id":I
    :cond_1
    return-void
.end method
