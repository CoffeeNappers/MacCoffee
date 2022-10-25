.class Lcom/vkontakte/android/fragments/ProfileFragment$32;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->toggleLiveSubscription()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Landroid/app/Activity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 3187
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$32;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$32;->val$activity:Landroid/app/Activity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 3190
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$32;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$32;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->isLiveSubscribed:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->isLiveSubscribed:Z

    .line 3191
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$32;->val$activity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 3192
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$32;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->invalidateOptionsMenu()V

    .line 3193
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$32;->val$activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$32;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$32;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->isLiveSubscribed:Z

    if-eqz v0, :cond_2

    const v0, 0x7f08075a

    :goto_1
    invoke-virtual {v3, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 3195
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 3197
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 3190
    goto :goto_0

    .line 3193
    :cond_2
    const v0, 0x7f08075b

    goto :goto_1
.end method
