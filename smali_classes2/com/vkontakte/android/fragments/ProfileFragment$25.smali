.class Lcom/vkontakte/android/fragments/ProfileFragment$25;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->toggleNewsHidden()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 3001
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$25;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 3004
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$25;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$25;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const v3, 0x7f080740

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$25;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v0

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$25;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const v5, 0x7f0802ed

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    aput-object v0, v4, v6

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 3005
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$25;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iput-boolean v6, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->isHiddenFromFeed:Z

    .line 3006
    return-void

    .line 3004
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$25;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    goto :goto_0
.end method
