.class Lcom/vkontakte/android/fragments/ProfileFragment$22$1$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/fragments/ProfileFragment$22$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$22$1;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/fragments/ProfileFragment$22$1;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 2898
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1$1;->this$2:Lcom/vkontakte/android/fragments/ProfileFragment$22$1;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 2901
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1$1;->this$2:Lcom/vkontakte/android/fragments/ProfileFragment$22$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->blacklisted:Z

    .line 2902
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1$1;->this$2:Lcom/vkontakte/android/fragments/ProfileFragment$22$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->invalidateOptionsMenu()V

    .line 2904
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1$1;->this$2:Lcom/vkontakte/android/fragments/ProfileFragment$22$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22$1$1;->this$2:Lcom/vkontakte/android/fragments/ProfileFragment$22$1;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$22;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$22;->val$msg:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$700(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)V

    .line 2905
    return-void
.end method
