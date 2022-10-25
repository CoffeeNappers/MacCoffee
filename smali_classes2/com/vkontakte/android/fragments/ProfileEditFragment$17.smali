.class Lcom/vkontakte/android/fragments/ProfileEditFragment$17;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ProfileEditFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->deletePhoto()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 663
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$17;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 663
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment$17;->success(Ljava/lang/String;)V

    return-void
.end method

.method public success(Ljava/lang/String;)V
    .locals 3
    .param p1, "newPhoto"    # Ljava/lang/String;

    .prologue
    .line 666
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$17;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v1, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Ljava/lang/String;)V

    .line 668
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 669
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "photo"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 670
    const-string/jumbo v1, "id"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 671
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$17;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 673
    return-void
.end method
