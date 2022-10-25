.class Lcom/vkontakte/android/fragments/ProfileFragment$21;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->setStatus(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field final synthetic val$status:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 2809
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->val$status:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 2827
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 2828
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->val$status:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3100(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;)V

    .line 2829
    return-void
.end method

.method public success()V
    .locals 3

    .prologue
    .line 2813
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->val$status:Ljava/lang/String;

    iput-object v2, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    .line 2814
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2400(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 2815
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateList()V

    .line 2816
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2817
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->val$status:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/auth/VKAccountEditor;->setStatus(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccountEditor;->commit()V

    .line 2818
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$21;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 2819
    .local v0, "activity":Landroid/app/Activity;
    instance-of v1, v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;

    if-eqz v1, :cond_0

    .line 2820
    check-cast v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;

    .end local v0    # "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->updateUserInfo()V

    .line 2823
    :cond_0
    return-void
.end method
