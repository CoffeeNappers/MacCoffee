.class Lcom/vkontakte/android/fragments/ProfileFragment$33;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->doToggleBlacklist()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/app/Fragment;Landroid/app/Activity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 3203
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->val$activity:Landroid/app/Activity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 3206
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->blacklisted:Z

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->blacklisted:Z

    .line 3207
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->invalidateOptionsMenu()V

    .line 3208
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->val$activity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 3209
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->val$activity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->blacklisted:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v0, :cond_2

    const v0, 0x7f08073c

    :goto_1
    new-array v1, v1, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v5, v1, v2

    invoke-virtual {v4, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 3211
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 3206
    goto :goto_0

    .line 3209
    :cond_2
    const v0, 0x7f08073d

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$33;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v0, :cond_4

    const v0, 0x7f080746

    goto :goto_1

    :cond_4
    const v0, 0x7f080747

    goto :goto_1
.end method
